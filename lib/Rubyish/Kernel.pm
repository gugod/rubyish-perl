package Rubyish::Kernel;

use Sub::Exporter;
Sub::Exporter::setup_exporter({
    exports => [qw(Array String Hash)],
    groups  => { default => [qw(Array String Hash)] },
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

1;
