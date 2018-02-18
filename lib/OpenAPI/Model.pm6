use OpenAPI::Model::Operation;
use OpenAPI::Model::OpenAPI;
use JSON::Fast;
use YAMLish;

class OpenAPI::Model {
    my package EXPORT::elements {
        constant Operation = OpenAPI::Model::Operation;
    }

    method from-yaml($yaml, :%external, :$check-references) {
        OpenAPI::Model::OpenAPI.deserialize(load-yaml $yaml);
    }
    method from-json($json, :%external, :$check-references) {
        OpenAPI::Model::OpenAPI.deserialize(from-json $json);
    }
}
