#!/usr/bin/env perl

use strict;

use lib 't/lib';

use Rubyish;

use Test::More;
plan tests => 1;

my $array = Array([0..100]);

is $array->at(3), 3;
