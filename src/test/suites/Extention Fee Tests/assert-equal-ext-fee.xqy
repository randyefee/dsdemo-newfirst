xquery version "1.0-ml";

import module namespace test="http://marklogic.com/roxy/test-helper" at "/test/test-helper.xqy";

import module namespace ref="http://marklogic.com/rest-api/resource/fee" at "/modules/fee-lib.xqy";

let $response :=
(
let $context := map:map()
let $params := map:map()
let $_ := map:put($params, "quest", " Game of Thrones")
let $_ := map:put($params, "favorite-color", " blood red")
return
ref:post( $context, $params, () )
)

let $target := document{<div><div><label>Quest</label><span> Game of Thrones</span></div><div><label>Favorite Color</label><span> blood red</span></div></div>}
return 
(
    test:assert-equal($target,$response) 
)