use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Path;
use OpenAPI::Model::PatternedObject;

#| The OpenAPI::Model::Paths class represents an L<OpenAPI Paths object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#pathsObject>.
class OpenAPI::Model::Paths does OpenAPI::Model::PatternedObject does OpenAPI::Model::Element[
    scalar => {},
    object => {},
    :patterned(OpenAPI::Model::Path)] {
    submethod TWEAK(*%args) {
        self!set-fields(%args)
    }

    #| Adds path to paths by id.
    method set-path(Str $id, OpenAPI::Model::Path $path) { %!container{$id} = $path }
    #| Deletes path from paths by id.
    method delete-path(Str $id) { %!container{$id}:delete }
    #| Returns OpenAPI::Model::Path object  by id.
    method get-path(Str $id) { %!container{$id} }
}
