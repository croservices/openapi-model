use v6;

role OpenAPI::Model::PatternedObject does Associative {
    has %.container;

    method !set-fields(%hash) {
        %!container = %hash;
    }

    method kv() { %!container.kv }
    method keys() { %!container.keys }
    method values() { %!container.values }
    method AT-KEY($key) { %!container.AT-KEY($key) }
    method EXISTS-KEY($key) { %!container.EXISTS-KEY($key) }
}
