# Pragmas.
use strict;
use warnings;

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
	'NAME' => 'CGI::Pure::Fast',
	'PREREQ_PM' => {
		'CGI::Pure' => 0,
		'FCGI' => 0,
		'Readonly' => 0,
	},
	'VERSION' => 0.01,
	'test' => {
		'TESTS' => 't/CGI::Pure::Fast/*.t',
	},
);
