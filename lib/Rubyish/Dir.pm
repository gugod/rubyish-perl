=head1 NAME

Rubyish::Dir - Dir (class)

=cut

package Rubyish::Dir;
use strict;
use 5.010;

use base "Rubyish::Object";
use Rubyish::Syntax::def;

sub new {
  my ($class, $dirname) = @_;
  return \$dirname, $class;
}


sub pwd {
  my ($class) = @_;
  if ($class eq __PACKAGE__) {
    use Cwd;
    cwd();
  } elsif (ref($class)) {
    warn "undefine method \'pwd\' for __PACKAGE__ instance";
  }
};

1;
