xquery version "1.0-ml";

module namespace ref = "http://marklogic.com/rest-api/resource/fee";

declare namespace roxy = "http://marklogic.com/roxy";
declare namespace rapi = "http://marklogic.com/rest-api";

(:
 : To add parameters to the functions, specify them in the params annotations.
 : Example
 :   declare %roxy:params("uri=xs:string", "priority=xs:int") ref:get(...)
 : This means that the get function will take two parameters, a string and an int.
 :
 : To report errors in your extension, use fn:error(). For details, see
 : http://docs.marklogic.com/guide/rest-dev/extensions#id_33892, but here's
 : an example from the docs:
 : fn:error(
 :   (),
 :   "RESTAPI-SRVEXERR",
 :   ("415","Raven","nevermore"))
 :)

(:
 :)
declare 
%roxy:params("")
function ref:get(
  $context as map:map,
  $params  as map:map
) as document-node()*
{
   ref:post($context, $params, ())
(:
  map:put($context, "output-types", "application/xml"),
  map:put($context, "output-status", (200, "OK")),
  document { "GET called on the ext service extension" }
:)
};

(:
 :)
declare 
%roxy:params("")
function ref:put(
    $context as map:map,
    $params  as map:map,
    $input   as document-node()*
) as document-node()?
{
  map:put($context, "output-types", "application/xml"),
  map:put($context, "output-status", (201, "Created")),
  document { "PUT called on the ext service extension" }
};

declare 
%roxy:params("quest=xs:string", "favorite-color=xs:string")
function ref:post(
    $context as map:map,
    $params  as map:map,
    $input   as document-node()*
) as document-node()*
{
  map:put($context, "output-types", "text/html"),
  map:put($context, "output-status", (201, "Created")),
  document { 
    <div>
	  <div>
	    <label>Quest</label>
		<span>{map:get($params, "quest")}</span>
	  </div>
      <div>
	    <label>Favorite Color</label>
		<span>{map:get($params, "favorite-color")}</span>
	  </div>
	</div>
   }
};



(:
 :)
declare 
%roxy:params("")
function ref:delete(
    $context as map:map,
    $params  as map:map
) as document-node()?
{
  map:put($context, "output-types", "application/xml"),
  map:put($context, "output-status", (200, "OK")),
  document { "DELETE called on the ext service extension" }
};
