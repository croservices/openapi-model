use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::OAuthFlows;

#| The OpenAPI::Model::SecurityScheme class represents an L<OpenAPI Security Scheme object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securitySchemeObject>.
class OpenAPI::Model::SecurityScheme does OpenAPI::Model::Element[
    scalar => {
        type => {},
        description => {},
        name => {},
        in => {},
        scheme => {},
        bearerFormat => {
            attr => 'bearer-format'
        },
        openIdConnectUrl => {
            attr => 'open-id-connect-url'
        }
    },
    object => {
        flows => {
            type => OpenAPI::Model::OAuthFlows
        }
    }] {
    #| Represents type of the security scheme.
    subset Scheme of Str where 'apiKey'|'http'|'oauth2'|'openIdConnect';
    has Scheme $.type is required is rw;
    #| Represents a short description for security scheme.
    has Str $.description is rw;
    #| Represents name of the header, query or cookie parameter to be used.
    has Str $.name is required is rw;
    #| Represents location of the API key.
    subset In of Str where 'query'|'header'|'cookie';
    has In $.in is required is rw;
    #| Represents name of the HTTP Authorization scheme.
    has Str $.scheme is required is rw;
    #| Represents hint to the client to identify how the bearer token is formatted.
    has Str $.bearer-format is rw;
    #| Represents an object containing configuration information for the flow types supported.
    has OpenAPI::Model::OAuthFlows $.flows;
    #| Represents OpenId Connect URL to discover OAuth2 configuration values.
    has Str $.open-id-connect-url is required is rw;

    # Getters
    #| Returns type of the security scheme or Nil.
    method type()                { $!type                // Nil }
    #| Returns a short description for security scheme or Nil.
    method description()         { $!description         // Nil }
    #| Returns name of the header, query or cookie parameter to be used or Nil.
    method name()                { $!name                // Nil }
    #| Returns location of the API key or Nil.
    method in()                  { $!in                  // Nil }
    #| Returns name of the HTTP Authorization scheme or Nil.
    method scheme()              { $!scheme              // Nil }
    #| Returns hint to the client to identify how the bearer token is formatted or Nil.
    method bearer-format()       { $!bearer-format       // Nil }
    #| Returns an object containing configuration information for the flow types supported or Nil.
    method flows()               { $!flows               // Nil }
    #| Returns OpenId Connect URL to discover OAuth2 configuration values or Nil.
    method open-id-connect-url() { $!open-id-connect-url // Nil }

    # Setters
    #| Sets Contact to Nil.
    multi method set-flows(Any:U) { $!flows = Nil }
    #| Sets Contact to given value.
    multi method set-flows(OpenAPI::Model::OAuthFlows:D $!flows --> Nil) {
        $!flows.set-model($!model);
    }
}
