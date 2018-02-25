use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::ExternalDocs class represents an L<OpenAPI External Documentation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#externalDocumentationObject>.
class OpenAPI::Model::ExternalDocs does OpenAPI::Model::Element[
    scalar => {
        description => {},
        url => {}
    },
    object => {}] {
    #| Represents a short description of the target documentation.
    has Str $.description is rw;
    #| Represents a URL for the target documentation.
    has Str $.url is required is rw;

    # Getters
    #| Returns a short description of the target documentation or Nil.
    method description() { $!description // Nil }
    #| Returns a URL for the target documentation or Nil.
    method url()         { $!url         // Nil }
}
