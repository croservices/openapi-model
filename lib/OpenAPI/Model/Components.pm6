use v6.c;

use OpenAPI::Model::Callback;
use OpenAPI::Model::Element;
use OpenAPI::Model::Example;
use OpenAPI::Model::Header;
use OpenAPI::Model::Link;
use OpenAPI::Model::Parameter;
use OpenAPI::Model::Response;
use OpenAPI::Model::RequestBody;
use OpenAPI::Model::Schema;
use OpenAPI::Model::SecurityScheme;

#| The OpenAPI::Model::Components class represents an L<OpenAPI Components object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#componentsObject>.
class OpenAPI::Model::Components does OpenAPI::Model::Element[
    scalar => {},
    object => {
        schemas => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Schema
        },
        responses => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Response
        },
        parameters => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Parameter
        },
        examples => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Example
        },
        requestBodies => {
            attr => 'request-bodies',
            hash => True,
            ref => True,
            type => OpenAPI::Model::RequestBody
        },
        headers => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Header
        },
        securitySchemes => {
            attr => 'security-schemes',
            hash => True,
            ref => True,
            type => OpenAPI::Model::SecurityScheme
        },
        links => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Link
        },
        callbacks => {
            hash => True,
            ref => True,
            type => OpenAPI::Model::Callback
        }
    }] {
    #| Represents a hash that holds reusable Schema Objects.
    has OpenAPI::Model::Schema %.schemas;
    #| Represents a hash that holds reusable Response Objects.
    has OpenAPI::Model::Response %.responses;
    #| Represents a hash that holds reusable Parameter Objects.
    has OpenAPI::Model::Parameter %.parameters;
    #| Represents a hash that holds reusable Example Objects.
    has OpenAPI::Model::Example %.examples;
    #| Represents a hash that holds reusable Request Body Objects.
    has OpenAPI::Model::RequestBody %.request-bodies;
    #| Represents a hash that holds reusable Header Objects.
    has OpenAPI::Model::Header %.headers;
    #| Represents a hash that holds reusable Security Scheme Objects.
    has OpenAPI::Model::SecurityScheme %.security-schemes;
    #| Represents a hash that holds reusable Link Objects.
    has OpenAPI::Model::Link %.links;
    #| Represents a hash that holds reusable Callback Objects.
    has OpenAPI::Model::Callback %.callbacks;

    # Getters
    #| Returns a hash that holds reusable Schema Objects.
    method schemas()          { %!schemas          // Nil }
    #| Returns a hash that holds reusable Response Objects.
    method responses()        { %!responses        // Nil }
    #| Returns a hash that holds reusable Parameter Objects.
    method parameters()       { %!parameters       // Nil }
    #| Returns a hash that holds reusable Example Objects.
    method examples()         { %!examples         // Nil }
    #| Returns a hash that holds reusable Request Body Objects.
    method request-bodies()   { %!request-bodies   // Nil }
    #| Returns a hash that holds reusable Header Objects.
    method headers()          { %!headers          // Nil }
    #| Returns a hash that holds reusable Security Scheme Objects.
    method security-schemes() { %!security-schemes // Nil }
    #| Returns a hash that holds reusable Link Objects.
    method links()            { %!links            // Nil }
    #| Returns a hash that holds reusable Callback Objects.
    method callbacks()        { %!callbacks        // Nil }

    # Setters
    #| Adds schema into components by id.
    method set-schema(Str $id, OpenAPI::Model::Schema:D $schema --> Nil) { %!schemas{$id} = $schema }
    #| Deletes schema from components by id.
    method delete-schema(Str $id) { %!schemas{$id}:delete }
    #| Adds response into components by id.
    method set-response(Str $id, OpenAPI::Model::Response:D $response --> Nil) { %!responses{$id} = $response }
    #| Deletes response from components by id.
    method delete-response(Str $id) { %!responses{$id}:delete }
    #| Adds parameter into components by id.
    method set-parameter(Str $id, OpenAPI::Model::Parameter:D $parameter --> Nil) { %!parameters{$id} = $parameter }
    #| Deletes parameter from components by id.
    method delete-parameter(Str $id) { %!parameters{$id}:delete }
    #| Adds example into components by id.
    method set-example(Str $id, OpenAPI::Model::Example:D $example --> Nil) { %!examples{$id} = $example }
    #| Deletes example from components by id.
    method delete-example(Str $id) { %!examples{$id}:delete }
    #| Adds Response Body into components by id.
    method set-request-body(Str $id, OpenAPI::Model::RequestBody:D $body --> Nil) { %!request-bodies{$id} = $body }
    #| Deletes Response Body from components by id.
    method delete-request-body(Str $id) { %!request-bodies{$id}:delete }
    #| Adds header into components by id.
    method set-header(Str $id, OpenAPI::Model::Header:D $header --> Nil) { %!headers{$id} = $header }
    #| Deletes header from components by id.
    method delete-header(Str $id) { %!headers{$id}:delete }
    #| Adds Security Scheme into components by id.
    method set-security-scheme(Str $id, OpenAPI::Model::SecurityScheme:D $scheme --> Nil) { %!security-schemes{$id} = $scheme }
    #| Deletes Security Scheme from components by id.
    method delete-security-scheme(Str $id) { %!security-schemes{$id}:delete }
    #| Adds link into components by id.
    method set-link(Str $id, OpenAPI::Model::Link:D $link --> Nil) { %!links{$id} = $link }
    #| Deletes link from components by id.
    method delete-link(Str $id) { %!links{$id}:delete }
    #| Adds callback into components by id.
    method set-callback(Str $id, OpenAPI::Model::Callback:D $callback --> Nil) { %!callbacks{$id} = $callback }
    #| Deletes callback from components by id.
    method delete-callback(Str $id) { %!callbacks{$id}:delete }
}
