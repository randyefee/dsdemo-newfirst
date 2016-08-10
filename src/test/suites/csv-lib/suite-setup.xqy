xquery version "1.0-ml";

import module namespace test="http://marklogic.com/roxy/test-helper" at "/test/test-helper.xqy";

test:load-test-file("team.xml", xdmp:database(), "/team.xml"),
test:load-test-file("team.txt", xdmp:database(), "/team.txt")