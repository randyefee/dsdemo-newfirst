import module namespace test="http://marklogic.com/roxy/test-helper" at "/test/test-helper.xqy";

declare function local:case1()
{
  test:assert-equal(<a class="1"/>, <g class="2"/>)
};

declare function local:case2()
{
  test:assert-equal((<a/>, <b/>, <c/>), (<a/>, <b/>))
};

declare function local:case3()
{
  test:assert-equal((<a/>, <b/>), (<a/>, <b/>, <c/>))
};

declare function local:case4()
{
  test:assert-equal((<a/>, <b/>, <c/>), (<a/>, <c/>, <b/>))
};

declare function local:case5()
{
  test:assert-equal((<a><aa/></a>, <b/>, <c/>), (element a { element aaa { } }, element b {}, element c {}))
};

test:assert-equal(5, 5),

test:assert-equal("a", "a")