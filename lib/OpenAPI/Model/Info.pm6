use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Contact;
use OpenAPI::Model::License;

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
    has Str $.title is required is rw;
    has Str $.description is rw;
    has Str $.terms-of-service is rw;
    has Str $.version is required is rw;
    has OpenAPI::Model::Contact $.contact;
    has OpenAPI::Model::License $.license;

    method title() { $!title // Nil }
    method description() { $!description // Nil }
    method terms-of-service() { $!terms-of-service // Nil }
    method version() { $!version // Nil }

    method contact() { $!contact // Nil }
    multi method set-contact(Any:U) {
        $!contact = Nil;
    }
    multi method set-contact(OpenAPI::Model::Contact:D $!contact --> Nil) {
        $!contact.set-model($!model);
    }

    method license() { $!license // Nil }
    multi method set-license(Any:U) {
        $!license = Nil;
    }
    multi method set-license(OpenAPI::Model::License:D $!license --> Nil) {
        $!license.set-model($!model);
    }
}
