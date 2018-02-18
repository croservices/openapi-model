use OpenAPI::Model;

class X::OpenAPI::Model::TypeMismatch is Exception {
    has $.name;
    has $.field;
    has @.expected;
    has $.got;

    method message() {
        "Schema for $!name object expects {@!expected.map(*.^name).join(', ')} for field '$!field', but got {$!got.^name}"
    }
}

role OpenAPI::Model::Element [:%scalar, :%object] {
    has OpenAPI::Model $.model;
    has %.extensions;
    my %attr-lookup = ::?CLASS.^attributes(:local).map({ .name.substr(2) => $_ });

    method set-model($!model) {}

    method deserialize($source) {}
    method serialize() {}

    submethod BUILD(*%args where {(%scalar.keys (|) %object.keys) (-) .keys === set()}) {
        for %args.kv -> $k, $v {
            my $normalized-name = (%scalar{$k} // %object{$k})<attr>;
            my $attr = %attr-lookup{$normalized-name};
            if ($k (elem) %scalar.keys) {
                $attr.set_value(self, $v);
            } elsif ($k (elem) %object.keys) {
                my $attr-type = $v ~~ Positional ?? [%object{$k}<type>] !! %object{$k}<type>;
                if ($v ~~ $attr-type) {
                    $attr.set_value(self, $v);
                } else {
                    die X::OpenAPI::Model::TypeMismatch.new(
                        name => ::?CLASS.^name,
                        field => $k,
                        expected => %object{$k}<type>,
                        got => $v
                    );
                }
            }
        }
    }
}
