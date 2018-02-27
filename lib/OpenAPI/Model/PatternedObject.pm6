use v6;

role OpenAPI::Model::PatternedObject does Associative {
    has %.container;

    submethod TWEAK(*%args) {
        %!container = %args;
    }

    method kv() { %!container.kv }
    method keys() { %!container.keys }
    method values() { %!container.values }
    method AT-KEY($key) { %!container.AT-KEY($key) }
    method EXISTS-KEY($key) { %!container.EXISTS-KEY($key) }

    method serialize() {
        %!container.map({ .key => .value.serialize }).Hash;
    }
}
