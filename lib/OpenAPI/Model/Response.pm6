use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Header;
use OpenAPI::Model::MediaType;
use OpenAPI::Model::Link;

#| The OpenAPI::Model::Response class represents an L<OpenAPI Response object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#responseObject>.
class OpenAPI::Model::Response does OpenAPI::Model::Element[
    scalar => {
        description => {}
    },
    object => {
        headers => {
            hash => True,
            type => OpenAPI::Model::Header
        },
        content => {
            hash => True,
            type => OpenAPI::Model::MediaType
        },
        links => {
            hash => True,
            type => OpenAPI::Model::Link
        }
    }] {
    #| Represents a short description of the response.
    has Str $.description is required is rw;
    #| Represents a hash that maps a header name to its definition.
    has OpenAPI::Model::Header %.headers;
    #| Represents a hash that maps media types to Media Type objects.
    has OpenAPI::Model::MediaType %.content;
    #| Represents a hash that holds operations links that can be followed from the response.
    has OpenAPI::Model::Link %.links;

    # Getters
    #| Returns a short description of the response or Nil.
    method description() { $!description // Nil }
    #| Returns a hash that holds headers or Nil.
    method headers()     { %!headers     // Nil }
    #| Returns a hash that holds OpenAPI::Model::MediaType objects of the Response or Nil.
    method content()     { %!content     // Nil }
    #| Returns a hash that holds operation links.
    method links()        { %!links      // Nil }

    # Setters
    #| Adds header into response by id.
    method set-header(Str $id, OpenAPI::Model::Header:D $header --> Nil) { %!headers{$id} = $header }
    #| Deletes header from response by id.
    method delete-header(Str $id) { %!headers{$id}:delete }

    #| Adds content into response by id.
    method set-content(Str $id, OpenAPI::Model::MediaType:D $content --> Nil) { %!content{$id} = $content }
    #| Deletes content from response by id.
    method delete-content(Str $id) { %!content{$id}:delete }

    #| Adds link into response by id.
    method set-link(Str $id, OpenAPI::Model::Link:D $link --> Nil) { %!links{$id} = $link }
    #| Deletes link from response by id.
    method delete-link(Str $id) { %!links{$id}:delete }
}
