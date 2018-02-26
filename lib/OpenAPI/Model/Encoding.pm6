use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Header;

#| The OpenAPI::Model::Encoding class represents an L<OpenAPI Encoding object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#encodingObject>.
class OpenAPI::Model::Encoding does OpenAPI::Model::Element[
    scalar => {
        contentType => {
            attr => 'content-type'
        },
        style => {},
        explode => {},
        allowReserved => {
            attr => 'allow-reserved'
        }
    },
    object => {
        headers => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Header
        }
    }] {
    #| Represents content-type for encoding a specific property.
    has Str $.content-type is rw;
    #| Represents a hash that holds additional information to be provided as headers.
    has OpenAPI::Model::Header %.headers;
    #| Represents style of how the parameter is serialized.
    has Str $.style is rw;
    #| Represents `explode` flag for serialization logic.
    has Bool $.explode is rw;
    #| Represents `allowReserved` flag for serialization logic.
    has Bool $.allow-reserved is rw;

    # Getters
    #| Returns content-type for encoding a specific property.
    method content-type()   { $!content-type // Nil }
    #| Returns a hash that holds reusable Header Objects.
    method headers()          { %!headers          // Nil }
    #| Returns style of how the parameter is serialized.
    method style()             { $!style             // Nil }
    #| Returns `explode` flag for serialization logic.
    method explode()           { $!explode           // Nil }
    #| Returns `allowReserved` flag for serialization logic.
    method allow-reserved()    { $!allow-reserved    // Nil }

    # Setters
    #| Adds header into encoding by id.
    method set-header(Str $id, OpenAPI::Model::Header:D $header --> Nil) { %!headers{$id} = $header }
    #| Deletes header from encoding by id.
    method delete-header(Str $id) { %!headers{$id}:delete }
}
