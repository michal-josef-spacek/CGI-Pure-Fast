# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Fast Common Gateway Interface Class for CGI::Pure.';
author 'Michal Špaček <skim@cpan.org>';
license 'bsd';
name 'CGI-Pure-Fast';
requires 'CGI::Pure' => 0.01;
requires 'FCGI' => 0;
requires 'Readonly' => 0;
resources 'repository' => {
	'url' => 'git://github.com/tupinek/CGI-Pure-Fast',
	'web' => 'https://github.com/tupinek/CGI-Pure-Fast',
	'type' => 'git',
};
test_requires 'English' => 0;
test_requires 'File::Object' => 0.01;
test_requires 'Test::More' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
