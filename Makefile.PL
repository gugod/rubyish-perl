use inc::Module::Install;

name 'Rubyish-Perl';
all_from 'lib/Rubyish.pm';
abstract 'Perl programming, the rubyish way.';

requires
    'UNIVERSAL::isa' => 0,
    'Devel::Declare' => '0.003003',
    'Rubyish::Attribute' => '1.0',
    'YAML' => 0,
    'Data::Dumper' => 0,
    'Class::Inspector' => 0,
    'Sub::Exporter' => 0;
    'UNIVERSAL::isa' => 0;

WriteAll;

