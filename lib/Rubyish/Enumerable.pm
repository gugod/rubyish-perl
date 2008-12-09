package Rubyish::Enumerable;
use strict;

use base qw(Rubyish::Module);
use Rubyish::Syntax::def;

use Sub::Exporter -setup => {
    exports => [qw(all any)],
    groups  => { default => [qw(all any)] }
};

def each {
    die "Method each need to implemented by the includer Class";
}

def all($cb) {
    my $all_true = 1;
    $cb = sub { $_[0] } unless $cb;
    $self->each(
        sub {
            my ($i) = @_;
            $all_true = 0 if !$cb->($i);
        }
    );
    return $all_true;
};

def any($cb) {
    my $any_true = 0;
    $cb = sub { $_[0] } unless $cb;

    $self->each(
        sub {
            my ($i) = @_;
            $any_true = 1 if $cb->($i);
        }
    );
    return $any_true;
};

use Rubyish::Array;
def to_a {
    my @arr;
    $self->each(sub { push @arr, $_[0] });
    return Rubyish::Array->new(\@arr);
};

1;

