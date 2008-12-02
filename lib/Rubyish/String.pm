=head1 NAME

Rubyish::String - String object acts as ruby

=cut

package Rubyish::String;

use base Rubyish::Object;

=head2 new($scalar) #=> string object

constructor
    
    $string = Rubyish::String->new;             #=> bless( do{\(my $o = '')}, 'Rubyish::String' )
    $string = Rubyish::String->new("hello");    #=> bless( do{\(my $o = 'hello')}, 'Rubyish::String' )

=cut

sub new {
    my $self = $_[1] ? \$_[1] : do{\(my $o = '')};
    bless $self, shift;
}

=head2 replace($scalar) #=> $instance

replace content
    
    $string = Rubyish::String->new("hello");    #=> bless( do{\(my $o = 'hello')}, 'Rubyish::String' )
    $string->replace("world")                   #=> bless( do{\(my $o = 'world')}, 'Rubyish::String' )

=cut

sub replace {
    my ($self, $arg) = @_;
    $$self = $arg;
    $self;
}

sub inspect { ${$_[0]} }

1;
