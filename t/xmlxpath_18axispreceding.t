use FindBin qw($Bin); BEGIN { unshift @INC, $Bin; } use xmlxpath_tools;

use Test;
plan( tests => 4);
 

use XML::Twig::XPath;
ok(1);

my $t= XML::Twig::XPath->new->parse( \*DATA);

ok( $t);

my @nodes;
@nodes = $t->findnodes( '/AAA/XXX/preceding::*');
ok(@nodes, 4);

@nodes = $t->findnodes( '//GGG/preceding::*');
ok(@nodes, 8);

exit 0;

__DATA__
<AAA>
    <BBB>
        <CCC/>
        <ZZZ>
            <DDD/>
        </ZZZ>
    </BBB>
    <XXX>
        <DDD>
            <EEE/>
            <DDD/>
            <CCC/>
            <FFF/>
            <FFF>
                <GGG/>
            </FFF>
        </DDD>
    </XXX>
    <CCC>
        <DDD/>
    </CCC>
</AAA>
