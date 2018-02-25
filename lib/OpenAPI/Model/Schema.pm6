use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::Schema class represents an L<OpenAPI Schema object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#schemaObject>.
class OpenAPI::Model::Schema does OpenAPI::Model::Element[
    scalar => {},
    object => {}] {
    has %.schema;

    submethod BUILD(*%args) {
        %!schema = %args;
    }
}
