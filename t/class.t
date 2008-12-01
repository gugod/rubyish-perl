#!/usr/bin/env perl
use strict;
use Rubyish;
use Rubyish::Syntax::class;

class Cat {
    def sound { "meow" };
};

package main;
use Test::More;
plan tests => 1;

my $pet = Cat->new;

is $pet->sound, "meow";


