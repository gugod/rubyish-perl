package Cat;
use Rubyish;

attr_accessor([ "name" ]);

def meow {
    print "meow, meow, meow\n";
};

def play {
    for my $stuff(@args) {
        print "I CAN HAS " . uc($stuff) . "\n";
        push @{ $self->{played} ||=[] }, $stuff;
    }
};


1;
