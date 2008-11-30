#!/usr/bin/env perl
use strict;
use lib 't/lib';
use Test::More;
use Cat;

plan tests => 2;

my $pet = Cat->new;
$pet->__send__(name => "oreo");

is $pet->name, "oreo", "__send__ method works";

$pet->send(weight => "5kg");

is $pet->weight, "5kg", "send method also works";

