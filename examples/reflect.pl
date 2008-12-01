#!/usr/bin/env perl

use warnings;
use strict;

{
    package Cat;
    use Rubyish;

    attr_accessor "name", "color", "master";

    def sound { "meow, meow" }
}

package main;

my $oreo = Cat->new->name("oreo")->color("white")->master("tvcafe");
print "Oreo's sound is " . $oreo->sound . "\n";
print "Oreo's color is " . $oreo->color . ".\n";
print "Oreo's master is " . $oreo->master . ".\n";
print $oreo->superclass . "\n";
$oreo->methods;
