use v6.c;
use Test;
use JSON::Fast;
use OpenAPI::Model::Reference;
use OpenAPI::Model;

my $json-doc = q:to/END/;
{
    "openapi": "3.0.0",
    "info": {
        "title": "Link Example",
        "version": "1.0.0"
    },
    "paths": {
        "/2.0/repositories/{username}": {
            "get": {
                "operationId": "getRepositoriesByOwner",
                "parameters": [
                    {
                        "name": "username",
                        "in": "path",
                        "required": true,
                        "schema": {
                            "type": "string"
                        }
                    }
                ],
                "responses": {
                    "200": {
                        "description": "repositories owned by the supplied user",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "type": "array",
                                    "items": {
                                        "$ref": "#/components/schemas/repository"
                                    }
                                }
                            }
                        },
                        "links": {
                            "userRepository": {
                                "$ref": "#/components/links/UserRepository"
                            }
                        }
                    }
                }
            }
        }
    },
    "components": {
        "links": {
            "UserRepository": {
                "operationId": "getRepository",
                "parameters": {
                    "username": "$response.body#/owner/username",
                    "slug": "$response.body#/slug"
                }
            }
        },
        "schemas": {
            "repository": {
                "type": "object",
                "properties": {
                    "slug": {
                        "type": "string"
                    },
                    "owner": {
                        "$ref": "#/components/schemas/user"
                    }
                }
            }
        }
    }
}
END

my $api;

lives-ok { $api = OpenAPI::Model.from-json($json-doc) }, 'Can parse the document';

is $api.serialize, from-json($json-doc), 'Serialization works';

my $link1 = $api.paths</2.0/repositories/{username}>.get.responses<200>.links<userRepository>;
my $link2 = $api.paths</2.0/repositories/{username}>.get.responses<200>.get-link('userRepository');

my $ref = $api.paths</2.0/repositories/{username}>.get.responses<200>.raw-get-link('userRepository');

ok $link1 !~~ OpenAPI::Model::Reference, 'AT-KEY gives resolved link';
ok $link2 !~~ OpenAPI::Model::Reference, 'get-link gives resolved link';
ok $ref    ~~ OpenAPI::Model::Reference, 'raw-get-link gives Reference object';

done-testing;
