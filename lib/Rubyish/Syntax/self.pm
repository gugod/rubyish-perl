package Rubyish::Syntax::self;

sub _uplevel_args {
    my $level = 2;
    my @c = ();
    package DB;
    @c = caller($level++)
        while !defined($c[3]) || $c[3] eq '(eval)';
    return @DB::args;
}

sub import {
    my $package = caller;
    *{$package.'::self'} = \&package;
    *{$package.'::self'} = sub {
        return (caller(1))[3] ? (_uplevel_args)[0] : $package;
    };
}

1;
