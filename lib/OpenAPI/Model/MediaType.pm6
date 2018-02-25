use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Schema;
use OpenAPI::Model::Example;
use OpenAPI::Model::Encoding;

#| The OpenAPI::Model::MediaType class represents an L<OpenAPI Media Type object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#mediaTypeObject>.
class OpenAPI::Model::MediaType does OpenAPI::Model::Element[
    scalar => {
        example => {}
    },
    object => {
        schema => {
            type => OpenAPI::Model::Schema
        },
        examples => {
            hash => True,
            type => OpenAPI::Model::Example
        },
        encoding => {
            hash => True,
            type => OpenAPI::Model::Encoding
        }
    }] {
    #| Represents 
    has OpenAPI::Model::Schema $.schema;
    #| Represents 
    has $.example;
    #| Represents 
    has OpenAPI::Model::Example %.examples;
    #| Represents 
    has OpenAPI::Model::Encoding %.encoding;

    # Getters
    #| Returns the schema defining the type used for the request body.
    method schema()   { $!schema   // Nil }
    #| Returns an example of the media type.
    method example()  { $!example  // Nil }
    #| Returns examples of the media type.
    method examples() { %!examples // Nil }
    #| Returns a hash that holds Encoding objects of this Media Type.
    method encoding() { %!encoding // Nil }

    # Setters
    #| Sets schema to Nil.
    multi method set-schema(Any:U) { $!schema = Nil }
    #| Sets schema to given value.
    multi method set-schema(OpenAPI::Model::Schema:D $!schema --> Nil) {
        $!schema.set-model($!model);
    }

    #| Sets example to given value.
    multi method set-example($!example --> Nil) {
        %!examples = Hash.new;
    }

    #| Adds example into media type by id.
    method set-examples(Str $id, OpenAPI::Model::Example:D $example --> Nil) {
        $!example = Nil;
        %!examples{$id} = $example;
    }
    #| Deletes schema from media type by id.
    method delete-examples(Str $id) { %!examples{$id}:delete }

    #| Adds encoding into media type by id.
    method set-encoding(Str $id, OpenAPI::Model::Encoding:D $encoding --> Nil) { %!encoding{$id} = $encoding }
    #| Deletes encoding from media type by id.
    method delete-encoding(Str $id) { %!encoding{$id}:delete }
}
