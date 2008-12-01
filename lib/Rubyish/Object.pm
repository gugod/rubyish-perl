use strict;

=head1 NAME

Rubyish::Object - the parent class of all classes in Rubyish

=cut

package Rubyish::Object;
use UNIVERSAL::isa;
use Data::Dumper;

=head1 FUNCTIONS

=head2 new()

Not documented

=cut

sub new {
    return bless {}, shift;
}

# overwrite the same method in Class
sub superclass {
    my ($self) = @_;
    my $class = ref($self) || $self;
    no strict;
    return ${"${class}::ISA"}[-1];
}

# overwrite the same method in Class
sub class {
    my ($self) = @_;
    return ref($self) || "Rubyish::Class";
}

sub is_a {
    my ($self, $class) = @_;
    if (ref($self)) {
        return 1 if $self->class eq $class;
        return ref($self)->isa($class);
    }

    return $self->isa($class);
}

sub kind_of { is_a(@_) } # alias of is_a

=head2 __send__

Invokes method by string
    
    package Animal;
    use base Rubyish::Object;
    
    def hello {
        my ($self, $arg) = @_;
        "hello, $arg.";
    }

    1;

    my $dog = Animal->new;
    print $dog->__send__("hello", "perl"); #=> "hello, perl."

=cut

sub __send__ {
    my ($self, $name, @args) = @_;
    if (my $sub = $self->can($name)) {
        $sub->($self, @args);
    }
}

{
    no strict;
    *send = *__send__;
}

=head2 to_yaml()

Not Documented

=cut

use YAML;
sub to_yaml {
    return YAML::Dump(@_);
}

=head2

Return a list of names of methods

=cut

use Class::Inspector;
sub methods {
    my $result = "[";
    for (@{ Class::Inspector->methods(ref($_[0]), "public") }) {
        $result .= '"' . $_ . '", ' unless $_ ~~ qw(def); # use @Rubyish::SPECIAL_WORD later
    }
    $result =~ s/, $//;
    $result .= "]";

    # use primitive datatype temporarily
    # migrate to Rubyish::String when it is done
}


1;
