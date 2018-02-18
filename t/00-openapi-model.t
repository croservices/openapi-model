use v6.c;
use Test;
use OpenAPI::Model;

my $json-doc = q:to/END/;
{
    "openapi": "3.0.0",
    "info": {
        "title": "Sample Pet Store App",
        "termsOfService": "http://example.com/terms/",
        "version": "1.0.1"
    },
    "paths": {}
}
END

my $api;

lives-ok { $api = OpenAPI::Model.from-json($json-doc) }, 'Can parse the document';

done-testing;
