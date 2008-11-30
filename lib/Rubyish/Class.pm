use strict;

package Rubyish::Class;
use Rubyish::Attribute ();

sub new {
    return bless {}, shift;
}

use YAML;
sub to_yaml {
    return YAML::Dump(@_);
}

sub _export_class_methods {
    my ($package) = @_;

    no strict;
    *{$package . "::attr_accessor"} = *{Rubyish::Attribute::attr_accessor};
    *{$package . "::attr_writer"} = *{Rubyish::Attribute::attr_writer};
    *{$package . "::attr_reader"} = *{Rubyish::Attribute::attr_reader};
}

1;

