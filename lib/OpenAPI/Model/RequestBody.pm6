use v6.c;

use OpenAPI::Model::MediaType;
use OpenAPI::Model::Element;

#| The OpenAPI::Model::RequestBody class represents an L<OpenAPI Request Body object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#requestBodyObject>.
class OpenAPI::Model::RequestBody does OpenAPI::Model::Element[
    scalar => {
        description => {},
        required => {}
    },
    object => {
        content => {
            hash => True,
            type => OpenAPI::Model::MediaType
        }
    }] {
    #| Represents a brief description of the request body.
    has Str $.description is rw;
    #| Represents the content of the request body.
    has OpenAPI::Model::MediaType %.content is required;
    #| Represents a bool that describes if request body is required in the request.
    has Bool $.required is rw;

    # Getters
    #| Returns a brief description of the request body.
    method description() { $!description // Nil }
    #| Returns the content of the request body.
    method content()     { %!content     // Nil }
    #| Returns a bool that describes if request body is required in the request.
    method required()    { $!required    // Nil }

    # Setters
    #| Adds content into Request Body by id.
    method set-content(Str $id, OpenAPI::Model::MediaType:D $content --> Nil) { %!content{$id} = $content }
    #| Deletes content from Request Body by id.
    method delete-content(Str $id) { %!content{$id}:delete }
}
