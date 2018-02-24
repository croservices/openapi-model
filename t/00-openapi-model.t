use v6.c;
use Test;
use OpenAPI::Model;

my $json-doc = q:to/END/;
{
    "openapi": "3.0.0",
    "info": {
        "title": "Sample Pet Store App",
        "termsOfService": "http://example.com/terms/",
        "version": "1.0.1",
        "contact": {
            "name": "API Support",
            "url": "http://www.example.com/support",
            "email": "support@example.com"
        },
        "license": {
            "name": "Apache 2.0",
            "url": "http://www.apache.org/licenses/LICENSE-2.0.html"
        }
    },
    "paths": {},
    "servers": [
        {
            "url": "https://development.gigantic-server.com/v1",
            "description": "Development server"
        },
        {
            "url": "https://staging.gigantic-server.com/v1",
            "description": "Staging server"
        },
        {
            "url": "https://{username}.gigantic-server.com:{port}/{basePath}",
            "description": "The production API server",
            "variables": {
                "username": {
                    "default": "demo",
                    "description": "this value is assigned by the service provider, in this example `gigantic-server.com`"
                },
                "port": {
                    "enum": [
                        "8443",
                        "443"
                    ],
                    "default": "8443"
                },
                "basePath": {
                    "default": "v2"
                }
            }
        }
    ]
}
END

my $api;

lives-ok { $api = OpenAPI::Model.from-json($json-doc) }, 'Can parse the document';

is $api.openapi, '3.0.0', 'openapi version is correct';

is $api.info.title, 'Sample Pet Store App', 'Info title is correct';
is $api.info.terms-of-service, 'http://example.com/terms/', 'Info terms of service url is correct';
is $api.info.version, '1.0.1', 'Info version is correct';

is $api.info.contact.name, 'API Support', 'Info Contact name is correct';
is $api.info.contact.url, 'http://www.example.com/support', 'Info Contact url is correct';
is $api.info.contact.email, 'support@example.com', 'Info Contact email is correct';

is $api.info.license.name, 'Apache 2.0', 'Info License name is correct';
is $api.info.license.url, 'http://www.apache.org/licenses/LICENSE-2.0.html', 'Info License url is correct';

is $api.servers.elems, 3, 'Correct number of servers';
is $api.servers[0].url, 'https://development.gigantic-server.com/v1', 'First server url is correct';
is $api.servers[1].description, 'Staging server', 'Second server description is correct';
is $api.servers[2].variables<username>.default, 'demo', 'username variable of third server is correct';
is $api.servers[2].variables<port>.enum[1], 443, 'port variable of third server is correct';

done-testing;
