use v6.c;

use OpenAPI::Model::Contact;
use OpenAPI::Model::Element;
use OpenAPI::Model::License;

#| The OpenAPI::Model::OpenAPI class represents an L<OpenAPI Info object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#infoObject>.
class OpenAPI::Model::Info does OpenAPI::Model::Element[
    scalar => {
        title => {},
        description => {},
        termsOfService => {
            attr => 'terms-of-service'
        },
        version => {}
    },
    object => {
        contact => {
            type => OpenAPI::Model::Contact
        },
        license => {
            type => OpenAPI::Model::License
        }
    }] {
    #| Represents an application title.
    has Str $.title is required is rw;
    #| Represents an application description.
    has Str $.description is rw;
    #| Represents a URL to the Terms of Service for the API.
    has Str $.terms-of-service is rw;
    #| Represents a version of the OpenAPI document.
    has Str $.version is required is rw;
    #| Represents an L<OpenAPI Contact object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#contactObject>.
    has OpenAPI::Model::Contact $.contact;
    #| Represents an L<OpenAPI License object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#licenseObject>.
    has OpenAPI::Model::License $.license;

    
    # Getters
    #| Returns an application title or Nil.
    method title()            { $!title            // Nil }
    #| Returns an application description or Nil.
    method description()      { $!description      // Nil }
    #| Returns a URL to the Terms of Service for the API or Nil.
    method terms-of-service() { $!terms-of-service // Nil }
    #| Returns a version of the OpenAPI document or Nil.
    method version()          { $!version          // Nil }
    #| Returns an L<OpenAPI Contact object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#contactObject> or Nil.
    method contact() { $!contact                   // Nil }
    #| Returns an L<OpenAPI License object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#licenseObject> or Nil.
    method license() { $!license                   // Nil }

    # Setters
    #| Sets Contact to Nil.
    multi method set-contact(Any:U) { $!contact = Nil }
    #| Sets Contact to given value.
    multi method set-contact(OpenAPI::Model::Contact:D $!contact --> Nil) {
        $!contact.set-model($!model);
    }

    #| Sets License to Nil.
    multi method set-license(Any:U) { $!license = Nil }
    #| Sets License to given value.
    multi method set-license(OpenAPI::Model::License:D $!license --> Nil) {
        $!license.set-model($!model);
    }
}
