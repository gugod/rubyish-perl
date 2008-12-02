#!/usr/bin/env perl
use strict;
package main;
use Rubyish;
use Rubyish::Syntax::class;

use Test::More;

plan skip_all => "Test this after we inject 'class' keyword and let it define a package.";

class Cat {
    def sound { "meow" };
};


my $pet = Cat->new;

is $pet->sound, "meow";


