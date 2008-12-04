#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;
use Rubyish::Autobox;

$string = String("string");

puts $string->methods;


