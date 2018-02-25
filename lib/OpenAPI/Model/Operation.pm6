use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::ExternalDocs;
use OpenAPI::Model::RequestBody;
use OpenAPI::Model::Responses;
use OpenAPI::Model::Callback;
use OpenAPI::Model::Security;
use OpenAPI::Model::Server;
use OpenAPI::Model::Parameter;

#| The OpenAPI::Model::Operation class represents an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject>.
class OpenAPI::Model::Operation does OpenAPI::Model::Element[
    scalar => {
        tags => {},
        summary => {},
        description => {},
        operationId => {
            attr => 'operation-id'
        },
        deprecated => {}
    },
    object => {
        externalDocs => {
            attr => 'external-docs',
            type => OpenAPI::Model::ExternalDocs
        },
        parameters => {
            ref => True,
            array => True,
            type => OpenAPI::Model::Parameter
        },
        requestBody => {
            attr => 'request-body',
            ref => True,
            type => OpenAPI::Model::RequestBody
        },
        responses => {
            type => OpenAPI::Model::Responses
        },
        callbacks => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Callback
        },
        security => {
            array => True,
            type => OpenAPI::Model::Security
        },
        servers => {
            array => True,
            type => OpenAPI::Model::Server
        }
    }] {
    #| Represents a list of tags for API documentation control.
    has Str @.tags is rw;
    #| Represents a short summary of what the operation does.
    has Str $.summary is rw;
    #| Represents a verbose explanation of the operation behavior.
    has Str $.description is rw;
    #| Represents a unique string used to identify the operation.
    has Str $.operation-id is rw;
    #| Represents a boolean value that indicates whether operation is deprecated or not.
    has Bool $.deprecated is rw;
    #| Represents an L<OpenAPI External Documentation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#externalDocumentationObject>.
    has OpenAPI::Model::ExternalDocs $.external-docs;
    #| Represents an Array of L<OpenAPI Parameter objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#parameterObject>.
    has OpenAPI::Model::Parameter @.parameters;
    #| Represents an L<OpenAPI Contact object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#requestBodyObject>.
    has OpenAPI::Model::RequestBody $.request-body;
    #| Represents an L<OpenAPI Contact object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#responsesObject>.
    has OpenAPI::Model::Responses $.responses;
    #| Represents an L<OpenAPI Contact object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#callbackObject>.
    has OpenAPI::Model::Callback %.callbacks;
    #| Represents an Array of L<OpenAPI Security Requirement objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securityRequirementObject>.
    has OpenAPI::Model::Security @.security;
    #| Represents an Array of L<OpenAPI Server objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverObject>.
    has OpenAPI::Model::Server @.servers;

    # Getters
    #| Returns a list of tags for API documentation control or Nil.
    method tags()          { @!tags           // Nil }
    #| Returns a short summary of what the operation does or Nil.
    method summary()       { $!summary       // Nil }
    #| Returns a verbose explanation of the operation behavior or Nil.
    method description()   { $!description   // Nil }
    #| Returns a unique string used to identify the operation or Nil.
    method operation-id()  { $!operation-id  // Nil }
    #| Returns a boolean value that indicates whether operation is deprecated or not or Nil.
    method deprecated()    { $!deprecated    // Nil }
    #| Returns an L<OpenAPI External Documentation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#externalDocumentationObject> or Nil.
    method external-docs() { $!external-docs // Nil }
    #| Returns an Array of L<OpenAPI Parameter objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#parameterObject> or Nil.
    method parameters()    { @!parameters    // Nil }
    #| Returns an L<OpenAPI Request Body object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#requestBodyObject> or Nil.
    method request-body()  { $!request-body  // Nil }
    #| Returns an L<OpenAPI Responses object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#responsesObject> or Nil.
    method responses()     { $!responses     // Nil }
    #| Returns a Hash of L<OpenAPI Callback objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#callbackObject> or Nil.
    method callbacks()     { %!callbacks     // Nil }
    #| Returns an Array of L<OpenAPI Security Requirement objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securityRequirementObject> or Nil.
    method security()      { @!security      // Nil }
    #| Returns an Array of L<OpenAPI Server objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverObject> or Nil.
    method servers()       { @!servers       // Nil }

    # Setters
    #| Sets External Documentation to Nil.
    multi method set-external-docs(Any:U) { $!external-docs = Nil }
    #| Sets External Documentation to given value.
    multi method set-external-docs(OpenAPI::Model::ExternalDocs:D $!external-docs --> Nil) {
        $!external-docs.set-model($!model);
    }

    #| Adds given Parameter to parameters array.
    multi method add-parameter(OpenAPI::Model::Parameter $parameter) { $parameter.set-model($!model); @!parameters.push: $parameter }
    #| Removes given Parameter from parameters array.
    multi method remove-parameter(OpenAPI::Model::Parameter $parameter --> Nil) { @!parameters .= grep({ not $_ eqv $parameter}) }

    #| Sets Request Body to Nil.
    multi method set-request-body(Any:U) { $!request-body = Nil }
    #| Sets Request Body to given value.
    multi method set-request-body(OpenAPI::Model::RequestBody:D $!request-body --> Nil) {
        $!request-body.set-model($!model);
    }

    #| Sets Responses to Nil.
    multi method set-responses(Any:U) { $!responses = Nil }
    #| Sets Responses to given value.
    multi method set-responses(OpenAPI::Model::Responses:D $!responses --> Nil) {
        $!responses.set-model($!model);
    }

    #| Adds callback for the operation by id.
    method set-callback(Str $id, OpenAPI::Model::Callback:D $callback --> Nil) {
        %!callbacks{$id} = $callback;
    }
    #| Deletes callback for the operation by id.
    method delete-callback(Str $id) {
        %!callbacks{$id}:delete;
    }

    #| Adds given Security Requirenments to Security Requirenments array.
    multi method add-security(OpenAPI::Model::Security $security) { @!security.push: $security }
    #| Removes given Security Requirenments from Security Requirenments array.
    multi method remove-security(OpenAPI::Model::Security $security --> Nil) { @!security .= grep({ not $_ eqv $security}) }

    #| Adds given Server to Server array.
    multi method add-server(OpenAPI::Model::Server $server) { @!servers.push: $server }
    #| Removes given Server from Server array.
    multi method remove-server(OpenAPI::Model::Server $server --> Nil) { @!servers .= grep({ not $_ eqv $server}) }
}
