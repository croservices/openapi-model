use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Info;
use OpenAPI::Model::Server;
use OpenAPI::Model::Paths;
use OpenAPI::Model::Components;
use OpenAPI::Model::Security;
use OpenAPI::Model::Tag;
use OpenAPI::Model::ExternalDocs;

class OpenAPI::Model::OpenAPI does OpenAPI::Model::Element[
    scalar => {
        openapi => {
            attr => 'openapi'
        }
    },
    object => {
        info => {
            attr => 'info',
            type => OpenAPI::Model::Info
        },
        servers => {
            attr => 'servers',
            type => OpenAPI::Model::Server,
            array => True
        },
        paths => {
            attr => 'paths',
            type => OpenAPI::Model::Paths
        },
        components => {
            attr => 'components',
            type => OpenAPI::Model::Components
        },
        security => {
            attr => 'security',
            type => OpenAPI::Model::Security,
            array => True
        },
        tags => {
            attr => 'tags',
            type => OpenAPI::Model::Tag,
            array => True
        },
        externalDocs => {
            attr => 'external-docs',
            type => OpenAPI::Model::ExternalDocs
        }
    }] {
    has Str $.openapi is required is rw;
    has OpenAPI::Model::Info $.info is required;
    has OpenAPI::Model::Server @!servers;
    has OpenAPI::Model::Paths @.paths is required;
    has OpenAPI::Model::Components $!components;
    has OpenAPI::Model::Security @!security;
    has OpenAPI::Model::Tag @!tags;
    has OpenAPI::Model::ExternalDocs $!external-docs;

    # Accessors
    method info()          { $!info          // Nil }
    method servers()       { @!servers       // Nil }
    method paths()         { @!paths         // Nil }
    method components()    { $!components    // Nil }
    method security()      { @!security      // Nil }
    method tags()          { @!tags          // Nil }
    method external-docs() { $!external-docs // Nil }

    # Setters
    multi method set-info(Any:U) { $!info = Nil }
    multi method set-info(OpenAPI::Model::Info:D $!info --> Nil) {
        $!info.set-model($!model);
    }

    multi method add-server(OpenAPI::Model::Server $server) { @!servers.push: $server }
    multi method remove-server(--> Nil) {}

    multi method add-path(OpenAPI::Model::Paths $path) { @!paths.push: $path }
    multi method remove-path(--> Nil) {}

    multi method set-components(Any:U) { $!components = Nil }
    multi method set-components(OpenAPI::Model::Components:D $!components --> Nil) {
        $!components.set-model($!model);
    }

    multi method add-security(OpenAPI::Model::Security $security) { @!security.push: $security }
    multi method remove-security(--> Nil) {}

    multi method add-tag(OpenAPI::Model::Tag $tag) { @!tags.push: $tag }
    multi method remove-tag(--> Nil) {}

    multi method set-external-docs(Any:U) { $!external-docs = Nil }
    multi method set-external-docs(OpenAPI::Model::ExternalDocs:D $!external-docs --> Nil) {
        $!external-docs.set-model($!model);
    }
}
