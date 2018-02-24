use JSON::Fast;

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
    has $.model;
    has %.extensions;
    my %attr-lookup = ::?CLASS.^attributes(:local).map({ .name.substr(2) => $_ });

    method set-model($!model) {}

    method deserialize($source) {
        my %attrs;
        for $source.kv -> $k, $v {
            %attrs{$k} = $k (elem) %scalar.keys ??
                       $v !!
                       %object{$k}<array> ??
                       $v.map({%object{$k}<type>.new(|$_)}).Array !!
                       %object{$k}<type>.new(|$v);
        }
        self.new(|%attrs);
    }
    method serialize() {
        my %structure;
        for %scalar.kv -> $k, $v {
            %structure{$k} = %attr-lookup{%scalar{$k}<attr>}.get_value(self);
        }
        for %object.kv -> $k, $v {
            %structure{$k} = %attr-lookup{%object{$k}<attr>}.get_value(self).serialize;
        }
        %structure;
    }

    submethod BUILD(*%args where {
                           my $keys = .keys (-) (%scalar.keys (|) %object.keys);
                           $keys .= grep({ not .key.starts-with('x-') });
                           set $keys === set()
                       }) {
        for %args.kv -> $k, $v {
            my $normalized-name = (%scalar{$k} // %object{$k})<attr>;
            my $attr = %attr-lookup{$normalized-name};
            if $k (elem) %scalar.keys {
                $attr.set_value(self, $v);
            } elsif $k (elem) %object.keys {
                my $attr-type = %object{$k}<array> ?? [%object{$k}<type>] !! %object{$k}<type>;
                if $v ~~ $attr-type || $v ~~ [] {
                    $attr.set_value(self, $v);
                } else {
                    die X::OpenAPI::Model::TypeMismatch.new(
                        name => ::?CLASS.^name, field => $k,
                        expected => %object{$k}<type>, got => $v);
                }
            }
        }
    }
}
