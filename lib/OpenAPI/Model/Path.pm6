use v6.c;

use OpenAPI::Model::Element;
use OpenAPI::Model::Operation;
use OpenAPI::Model::Parameter;
use OpenAPI::Model::Server;

#| The OpenAPI::Model::OpenAPI class represents an L<OpenAPI Path object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#pathObject>.
class OpenAPI::Model::Path does OpenAPI::Model::Element[
    scalar => {
        '$ref' => {
            attr => 'ref'
        },
        summary => {},
        description => {}
    },
    object => {
        get => {
            type => OpenAPI::Model::Operation
        },
        put => {
            type => OpenAPI::Model::Operation
        },
        post => {
            type => OpenAPI::Model::Operation
        },
        delete => {
            type => OpenAPI::Model::Operation
        },
        options => {
            type => OpenAPI::Model::Operation
        },
        head => {
            type => OpenAPI::Model::Operation
        },
        patch => {
            type => OpenAPI::Model::Operation
        },
        trace => {
            type => OpenAPI::Model::Operation
        },
        servers => {
            type => OpenAPI::Model::Server,
            array => True
        },
        parameters => {
            type => OpenAPI::Model::Parameter,
            ref => True,
            array => True
        }
    }] {
    #| Represents an external definition of this path item.
    has Str $.ref is rw;
    #| Represents an optional, string summary, intended to apply to all operations in this path.
    has Str $.summary is rw;
    #| Represents an optional, string description, intended to apply to all operations in this path.
    has Str $.description is rw;
    #| Represents a definition of a GET operation on this path.
    has OpenAPI::Model::Operation $.get;
    #| Represents a definition of a PUT operation on this path.
    has OpenAPI::Model::Operation $.put;
    #| Represents a efinition of a POST operation on this path.
    has OpenAPI::Model::Operation $.post;
    #| Represents a definition of a DELETE operation on this path.
    has OpenAPI::Model::Operation $.delete;
    #| Represents a definition of a OPTIONS operation on this path.
    has OpenAPI::Model::Operation $.options;
    #| Represents a definition of a HEAD operation on this path.
    has OpenAPI::Model::Operation $.head;
    #| Represents a definition of a PATCH operation on this path.
    has OpenAPI::Model::Operation $.patch;
    #| Represents a definition of a TRACE operation on this path.
    has OpenAPI::Model::Operation $.trace;
    #| Represents an alternative server array to service all operations in this path.
    has OpenAPI::Model::Server @.servers;
    #| Represents a list of parameters that are applicable for all the operations described under this path. 
    has OpenAPI::Model::Parameter @.parameters;

    # Getters
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method get()        { $!get        // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method put()        { $!put        // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method post()       { $!post       // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method delete()     { $!delete     // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method options()    { $!options    // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method head()       { $!head       // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method patch()      { $!patch      // Nil }
    #| Returns an L<OpenAPI Operation object|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#operationObject> or Nil.
    method trace()      { $!trace      // Nil }
    #| Returns an Array of L<OpenAPI Server objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#serverObject> or Nil.
    method servers()    { @!servers    // Nil }
    #| Returns an Array of L<OpenAPI Parameter objects|https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#parameterObject> or Nil.
    method parameters() { @!parameters // Nil }

    # Setters
    #| Sets get to Nil.
    multi method set-get(Any:U) { $!get = Nil }
    #| Sets get to given value.
    multi method set-get(OpenAPI::Model::Operation:D $!get --> Nil) {
        $!get.set-model($!model);
    }

    #| Sets put to Nil.
    multi method set-put(Any:U) { $!put = Nil }
    #| Sets put to given value.
    multi method set-put(OpenAPI::Model::Operation:D $!put --> Nil) {
        $!put.set-model($!model);
    }

    #| Sets post to Nil.
    multi method set-post(Any:U) { $!post = Nil }
    #| Sets post to given value.
    multi method set-post(OpenAPI::Model::Operation:D $!post --> Nil) {
        $!post.set-model($!model);
    }

    #| Sets delete to Nil.
    multi method set-delete(Any:U) { $!delete = Nil }
    #| Sets delete to given value.
    multi method set-delete(OpenAPI::Model::Operation:D $!delete --> Nil) {
        $!delete.set-model($!model);
    }

    #| Sets options to Nil.
    multi method set-options(Any:U) { $!options = Nil }
    #| Sets options to given value.
    multi method set-options(OpenAPI::Model::Operation:D $!options --> Nil) {
        $!options.set-model($!model);
    }

    #| Sets head to Nil.
    multi method set-head(Any:U) { $!head = Nil }
    #| Sets head to given value.
    multi method set-head(OpenAPI::Model::Operation:D $!head --> Nil) {
        $!head.set-model($!model);
    }

    #| Sets patch to Nil.
    multi method set-patch(Any:U) { $!patch = Nil }
    #| Sets patch to given value.
    multi method set-patch(OpenAPI::Model::Operation:D $!patch --> Nil) {
        $!patch.set-model($!model);
    }

    #| Sets trace to Nil.
    multi method set-trace(Any:U) { $!trace = Nil }
    #| Sets trace to given value.
    multi method set-trace(OpenAPI::Model::Operation:D $!trace --> Nil) {
        $!trace.set-model($!model);
    }

    #| Adds given Server to Server array.
    multi method add-server(OpenAPI::Model::Server $server) { $server.set-model($!model); @!servers.push: $server }
    #| Removes given Server from Server array.
    multi method remove-server(OpenAPI::Model::Server $server --> Nil) { @!servers .= grep({ not $_ eqv $server}) }

    #| Adds given Parameter to parameters array.
    multi method add-parameter(OpenAPI::Model::Parameter $parameter) { $parameter.set-model($!model); @!parameters.push: $parameter }
    #| Removes given Parameter from parameters array.
    multi method remove-parameter(OpenAPI::Model::Parameter $parameter --> Nil) { @!parameters .= grep({ not $_ eqv $parameter}) }
}
