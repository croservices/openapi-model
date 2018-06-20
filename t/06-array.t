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
            },
            "responses": {
                "UnAuthorized": {
                    "description": "Signature is missing",
                    "headers": {
                        "X-HMAC": {
                            "schema": {
                                "type": "string"
                            }
                        }
                    }
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
                    ],
                    "responses": {
                        "401": {
                            "$ref": "#/components/responses/UnAuthorized"
                        }
                    }
                }
            }
        }
}
END

my $api;

lives-ok { $api = OpenAPI::Model.from-json($json) }, 'Can parse document';

lives-ok { $api.serialize }, 'Can serialize document';

done-testing;
