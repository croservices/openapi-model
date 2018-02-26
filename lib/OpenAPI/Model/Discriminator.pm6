use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::Discriminator class represents an L<OpenAPI Discriminator object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#discriminatorObject>.
class OpenAPI::Model::Discriminator does OpenAPI::Model::Element[
    scalar => {
        propertyName => {
            attr => 'property-name'
        },
        mapping => {}
    },
    object => {}] {
    #| Represents name of the property in the payload that will hold the discriminator value.
    has Str $.property-name is required is rw;
    #| Represents hash that holds schema names or references by payload values.
    has Str %.mapping is rw;

    # Getters
    #| Returns name of the property in the payload that will hold the discriminator value.
    method property-name() { $!property-name // Nil }
    #| Returns hash that holds schema names or references by payload values.
    method mapping()       { %!mapping      // Nil }
}
