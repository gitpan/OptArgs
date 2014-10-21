use strict;
use warnings;
use Test::More;
use Test::Fatal;
use OptArgs ':all';

arg subcmd => (
    isa      => 'SubCmd',
    comment  => 'first',
    fallback => {
        name => 'other',
        comment => 'comment',
    },
);

@ARGV = (qw//);
is_deeply optargs, {}, 'no argument';

@ARGV = (qw/unknown/);
is_deeply optargs, { subcmd => 'unknown' }, 'arg fell through';

done_testing;
