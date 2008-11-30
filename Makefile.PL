use inc::Module::Install;

name 'Rubyish-Perl';
all_from 'lib/Rubyish.pm';
abstract 'Perl programming, the rubyish way.';

requires
    'Devel::Declare' => '0.003003',
    'Rubyish::Attribute' => '1.0',
    'YAML' => 0;

WriteAll;

