#!/usr/bin/env perl
# $File: //member/autrijus/DateTime-Functions/Makefile.PL $ $Author: autrijus $
# $Revision: #1 $ $Change: 8643 $ $DateTime: 2003/11/01 06:14:05 $

use 5.006;
use inc::Module::Install;

name	    ( 'DateTime-Functions' );
abstract    ( 'Procedural interface to DateTime functions' );
author	    ( 'Autrijus Tang (autrijus@autrijus.org)' );
version_from( 'lib/DateTime/Functions.pm' );
requires    ( 'DateTime' );
sign	    ( 1 );

&Meta->write;
&Makefile->write;
