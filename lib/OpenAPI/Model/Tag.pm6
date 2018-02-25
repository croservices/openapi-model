use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::ExternalDocs;

#| The OpenAPI::Model::Tag class represents an L<OpenAPI Tag object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#tagObject>.
class OpenAPI::Model::Tag does OpenAPI::Model::Element[
    scalar => {
        name => {},
        description => {}
    },
    object => {
        externalDocs => {
            attr => 'external-docs',
            type => OpenAPI::Model::ExternalDocs
        }
    }] {
    #| Represents a name of the tag.
    has Str $.name is required is rw;
    #| Represents a short description for for the tag.
    has Str $.description is rw;
    #| Represents additional external documentation.
    has OpenAPI::Model::ExternalDocs $.external-docs is rw;

    # Getters
    #| Returns a name of the tag.
    method name()          { $!name          // Nil }
    #| Returns a short description for for the tag.
    method description()   { $!description   // Nil }
    #| Returns additional external documentation.
    method external-docs() { $!external-docs // Nil }

    # Setters
    #| Sets external documentation to Nil.
    multi method set-external-docs(Any:U) { $!external-docs = Nil }
    #| Sets external documentation to given value.
    multi method set-external-docs(OpenAPI::Model::ExternalDocs:D $!external-docs --> Nil) {
        $!external-docs.set-model($!model);
    }
}
