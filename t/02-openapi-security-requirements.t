use v6.c;
use Test;
use JSON::Fast;
use OpenAPI::Model;
use OpenAPI::Model::Security;

my $json1 = q:to/END/;
{
    "api_key": []
}
END

my $json2 = q:to/END/;
{
    "petstore_auth": [
        "write:pets",
        "read:pets"
    ]
}
END

my $api;

lives-ok { $api = OpenAPI::Model::Security.deserialize((from-json $json1), OpenAPI::Model.new) }, 'Can parse empty rule';

ok $api<api_key> == [], 'First schema is parsed';

lives-ok { $api = OpenAPI::Model::Security.deserialize((from-json $json2), OpenAPI::Model.new) }, 'Can parse non-empty rule';

ok $api<petstore_auth> eqv ["write:pets", "read:pets"], 'Second schema is parsed';

done-testing;
