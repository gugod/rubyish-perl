package Rubyish::NilClass;
use strict;
use warnings;

use base qw(Rubyish::Object);
use Rubyish::Kernel;
use Rubyish::Syntax::def;

use overload
    'bool' => sub { },
#     '+0' => sub { 0 },
#     '""' => sub { '' };

def inspect { "nil" };
def nil { 1 };
def to_a { Array };
def to_f { 0.0 };
def to_i { 0 };
def to_s { String("") };


# cheat
def object_id { 4 };
{ no strict; *__id__ = *object_id; }

{
    my $obj = bless {}, __PACKAGE__;
    sub new {
        return $obj if defined $obj;
        $obj = bless {}, __PACKAGE__;
        return $obj;
    }
}

1;

