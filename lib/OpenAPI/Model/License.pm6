use v6.c;

use OpenAPI::Model::Element;

class OpenAPI::Model::License does OpenAPI::Model::Element[
    scalar => {
        name => {},
        url => {},
    }] {
    has Str $.name is rw;
    has Str $.url is rw;

    method name()  { $!name // Nil }
    method url()   { $!url // Nil }
}
