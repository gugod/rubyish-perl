#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Cat;

my $oreo = Cat->new->name("Oreo");

print $oreo->sound . "\n";

$oreo->play(qw(CHEESE BURGER));

print '$oreo is a ' . ref($oreo) . "\n";

print "Oreo to YAML:\n" . $oreo->to_yaml;
