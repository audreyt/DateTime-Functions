#!/usr/bin/env perl
use 5.006;
use inc::Module::Install;

name	    'DateTime-Functions';
license     'CC0';
all_from    'lib/DateTime/Functions.pm';
requires    'DateTime';

sign; WriteAll;
