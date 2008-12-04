#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;
use Rubyish::Kernel;

$obj = Rubyish::Object->new;

$methods = $obj->methods;

puts $obj->methods;


