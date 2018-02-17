use OpenAPI::Model;

role OpenAPI::Model::Element [:%scalar, :%object] {
    has OpenAPI::Model $.model;

    method set-model($!model) {}

    method deserialize($source) {}
    method serialize() {}
    submethod BUILD() {}
}
