use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::OpenAPI class represents an L<OpenAPI License object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#licenseObject>.
class OpenAPI::Model::License does OpenAPI::Model::Element[
    scalar => {
        name => {},
        url => {},
    }] {
    #| Represents the license name used for the API.
    has Str $.name is rw;
    #| Represents a URL to the license used for the API.
    has Str $.url is rw;

    # Getters
    #| Returns the license name used for the API or Nil.
    method name()  { $!name // Nil }
    #| Returns a URL to the license used for the API or Nil.
    method url()   { $!url // Nil }
}
