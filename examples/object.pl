#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;
use Rubyish::Kernel;

$obj = Rubyish::Object->new;

puts $obj->object_id;

$methods = $obj->methods;

puts $obj->methods;


