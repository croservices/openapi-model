use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::OAuthFlow class represents an L<OpenAPI OAuthFlow object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#oauthFlowObject>.
class OpenAPI::Model::OAuthFlow does OpenAPI::Model::Element[
    scalar => {
        authorizationUrl => {
            attr => 'authorization-url'
        },
        tokenUrl => {
            attr => 'token-url'
        },
        refreshUrl => {
            attr => 'refresh-url'
        },
        scopes => {}
    },
    object => {}] {
    #| Represents authorization URL to be used for this flow.
    has Str $.authorization-url is required is rw;
    #| Represents token URL to be used for this flow.
    has Str $.token-url is required is rw;
    #| Represents URL to be used for obtaining refresh tokens.
    has Str $.refresh-url is rw;
    #| Represents a hash that holds available scopes for the OAuth2 security scheme.
    has Str %.scopes;

    # Getters
    #| Returns authorization URL to be used for this flow or Nil.
    method authorization-url() { $!authorization-url // Nil }
    #| Returns token URL to be used for this flow or Nil.
    method token-url()         { $!token-url         // Nil }
    #| Returns URL to be used for obtaining refresh tokens or Nil.
    method refresh-url()       { $!refresh-url       // Nil }
    #| Returns a hash that holds available scopes for the OAuth2 security scheme or Nil.
    method scopes()            { %!scopes            // Nil }
}
