#!/usr/bin/env perl -w
use strict;
use Test::More;

use Rubyish::Syntax::MethodCallWithBlock;

sub Foo::bar {
    my ($self, $arg, $block) = @_;
    $block->($arg);
}

Foo->bar(42) {
    pass "Foo->bar(): block is called";
}
pass "    no syntax error";

my $foo = bless {}, "Foo";

$foo->bar(42) {
    pass '$foo->bar(): block is called';
}
pass "    no syntax error";

done_testing;
