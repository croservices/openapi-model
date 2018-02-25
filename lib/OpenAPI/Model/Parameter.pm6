use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Example;
use OpenAPI::Model::MediaType;
use OpenAPI::Model::Schema;

#| The OpenAPI::Model::Parameter class represents an L<OpenAPI Parameter object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#parameterObject>.
class OpenAPI::Model::Parameter does OpenAPI::Model::Element[
    scalar => {
        name => {},
        in => {},
        description => {},
        required => {},
        deprecated => {},
        allowEmptyValue => {
            attr => 'allow-empty-value'
        },
        style => {},
        explode => {},
        allowReserved => {
            attr => 'allow-reserved'
        },
        example => {}
    },
    object => {
        schema => {
            type => OpenAPI::Model::Schema,
            ref => True
        },
        examples => {
            type => OpenAPI::Model::Example,
            hash => True,
            ref => True
        },
        content => {
            type => OpenAPI::Model::MediaType,
            hash => True
        }
    }] {
    #| Represents name of the parameter.
    has Str $.name is required is rw;
    #| Represents location of the parameter.
    subset In of Str where 'query'|'header'|'path'|'cookie';
    has In $.in is required is rw;
    #| Represents a brief description of the parameter.
    has Str $.description is rw;
    #| Represents whether Parameter is required or not.
    has Bool $.required is rw;
    #| Represents whether Parameter is deprecated or not.
    has Bool $.deprecated is rw;
    #| Represents flag to define ability to pass empty-valued parameters.
    has Bool $.allow-empty-value is rw;
    #| Represents style of how the parameter is serialized.
    has Str $.style is rw;
    #| Represents `explode` flag for serialization logic.
    has Bool $.explode is rw;
    #| Represents `allowReserved` flag for serialization logic.
    has Bool $.allow-reserved is rw;
    #| Represents schema that defines the type used for the parameter.
    has OpenAPI::Model::Schema $.schema;
    #| Represents example of the media type.
    has $.example is rw;
    #| Represents a hash of examples based on media type.
    has OpenAPI::Model::Example %.examples;
    #| Represents a hash that holds representations of the parameter.
    has OpenAPI::Model::MediaType %.content;

    # Getters
    #| Returns name of the parameter.
    method name()              { $!name              // Nil }
    #| Returns location of the parameter.
    method in()                { $!in                // Nil }
    #| Returns a brief description of the parameter.
    method description()       { $!description       // Nil }
    #| Returns whether Parameter is required or not.
    method required()          { $!required          // Nil }
    #| Returns whether Parameter is deprecated or not.
    method deprecated()        { $!deprecated        // Nil }
    #| Returns flag to define ability to pass empty-valued parameters.
    method allow-empty-value() { $!allow-empty-value // Nil }
    #| Returns style of how the parameter is serialized.
    method style()             { $!style             // Nil }
    #| Returns `explode` flag for serialization logic.
    method explode()           { $!explode           // Nil }
    #| Returns `allowReserved` flag for serialization logic.
    method allow-reserved()    { $!allow-reserved    // Nil }
    #| Returns schema that defines the type used for the parameter.
    method schema()            { $!schema            // Nil }
    #| Returns example of the media type.
    method example()           { $!example           // Nil }
    #| Returns a hash of examples based on media type.
    method examples()          { %!examples          // Nil }
    #| Returns a hash that holds representations of the parameter.
    method content()           { %!content           // Nil }

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

    #| Adds example into Parameter by id.
    method set-examples(Str $id, OpenAPI::Model::Example:D $example --> Nil) {
        $!example = Nil;
        %!examples{$id} = $example;
    }
    #| Deletes schema from Parameter by id.
    method delete-examples(Str $id) { %!examples{$id}:delete }

    #| Adds content into Parameter by id.
    method set-content(Str $id, OpenAPI::Model::MediaType:D $content --> Nil) { %!content{$id} = $content }
    #| Deletes content from Parameter by id.
    method delete-content(Str $id) { %!content{$id}:delete }
}
