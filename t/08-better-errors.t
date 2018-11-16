use v6.c;
use Test;
use OpenAPI::Model;

my $yaml-doc = q:to/END/;
openapi: "3.0.1"
info:
  title: VoteImproved API
  version: "0.0.1"

paths:
  /users:
    post:
      responses:
        201:
          description: Create a new User
          headers:
            - $ref: '#/components/headers/Location'
END

my $api; 

throws-like {
    $api = OpenAPI::Model.from-yaml($yaml-doc)
}, X::OpenAPI::Model::IncorrectSyntax, message => /'Hash' .+? 'Array' .+? 'Response'/,
  'Correct exception array instead of hash';

$yaml-doc = q:to/END/;
openapi: "3.0.1"
info:
  title: VoteImproved API
  version: "0.0.1"

paths:
  /users:
    post:
      responses:
        201:
          description: Create a new User
          headers:
            $ref: '#/components/headers/Location'
END

lives-ok { my $api = OpenAPI::Model.from-yaml($yaml-doc) }, 'RefSchema is handled without exception';

done-testing;
