#!/usr/bin/env perl
use strict;
use lib 't/lib';
use Test::More;
use Simple;

plan tests => 2;

my $obj = Simple->new;

# A Rubyish::Array object.
my $methods = $obj->methods;

TODO : {
    local $TODO = "Need to traverse the object hirechy to get all methods of an object.";

    # The object of Simple should at least has one method named "hello"
    ok $methods->size >= 1;

    # A Rubyish::Array can be deref to be a Perl array.
    ok grep { /hello/ } @$methods;
}
