#!/usr/bin/env perl

use lib 'lib';
use Cat;

my $oreo = Cat->new;

$oreo->name("Oreo");

$oreo->meow;

$oreo->play(qw(CHEESE BURGER));

print '$oreo is a ' . ref($oreo) . "\n";

print $oreo->to_yaml;
