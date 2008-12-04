#!/usr/bin/env perl

use lib qw(lib examples/lib);
use Rubyish;

my $hash = Rubyish::Hash->new({ "hello" => "world" });

print $hash->inspect, "\n";

print $hash->fetch("hello"), "\n";

$hash->each(sub{ my ($k,$v) = @_; ($k,$v) = ($v,$k); });

