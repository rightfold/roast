use v6;

use Test;
use experimental :macros;

#L<S06/"Macros">

plan 2;

#RT #115506
lives-ok
    { EVAL 'macro pathological { AST.new }; pathological();' },
    "macro returning AST.new doesn't blow up";

#RT #115504
{
    try EVAL 'macro ma { die 1 }; ma';
    is $!, 1, "die-ing inside a macro dies normally.";
}

# vim: ft=perl6
