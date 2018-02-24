use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Variable;

#| The OpenAPI::Model::Server class represents an L<OpenAPI Server object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverObject>.
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
    #| Represents a server url.
    has Str $.url is required is rw;
    #| Represents a server description.
    has Str $.description is rw;
    #| Represents a Hash of L<OpenAPI Server Variable objects hash|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverVariableObject>.
    has OpenAPI::Model::Variable %.variables;

    # Getters
    #| Returns a server url or Nil.
    method url()         { $!url         // Nil }
    #| Returns a server description or Nil.
    method description() { $!description // Nil }
    #| Returns a server variables or Nil.
    method variables()   { %!variables   // Nil }

    # Setters
    #| Adds variable for the server by id.
    method set-variable(Str $id, OpenAPI::Model::Variable:D $variable --> Nil) {
        %!variables{$id} = $variable;
    }
    #| Deletes variable of server by id.
    method delete-variable(Str $id) {
        %!variables{$id}:delete;
    }
}
