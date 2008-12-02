package Rubyish::Kernel;

use Sub::Exporter;
Sub::Exporter::setup_exporter({
    exports => [qw(Array String Hash puts)],
    groups  => { default => [qw(Array String Hash puts)] },
});

sub String {
    Rubyish::String->new($_[0]);
}

sub Array {
    Rubyish::Array->new($_[0]);
}

sub Hash {
    Rubyish::Hash->new($_[0]);
}

sub puts {
    print map { ref($_) =~ /Rubyish/ ? $_->inspect : $_ } @_;
    print "\n";
}

1;
