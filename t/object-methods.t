#!/usr/bin/env perl
use strict;
use lib 't/lib';
use Test::More;
use Simple;

plan tests => 2;

my $obj = Simple->new;

my @methods = $obj->methods;

TODO : {
    local $TODO = "Need to traverse the object hirechy to get all methods of an object.";

    is scalar(@methods), 1;
    is_deeply( \@methods, ["hello"] );
}
