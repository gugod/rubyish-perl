use strict;

package Rubyish::Object;

sub new {
    return bless {}, shift;
}

sub superclass {
    my ($self) = @_;
    my $class = ref($self) || $self;
    no strict;
    return ${"${class}::ISA"}[-1];
}

sub class {
    my ($self) = @_;
    return ref($self) || "Rubyish::Class";
}

sub __send__ {
    my ($self, $name, @args) = @_;
    if (my $sub = $self->can($name)) {
        $sub->($self, @args);
    }
}

{
    no strict;
    *{send} = *{__send__};
}

use YAML;
sub to_yaml {
    return YAML::Dump(@_);
}

1;
