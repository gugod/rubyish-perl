package Rubyish::Syntax::class;
use Devel::Declare;

sub import {
    my ($class) = @_;
    my $caller = caller;

    {
        no strict;
        *{"${caller}::class"} = sub { $_[0]->(); };
    }

    eval "package $caller; use Devel::Declare;";

    Devel::Declare->setup_for(
        $caller => {
            'class' => [
                DECLARE_PACKAGE,
                sub {
                    my ($usepack, $use, $inpack, $name, $proto, $is_block) = @_;
                    return (sub (&) { shift; }, undef, "package ${name}; use Rubyish;");
                }
            ]
        }
    );
};

1;

