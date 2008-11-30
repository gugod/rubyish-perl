use inc::Module::Install;

name 'Rubyish-Perl';
all_from 'lib/Rubyish.pm';

requires
    'Devel::Declare' => '0.003003',
    'Rubyish::Attribute' => 0;

no_index 'directory' => 'examples';

WriteAll;

