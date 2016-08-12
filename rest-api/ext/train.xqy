xquery version "1.0-ml";

module namespace ds = "http://marklogic.com/rest-api/resource/train";

declare namespace roxy = "http://marklogic.com/roxy";
declare namespace rapi = "http://marklogic.com/rest-api";

(:
 : To add parameters to the functions, specify them in the params annotations.
 : Example
 :   declare %roxy:params("uri=xs:string", "priority=xs:int") ds:get(...)
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
function ds:get(
  $context as map:map,
  $params  as map:map
) as document-node()*
{
   ds:post($context, $params, ())
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
function ds:put(
    $context as map:map,
    $params  as map:map,
    $input   as document-node()*
) as document-node()?
{
  map:put($context, "output-types", "application/xml"),
  map:put($context, "output-status", (201, "Created")),
  document { "PUT called on the ext service extension" }
};

(:
 :)
declare 
%roxy:params("")
%rapi:transaction-mode("update")
function ds:post(
    $context as map:map,
    $params  as map:map,
    $input   as document-node()*
) as document-node()*
{
  map:put($context, "output-types", "application/xml"),
  map:put($context, "output-status", (201, "Created")),
  document { "POST called on the ext service extension" }
};

(:
 :)
declare 
%roxy:params("")
function ds:delete(
    $context as map:map,
    $params  as map:map
) as document-node()?
{
  map:put($context, "output-types", "application/xml"),
  map:put($context, "output-status", (200, "OK")),
  document { "DELETE called on the ext service extension" }
};
