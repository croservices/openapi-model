use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Info;
use OpenAPI::Model::Server;
use OpenAPI::Model::Paths;
use OpenAPI::Model::Components;
use OpenAPI::Model::Security;
use OpenAPI::Model::Tag;
use OpenAPI::Model::ExternalDocs;

#| The OpenAPI::Model::OpenAPI class represents an L<OpenAPI document object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#oasObject>.
class OpenAPI::Model::OpenAPI does OpenAPI::Model::Element[
    scalar => {
        openapi => {}
    },
    object => {
        info => {
            type => OpenAPI::Model::Info
        },
        servers => {
            type => OpenAPI::Model::Server,
            array => True
        },
        paths => {
            type => OpenAPI::Model::Paths
        },
        components => {
            type => OpenAPI::Model::Components
        },
        security => {
            type => OpenAPI::Model::Security,
            array => True
        },
        tags => {
            type => OpenAPI::Model::Tag,
            array => True
        },
        externalDocs => {
            attr => 'external-docs',
            type => OpenAPI::Model::ExternalDocs
        }
    }] {
    #| Represents an OpenAPI version.
    has Str $.openapi is required is rw;
    #| Represents an L<OpenAPI Info object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#infoObject>.
    has OpenAPI::Model::Info $.info is required;
    #| Represents an Array o L<OpenAPI Server objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverObject>.
    has OpenAPI::Model::Server @.servers;
    #| Represents an L<OpenAPI Paths object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#pathsObject>.
    has OpenAPI::Model::Paths $.paths is required;
    #| Represents an L<OpenAPI Components object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#componentsObject>.
    has OpenAPI::Model::Components $.components;
    #| Represents an L<OpenAPI Security Requirement object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securityRequirementObject>.
    has OpenAPI::Model::Security @.security;
    #| Represents an Array of L<OpenAPI Tag objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#tagObject>.
    has OpenAPI::Model::Tag @.tags;
    #| Represents an L<OpenAPI External Documentation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#externalDocumentationObject>.
    has OpenAPI::Model::ExternalDocs $.external-docs;

    # Getters
    #| Returns an L<OpenAPI Info object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#infoObject> or Nil.
    method info()          { $!info          // Nil }
    #| Returns an Array of L<OpenAPI Server objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverObject> or Nil.
    method servers()       { @!servers       // Nil }
    #| Returns an L<OpenAPI Paths object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#pathsObject> or Nil.
    method paths()         { $!paths         // Nil }
    #| Returns an L<OpenAPI Components object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#componentsObject> or Nil.
    method components()    { $!components    // Nil }
    #| Returns an Array of L<OpenAPI Security Requirement objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securityRequirementObject> or Nil.
    method security()      { @!security      // Nil }
    #| Returns an Array of L<OpenAPI Tag objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#tagObject> or Nil.
    method tags()          { @!tags          // Nil }
    #| Returns an L<OpenAPI External Documentation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#externalDocumentationObject> or Nil.
    method external-docs() { $!external-docs // Nil }

    # Setters
    #| Sets Info to Nil.
    multi method set-info(Any:U) { $!info = Nil }
    #| Sets Info to given value.
    multi method set-info(OpenAPI::Model::Info:D $!info --> Nil) {
        $!info.set-model($!model);
    }

    #| Adds given Server to Server array.
    multi method add-server(OpenAPI::Model::Server $server) { @!servers.push: $server }
    #| Removes given Server from Server array.
    multi method remove-server(OpenAPI::Model::Server $server --> Nil) { @!servers .= grep({ not $_ eqv $server}) }

    #| Sets Paths to Nil.
    multi method set-paths(Any:U) { $!info = Nil }
    #| Sets Paths to given value.
    multi method set-paths(OpenAPI::Model::Paths:D $!paths --> Nil) {
        $!paths.set-model($!model);
    }

    #| Sets Components to Nil.
    multi method set-components(Any:U) { $!components = Nil }
    #| Sets Components to given value.
    multi method set-components(OpenAPI::Model::Components:D $!components --> Nil) {
        $!components.set-model($!model);
    }

    #| Adds given Security Requirenments to Security Requirenments array.
    multi method add-security(OpenAPI::Model::Security $security) { @!security.push: $security }
    #| Removes given Security Requirenments from Security Requirenments array.
    multi method remove-security(--> Nil) {}

    #| Adds given Tag to Tag array.
    multi method add-tag(OpenAPI::Model::Tag $tag) { @!tags.push: $tag }
    #| Removes given Tag from Tag array.
    multi method remove-tag(OpenAPI::Model::Tag $tag --> Nil) {}

    #| Sets External Documentation to Nil.
    multi method set-external-docs(Any:U) { $!external-docs = Nil }
    #| Sets External Documentation to given value.
    multi method set-external-docs(OpenAPI::Model::ExternalDocs:D $!external-docs --> Nil) {
        $!external-docs.set-model($!model);
    }
}
