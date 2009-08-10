package Catalyst::TraitFor::Request::BrowserDetect;

use Moose::Role;
use aliased 'HTTP::BrowserDetect';
use namespace::autoclean;

has browser => (
    is      => 'ro',
    isa     => BrowserDetect,
    lazy    => 1,
    builder => '_build_browser',
);

requires 'user_agent';

sub _build_browser {
    my ($self) = @_;
    return BrowserDetect->new($self->user_agent);
}

1;
