package Cat;
use Rubyish;
use base 'Animal';

def sound {
    "meow, meow";
};

def speak {
    print "A cat goes " . $self->sound . "\n";
};

1;
