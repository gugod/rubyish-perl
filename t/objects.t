#!/usr/bin/env perl
use strict;
use lib 't/lib';
use Test::More;
use Cat;

plan tests => 8;

{
    # Object is Class. Class is Object.
    is(Rubyish::Object->class, "Rubyish::Class");
    is(Rubyish::Module->class, "Rubyish::Class");
    is(Rubyish::Class->class, "Rubyish::Class");

    is(Rubyish::Object->superclass, undef);
    is(Rubyish::Module->superclass, "Rubyish::Object");
    is(Rubyish::Class->superclass, "Rubyish::Module");
}


{
    my $pet = Cat->new;
    $pet->__send__(name => "oreo");

    is $pet->name, "oreo", "__send__ method works";

    $pet->send(weight => "5kg");

    is $pet->weight, "5kg", "send method also works";
}

