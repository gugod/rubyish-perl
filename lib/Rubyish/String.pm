=head1 NAME

Rubyish::String - String object acts as ruby

=cut

package Rubyish::String;

use base 'Rubyish::Object';
use Rubyish::Syntax::def;

=head2 new($scalar) #=> string object

constructor
    
    $string = Rubyish::String->new;             #=> bless( do{\(my $o = '')}, 'Rubyish::String' )
    $string = Rubyish::String->new("hello");    #=> bless( do{\(my $o = 'hello')}, 'Rubyish::String' )
    $string = String("hello");                  # do the same

=cut

sub new {
    my ($class, $str) = @_;
    my $self = defined($str) ? \"$str" : \"";
    # my $self = defined($_[1]) ? \$_[1] : do{\(my $o = '')};
    bless $self, $class;
}

=head2 replace($scalar) #=> $instance

replace content
    
    $string = Rubyish::String->new("hello");    #=> bless( do{\(my $o = 'hello')}, 'Rubyish::String' )
    $string->replace("world")                   #=> bless( do{\(my $o = 'world')}, 'Rubyish::String' )

=cut

def replace($arg) {
    $$self = $arg;
    $self;
};

=head2 inspect

Not Documented

=cut

def inspect { ${$self} };

=head2 gsub($pattern, $replacement) #=> new_str

    $string = String("hello")
    $string->gsub(qr/ello/, "i")    #=> hi

=cut

def gsub($pattern, $replacement) {
    my $str = "$$self";
    $str =~ s/$pattern/$replacement/g;
    return $str;
};

1;
