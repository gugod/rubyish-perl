#!/usr/bin/env perl -w
use strict;
use Test::More;
use UNIVERSAL::can;
use Rubyish::Syntax::self;

sub new { bless {}, shift }
sub get_self { self }
sub has_fnord { exists self->{fnord} }

is(__PACKAGE__, self, "self == __PACKAGE__ in the package body.");

my $o = main->new;

is($o, $o->get_self, "self == \$object in the subroutine body.");

ok( !$o->has_fnord );

$o->{fnord} = 1;
ok( $o->has_fnord );

done_testing;
