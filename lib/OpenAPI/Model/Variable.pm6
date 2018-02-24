use v6.c;

use OpenAPI::Model::Element;

#| The OpenAPI::Model::OpenAPI class represents an L<OpenAPI Server Variable object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverVariableObject>.
class OpenAPI::Model::Variable does OpenAPI::Model::Element[
    scalar => {
        enum => {},
        default => {},
        description => {}
    }] {
    #| Represents an enumeration of string values to be used if the substitution options are from a limited set.
    has Str @.enum is rw;
    #| Represents the default value to use for substitution, and to send, if an alternate value is not supplied.
    has Str $.default is required is rw;
    #| Represents an optional description for the server variable.
    has Str $.description is rw;

    # Getters
    #| Returns  an enumeration of string values to be used if the substitution options are from a limited set or Nil.
    method enum() { @!enum // Nil }
    #| Returns the default value to use for substitution, and to send, if an alternate value is not supplied or Nil.
    method default() { $!default // Nil }
    #| Returns an optional description for the server variable or Nil.
    method description() { $!description // Nil }
}
