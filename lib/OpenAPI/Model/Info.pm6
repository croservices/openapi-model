use v6.c;

use OpenAPI::Model::Element;

class OpenAPI::Model::Info does OpenAPI::Model::Element[
    scalar => {
        title => {
            attr => 'title'
        },
        termsOfService => {
            attr => 'terms-of-service'
        },
        version => {
            attr => 'version'
        }
    },
    object => {}
    ] {
    has Str $.title is required is rw;
    has Str $!terms-of-service;
    has Str $.version is required is rw;

    method terms-of-service() { $!terms-of-service // Nil }
}
