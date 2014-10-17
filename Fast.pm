package CGI::Pure::Fast;

# Pragmas.
use base qw(CGI::Pure);
use strict;
use warnings;

# Modules.
use FCGI;
use Readonly;

# Constants.
Readonly::Scalar my $FCGI_LISTEN_QUEUE_DEFAULT => 100;

# Version.
our $VERSION = 0.05;

# External request.
our $EXT_REQUEST;

# Workaround for known bug in libfcgi.
# XXX Remove?
while (each %ENV) { }

# If ENV{'FCGI_SOCKET_PATH'} is specified, we maintain a FCGI Request handle
# in this package variable.
BEGIN {

	# If ENV{FCGI_SOCKET_PATH} is given, explicitly open the socket,
	# and keep the request handle around from which to call Accept().
	if ($ENV{'FCGI_SOCKET_PATH'}) {
		my $path = $ENV{'FCGI_SOCKET_PATH'};
		my $backlog = $ENV{'FCGI_LISTEN_QUEUE'}
			|| $FCGI_LISTEN_QUEUE_DEFAULT;
		my $socket  = FCGI::OpenSocket($path, $backlog);
		$EXT_REQUEST = FCGI::Request(\*STDIN, \*STDOUT, \*STDERR,
			\%ENV, $socket, 1);
	}
}

# New is slightly different in that it calls FCGI's accept() method.
sub new {
	my ($class, %params) = @_;
	if (! exists $params{'init'}) {
		if ($EXT_REQUEST) {
			if ($EXT_REQUEST->Accept < 0) {
				return;
			}
		} else {
			my $req = FCGI::Request;
			if ($req->Accept < 0) {
				return;
			}
		}
	}
	my $self = $class->SUPER::new(%params);
	return $self;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

CGI::Pure::Fast - Fast Common Gateway Interface Class for CGI::Pure.

=head1 SYNOPSIS

 use CGI::Pure::Fast;
 my $cgi = CGI::Pure::Fast->new(%parameters);
 $cgi->append_param('par', 'value');
 my @par_value = $cgi->param('par');
 $cgi->delete_param('par');
 $cgi->delete_all_params;
 my $query_string = $cgi->query_string;
 $cgi->upload('filename', '~/filename');
 my $mime = $cgi->upload_info('filename', 'mime');
 my $query_data = $cgi->query_data;

=head1 METHODS

=over 8

=item B<new(%parameters)>

 Constructor.
 Extends CGI::Pure for FCGI.

=back

 Other methods are same as CGI::Pure.

=head1 DEPENDENCIES

L<CGI::Pure>,
L<FCGI>,
L<Readonly>.

=head1 SEE ALSO

L<CGI::Pure>,
L<CGI::Pure::ModPerl2>,
L<CGI::Pure::Save>.

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

BSD license.

=head1 VERSION

0.05

=cut
