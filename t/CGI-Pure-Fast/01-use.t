# Pragmas.
use strict;
use warnings;

# Modules.
use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('CGI::Pure::Fast');
}

# Test.
require_ok('CGI::Pure::Fast');
