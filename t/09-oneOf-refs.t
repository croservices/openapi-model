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
        "/pet": {
            "get": {
                "description": "Gets a pet",
                "responses": {
                    "200": {
                        "description": "A pet.",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/pet"
                                }
                            }
                        }
                    }
                }
            }
        },
        "/pets": {
            "get": {
                "description": "Gets some pets",
                "responses": {
                    "200": {
                        "description": "A list of pets.",
                        "content": {
                            "application/json": {
                                "schema": {
                                    "$ref": "#/components/schemas/pets"
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    "components": {
        "schemas": {
            "dog": {
                "type": "object",
                "properties": {
                    "type": {
                        "type": "string"
                    },
                    "barks": {
                        "type": "boolean"
                    }
                }
            },
            "cat": {
                "type": "object",
                "properties": {
                    "type": {
                        "type": "string"
                    },
                    "meows": {
                        "type": "boolean"
                    }
                }
            },
            "pet": {
                "oneOf": [
                    { "$ref": "#/components/schemas/dog" },
                    { "$ref": "#/components/schemas/cat" }
                ]
            },
            "pets": {
                "type": "array",
                "items": {
                    "oneOf": [
                        { "$ref": "#/components/schemas/dog" },
                        { "$ref": "#/components/schemas/cat" }
                    ]
                }
            }
        }
    }
}
END

my $api = OpenAPI::Model.from-json($json-doc);

is $api.serialize, from-json($json-doc), 'Serialization works';

lives-ok { $api.paths</pet>.get.responses<200>.content<application/json>.schema<oneOf>[0]<properties><barks><type> }, 'oneOf with references are resolved, first element';
lives-ok { $api.paths</pet>.get.responses<200>.content<application/json>.schema<oneOf>[1]<properties><meows><type> }, 'oneOf with references are resolved, second element';

lives-ok { $api.paths</pets>.get.responses<200>.content<application/json>.schema<items><oneOf>[0]<properties><barks><type> }, 'list of oneOfs with references are resolved, first element';
lives-ok { $api.paths</pets>.get.responses<200>.content<application/json>.schema<items><oneOf>[1]<properties><meows><type> }, 'list of oneOfs with references are resolved, second element';

done-testing;
