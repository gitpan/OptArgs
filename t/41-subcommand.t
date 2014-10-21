use strict;
use warnings;
use Test::More;
use Test::Output;
use Test::Fatal;
use lib 't/lib';
use OptArgs qw/dispatch/;

is exception { dispatch(qw/run app::multi/) }, 'usage: 41-subcommand.t COMMAND

    COMMAND            (required) valid values include:
        init           do the y thing
        new            do the z thing

    --dry-run, -n      do nothing
    --verbose, -v      do it loudly

', 'no arguments';

stdout_is(
    sub { dispatch(qw/run app::multi init/) },
    'you are in init, thanks
', 'init'
);

is exception { dispatch(qw/run app::multi init -q/) },
  'unexpected option or argument: -q

usage: 41-subcommand.t init 

    --dry-run, -n      do nothing
    --verbose, -v      do it loudly
    --opty             do nothing

', 'unexpected option';

done_testing();
