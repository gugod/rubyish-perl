use strict;
package Rubyish::Autobox;

use base 'autobox';

sub import {
    (shift)->SUPER::import(
        ARRAY  => 'Rubyish::Array',
        HASH   => 'Rubyish::Hash',
        STRING => 'Rubyish::String'
    );
}

1;
