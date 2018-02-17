use OpenAPI::Model::Operation;

class OpenAPI::Model {
    my package EXPORT::elements {
        constant Operation = OpenAPI::Model::Operation;
    }

    method from-yaml($yaml, :%external, :$check-references) {}
    method from-json($json, :%external, :$check-references) {}
}
