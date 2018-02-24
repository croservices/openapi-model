use v6.c;

use OpenAPI::Model::Element;

class OpenAPI::Model::Variable does OpenAPI::Model::Element[
    scalar => {
        enum => {},
        default => {},
        description => {}
    }] {
    has Str @.enum is rw;
    has Str $.default is required is rw;
    has Str $.description is rw;

    method enum() { @!enum // Nil }
    method default() { $!default // Nil }
    method description() { $!description // Nil }
}
