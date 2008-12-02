#!/usr/bin/env perl

use strict;

use lib 't/lib';

use Rubyish;

use Test::More;
plan tests => 4;

my $array = Array([0..100]);

is $array->at(3), 3;
is $array->[3], 3;
is $array->size, 101;
is $array->length, 101;
