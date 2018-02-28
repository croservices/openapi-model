use v6;

role OpenAPI::Model::PatternedObject does Associative {
    has %.container;

    submethod TWEAK(*%args) {
        %!container = %args;
    }

    method kv()             { %!container.map({.key => self!resolve(.value)}).kv }
    method keys()           { %!container.keys }
    method values()         { %!container.values.map({self!resolve($_)}) }
    method AT-KEY($key)     { self!resolve(%!container.AT-KEY($key)) }
    method EXISTS-KEY($key) { %!container.EXISTS-KEY($key) }

    method serialize() {
        %!container.map({ .key => .value.serialize }).Hash;
    }
}
