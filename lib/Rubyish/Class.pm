use strict;

package Rubyish::Class;
use Rubyish::Attribute ();

sub new {
    return bless {}, shift;
}

sub _export_class_methods {
    my ($package) = @_;
    no strict;
    *{$package . "::attr_accessor"} = *{Rubyish::Attribute::attr_accessor};
    *{$package . "::attr_writer"} = *{Rubyish::Attribute::attr_writer};
    *{$package . "::attr_reader"} = *{Rubyish::Attribute::attr_reader};
}

# Class
sub superclass {
    my ($self) = @_;
    no strict;
    return ${ref($self) . "::ISA"}[-1];
}

# Object
sub class {
    my ($self) = @_;
    return ref($self);
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

