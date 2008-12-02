#!/usr/bin/env perl

use strict;
use Rubyish;

use Test::More;

plan tests => 1;

{
    my $s = String("fnord");
    my $t = $s->gsub(qr/nor/, "oo");

    is $t, "food";
}
