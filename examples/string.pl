#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;
use Data::Dumper;

$string = String("hello");

puts $string->methods;

puts $string;

$string->replace("world");

puts $string;

