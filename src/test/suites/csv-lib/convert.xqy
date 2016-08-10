xquery version "1.0-ml";

import module namespace test="http://marklogic.com/roxy/test-helper" at "/test/test-helper.xqy";

import module namespace csv = "http://marklogic.com/roxy/csv" at "/modules/csv-lib.xqy";

let $actual := csv:convert(fn:doc("/team.txt")/fn:string(), fn:doc("/team.xml")/node())
return (
      test:assert-equal(<place>Philadelphia</place>, $actual/place)
)