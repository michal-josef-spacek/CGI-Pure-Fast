# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Fast Common Gateway Interface Class for CGI::Pure.';
author 'Michal Spacek <skim@cpan.org>';
license 'bsd';
name 'CGI-Pure-Fast';
requires 'CGI::Pure' => 0.01;
requires 'FCGI' => 0;
requires 'Readonly' => 0;
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=CGI-Pure-Fast';
resources 'homepage' => 'https://github.com/tupinek/CGI-Pure-Fast';
resources 'repository' => 'git://github.com/tupinek/CGI-Pure-Fast';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.01;
test_requires 'Test::More' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.02';

# Run.
WriteAll();
