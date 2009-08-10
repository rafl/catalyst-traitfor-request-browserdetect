package TestApp;

use Moose;
use CatalystX::RoleApplicator;
use namespace::autoclean;

extends 'Catalyst';

__PACKAGE__->apply_request_class_roles(
    'Catalyst::TraitFor::Request::BrowserDetect',
);

__PACKAGE__->setup;

1;
