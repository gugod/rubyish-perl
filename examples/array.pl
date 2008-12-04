#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;

my $array = Rubyish::Array->new([1, 2, 3, 4, 5]);

print $array->inspect , "\n";

my $new_array = Array([1, 2, 3, 4, 5]);

print $new_array->inspect , "\n";

puts $new_array->size;


print $new_array->at(0), "\n";

puts $new_array->each( sub {$_+1} );
puts $new_array->map( sub {$_+1} );

