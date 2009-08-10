package Catalyst::TraitFor::Request::BrowserDetect;
# ABSTRACT: Browser detection for Catalyst::Requests

use Moose::Role;
use aliased 'HTTP::BrowserDetect';
use namespace::autoclean;


=head1 SYNOPSIS

    package MyApp;

    use Moose;
    use namespace::autoclean;

    use Catalyst;
    use CatalystX::RoleApplicator;

    extends 'Catalyst';

    __PACKAGE__->apply_request_class_roles(qw/
        Catalyst::TraitFor::Request::BrowserDetect
    /);

    __PACKAGE__->setup;

=head1 DESCRIPTION

Extend request objects with a method for browser detection.

=attr browser

    my $browser = $ctx->request->browser;

Returns an C<HTTP::BrowserDetect> instance for the request. This allows you to
get information about the client's user agent.

=cut

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
