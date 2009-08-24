package Rubyish::Syntax::MethodCallWithBlock;
use strict;
use warnings;
use 5.010;

use B::Hooks::Parser;
use B::Hooks::EndOfScope;
use B::Generate;

sub inject_close_paren {
    my $linestr = B::Hooks::Parser::get_linestr;
    my $offset = B::Hooks::Parser::get_linestr_offset;
    substr($linestr, $offset, 0) = ');';
    B::Hooks::Parser::set_linestr($linestr);
}

sub block_checker {
    my ($op) = shift;
    my $linestr = B::Hooks::Parser::get_linestr;
    my $offset = B::Hooks::Parser::get_linestr_offset;
    my $code = substr($linestr, $offset);
    return unless $code ~~ /^->(?<method_name>\w+)(\((?<method_args>.*)\))?\s+{/;
    $code = "->$+{method_name}($+{method_args}, sub { BEGIN { B::Hooks::EndOfScope::on_scope_end(\\&Rubyish::Syntax::MethodCallWithBlock::inject_close_paren); } ";
    substr($linestr, $offset) = $code;
    B::Hooks::Parser::set_linestr($linestr);
}

sub import {
    my ($class) = @_;
    my $caller = caller;
    B::Hooks::Parser::setup();
    my $linestr = B::Hooks::Parser::get_linestr();
    my $offset  = B::Hooks::Parser::get_linestr_offset();
    substr($linestr, $offset, 0) = 'use B::Hooks::EndOfScope(); use B::OPCheck const => check => \&Rubyish::Syntax::MethodCallWithBlock::block_checker;';
    B::Hooks::Parser::set_linestr($linestr);
}

1;
