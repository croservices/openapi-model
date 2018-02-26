use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::PatternedObject;

#| The OpenAPI::Model::Security class represents an L<OpenAPI Security Requirement object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#securityRequirementObject>.
class OpenAPI::Model::Security does OpenAPI::Model::PatternedObject does OpenAPI::Model::Element[
    scalar => {},
    object => {},
    :patterned] {
    submethod TWEAK(*%args) {
        self!set-fields(%args)
    }

    #| Adds security rule into security requirements scheme by id.
    method set-security(Str $id, Str @scheme) { %!container{$id} = @scheme }
    #| Deletes security rule from security requirements scheme by id.
    method delete-security(Str $id) { %!container{$id}:delete }
    #| Returns array of security rules by id.
    method get-security(Str $id) { %!container{$id} }
}
