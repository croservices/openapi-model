use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Variable;

class OpenAPI::Model::Server does OpenAPI::Model::Element[
    scalar => {
        url => {},
        description => {}
    },
    object => {
        variables => {
            type => OpenAPI::Model::Variable,
            hash => True
        }
    }] {
    has Str $.url is required is rw;
    has Str $.description is rw;
    has OpenAPI::Model::Variable %.variables;

    method url() { $!url // Nil }
    method description() { $!description // Nil }

    method variables() { %!variables // Nil }
    multi method set-variables(Any:U) {
        %!variables = Nil;
    }
    multi method set-variable(Str $id, OpenAPI::Model::Variable:D $variable --> Nil) {
        %!variables{$id} = $variable;
    }
    method delete-variable(Str $id) {
        %!variables{$id}:delete;
    }
}
