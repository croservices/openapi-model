use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::OAuthFlow;

#| The OpenAPI::Model::OAuthFlows class represents an L<OpenAPI OAuthFlows object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#oauthFlowsObject>.
class OpenAPI::Model::OAuthFlows does OpenAPI::Model::Element[
    scalar => {},
    object => {
        implicit => {
            type => OpenAPI::Model::OAuthFlow
        },
        password => {
            type => OpenAPI::Model::OAuthFlow
        },
        clientCredentials => {
            attr => 'client-credentials',
            type => OpenAPI::Model::OAuthFlow
        },
        authorizationCode => {
            attr => 'authorization-code',
            type => OpenAPI::Model::OAuthFlow
        },
    }] {
    #| Represents configuration for the OAuth Implicit flow.
    has OpenAPI::Model::OAuthFlow $.implicit;
    #| Represents configuration for the OAuth Resource Owner Password flow.
    has OpenAPI::Model::OAuthFlow $.password;
    #| Represents configuration for the OAuth Client Credentials flow.
    has OpenAPI::Model::OAuthFlow $.client-credentials;
    #| Represents configuration for the OAuth Authorization Code flow.
    has OpenAPI::Model::OAuthFlow $.authorization-code;

    # Getters
    #| Returns configuration for the OAuth Implicit flow or Nil.
    method implicit()           { $!implicit // Nil };
    #| Returns configuration for the OAuth Resource Owner Password flow or Nil.
    method password()           { $!password // Nil };
    #| Returns configuration for the OAuth Client Credentials flow or Nil.
    method client-credentials() { $!client-credentials // Nil };
    #| Returns configuration for the OAuth Authorization Code flow or Nil.
    method authorization-code() { $!authorization-code // Nil };

    # Setters
    #| Sets Implicit based flow to Nil.
    multi method set-implicit(Any:U) { $!implicit = Nil }
    #| Sets Implicit based flow to given value.
    multi method set-implicit(OpenAPI::Model::OAuthFlow:D $!implicit --> Nil) {
        $!implicit.set-model($!model);
    }

    #| Sets Password based flow to Nil.
    multi method set-password(Any:U) { $!password = Nil }
    #| Sets Password based flow to given value.
    multi method set-password(OpenAPI::Model::OAuthFlow:D $!password --> Nil) {
        $!password.set-model($!model);
    }

    #| Sets Client Credentials based flow to Nil.
    multi method set-client-credentials(Any:U) { $!client-credentials = Nil }
    #| Sets Client Credentials based flow to given value.
    multi method set-client-credentials(OpenAPI::Model::OAuthFlow:D $!client-credentials --> Nil) {
        $!client-credentials.set-model($!model);
    }

    #| Sets Authorization-Code based flow to Nil.
    multi method set-authorization-code(Any:U) { $!authorization-code = Nil }
    #| Sets Authorization-Code based flow to given value.
    multi method set-authorization-code(OpenAPI::Model::OAuthFlow:D $!authorization-code --> Nil) {
        $!authorization-code.set-model($!model);
    }
}
