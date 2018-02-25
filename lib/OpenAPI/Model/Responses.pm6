use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::PatternedObject;
use OpenAPI::Model::Response;

#| The OpenAPI::Model::Responses class represents an L<OpenAPI Responses object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#responsesObject>.
class OpenAPI::Model::Responses does OpenAPI::Model::PatternedObject does OpenAPI::Model::Element[
    scalar => {},
    object => {},
    :patterned(OpenAPI::Model::Response)] {
    submethod TWEAK(*%args) {
        self!set-fields(%args);
    }

    #| Adds response to responses by id.
    method set-response(Str $id, OpenAPI::Model::Response $response) { %!container{$id} = $response }
    #| Deletes response from responses by id.
    method delete-response(Str $id) { %!container{$id}:delete }
    #| Returns OpenAPI::Model::Response object by id.
    method get-response(Str $id) { %!container{$id} }
}
