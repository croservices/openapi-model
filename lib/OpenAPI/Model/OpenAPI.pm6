use v6.c;

class OpenAPI::Model::OpenAPI {
    has Str $.openapi is required is rw is default(Nil);
    has Info $.info is required is default(Nil);
    has Server @.servers is default(Nil);
    has Path @.paths is required is default(Nil);
    has Component $.components is default(Nil);
    has Security @.security is default(Nil);
    has Tag @.tags is default(Nil);
    has ExternalDocs $.external-docs is default(Nil);

    multi method set-openapi(Any:U) {
        $!openapi = Nil;
    }
    multi method set-openapi(Str $!openapi --> Nil) {}

    multi method set-info(Any:U) {
        $!info = Nil;
    }
    multi method set-info(Info $!info --> Nil) {
        $!info.set-model($!model);
    }

    multi method set-external-docs(Any:U) {
        $!external-docs = Nil;
    }
    multi method set-external-docs(ExternalDocs:D $!externalDocs --> Nil) {
        $!externalDocs.set-model($!model);
    }
}
