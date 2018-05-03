use v6.c;
use Test;
use OpenAPI::Model;
use JSON::Fast;

my $json = q:to/END/;
    {
        "openapi": "3.0.0",
        "info": {
            "version": "1.0.0",
            "title": "Cro Test Case"
        },
        "components": {
            "securitySchemes": {
                "api_key": {
                  "type": "apiKey",
                  "name": "X-APIKey",
                  "in": "header"
                }
            }
        },
        "paths": {
            "/public": {
                "get": {
                    "summary": "Public operation",
                    "operationId": "public"
                }
            },
            "/private": {
                "get": {
                    "summary": "Private operation",
                    "operationId": "private",
                    "security": [
                        {
                            "api_key": []
                        }
                    ]
                }
            }
        }
}
END

my $api;

lives-ok { $api = OpenAPI::Model.from-json($json) }, 'Can parse the document';

say $api.serialize;

done-testing;
