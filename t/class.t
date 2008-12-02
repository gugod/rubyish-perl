#!/usr/bin/env perl
use strict;
package main;
use Rubyish;
use Rubyish::Syntax::class;

use Test::More;

plan tests => 1;

local $TODO = "inject 'class' keyword and let it define a package.";

class Cat {
    def sound { "meow" };
};


my $pet = Cat->new;

is $pet->sound, "meow";


