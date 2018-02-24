use v6.c;

use OpenAPI::Model::Element;

class OpenAPI::Model::Contact does OpenAPI::Model::Element[
    scalar => {
        name => {},
        url => {},
        email => {}
    }] {
    has Str $.name is rw;
    has Str $.url is rw;
    has Str $.email is rw;

    method name()  { $!name // Nil }
    method url()   { $!url // Nil }
    method email() { $!email // Nil }
}
