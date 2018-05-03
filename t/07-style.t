use v6.c;
use Test;
use YAMLish;
use OpenAPI::Model;

my $yaml = q:to/END/;
name: token
in: header
description: token to be passed as a header
required: true
schema:
  type: array
  items:
    type: integer
    format: int64
END

my $api;

lives-ok { $api = OpenAPI::Model::Parameter.deserialize(load-yaml($yaml), OpenAPI::Model.new) }, 'Can parse parameter object';

is $api.style, 'simple', 'Default style is correct';
nok $api.explode, 'Not explode by default for simple style';

$yaml = q:to/END/;
contentType: image/png, image/jpeg
headers:
  X-Rate-Limit-Limit:
    description: The number of allowed requests in the current period
    schema:
      type: integer
END

lives-ok { $api = OpenAPI::Model::Encoding.deserialize(load-yaml($yaml), OpenAPI::Model.new) }, 'Can parse encoding object';

is $api.style, 'form', 'Default style is correct';
ok $api.explode, 'Explode by default for form style';

done-testing;
