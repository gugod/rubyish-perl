#!/usr/bin/env perl

use warnings;
use strict;

use lib qw(lib examples/lib);
use Cat;



my $oreo = Cat->new->name("oreo")->color("white")->master("tvcafe");
print "Oreo's sound is " . $oreo->sound . "\n";
print "Oreo's color is " . $oreo->color . ".\n";
print "Oreo's master is " . $oreo->master . ".\n";
print $oreo->superclass->inspect . "\n";
print $oreo->methods->inspect , "\n";
