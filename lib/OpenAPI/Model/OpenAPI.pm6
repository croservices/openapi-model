use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Info;
use OpenAPI::Model::Server;
use OpenAPI::Model::Path;
use OpenAPI::Model::Component;
use OpenAPI::Model::Security;
use OpenAPI::Model::Tag;
use OpenAPI::Model::ExternalDocs;

class OpenAPI::Model::OpenAPI does OpenAPI::Model::Element[
    scalar => {},
    object => {}] {
    has Str $.openapi is required is rw;
    has OpenAPI::Model::Info $.info is required;
    has OpenAPI::Model::Server @.servers;
    has OpenAPI::Model::Path @.paths is required;
    has OpenAPI::Model::Component $.components;
    has OpenAPI::Model::Security @.security;
    has OpenAPI::Model::Tag @.tags;
    has OpenAPI::Model::ExternalDocs $.external-docs;

    multi method set-openapi(Any:U) {
        $!openapi = Nil;
    }
    multi method set-openapi(Str $!openapi --> Nil) {}

    multi method set-info(Any:U) {
        $!info = Nil;
    }
    multi method set-info(OpenAPI::Model::Info:D $!info --> Nil) {
        $!info.set-model($!model);
    }

    multi method set-external-docs(Any:U) {
        $!external-docs = Nil;
    }
    multi method set-external-docs(OpenAPI::Model::ExternalDocs:D $!external-docs --> Nil) {
        $!external-docs.set-model($!model);
    }
}
