#!/usr/bin/env perl
use strict;

use Rubyish;

use Test::More "no_plan";

can_ok( "Rubyish::Dir", qw(new pwd) );

ok( Rubyish::Dir->pwd );

