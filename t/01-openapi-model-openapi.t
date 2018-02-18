use v6.c;
use Test;
use OpenAPI::Model::OpenAPI;

my $api = OpenAPI::Model::OpenAPI.new(
    openapi => '3.0.0',
    info => OpenAPI::Model::Info.new,
    paths => [OpenAPI::Model::Path.new],
);

done-testing;
