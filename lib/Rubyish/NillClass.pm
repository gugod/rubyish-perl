package Rubyish::NillClass;
use strict;

use base qw(Rubyish::Object);
use Rubyish::Kernel;
use Rubyish::Syntax::def;

{
    my $obj;
    sub new {
        return $obj if $obj;
        $obj = bless {}, __PACKAGE__;
        return $obj;
    }
}

def inspect { "nil" };
def nil { 1 };
def to_a { Array[] };
def to_f { 0.0 };
def to_i { 0 };
def to_s { String("") };

1;

