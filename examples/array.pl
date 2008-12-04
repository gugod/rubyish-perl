#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;
use Rubyish::Kernel;

my $array = Rubyish::Array->new([1, 2, 3, 4, 5]);

print $array->inspect , "\n";

my $new_array = Array([1, 2, 3, 4, 5]);

print $new_array->inspect , "\n";

print $new_array->size, "\n";
puts $new_array->length;


print $new_array->at(0), "\n";

puts $new_array->each( sub {$_+1} );

