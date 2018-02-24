use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::OpenAPI class represents an L<OpenAPI Contact object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#contactObject>.
class OpenAPI::Model::Contact does OpenAPI::Model::Element[
    scalar => {
        name => {},
        url => {},
        email => {}
    }] {
    #| Represents a name of the contact person/organization.
    has Str $.name is rw;
    #| Represents a URL pointing to the contact information.
    has Str $.url is rw;
    #| Represents an email address of the contact person/organization.
    has Str $.email is rw;

    # Getters
    #| Returns a name of the contact person/organization or Nil.
    method name()  { $!name  // Nil }
    #| Returns a URL pointing to the contact information or Nil.
    method url()   { $!url   // Nil }
    #| Returns an email address of the contact person/organization or Nil.
    method email() { $!email // Nil }
}
