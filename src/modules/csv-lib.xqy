(:
Copyright 2012-2015 MarkLogic Corporation

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
:)
xquery version "1.0-ml";

module namespace csv = "http://marklogic.com/roxy/csv";

(: CAN FILL THIS ALL IN FROM VIDEO :)
(: Convert a line of CSV text to XML based on the template :)
declare function csv:convert(
  $line as xs:string,
  $tmpl as element()
  )
{
  csv:build-element(
    $tmpl,
	csv:build-map($line)
  )  
};

(: Build a map based on the values in the CVS line :)
declare function csv:build-map(
  $line as xs:string
  )
{
  let $field-map := map:map()
  let $populate := (
    for $field at $i in csv:break($line)
	return map:put($field-map, xs:string($i), fn:normalize-space($field))
  )
  return $field-map  
};

(: Use template and map of the values to build XML structure :)
declare function csv:build-element(
  $template,
  $map
  )
{
  let $element := 
    if (fn:exists($template/@src)) then
      let $value := map:get($map, $template/@src)
      return
         if ($value) then
			element { fn:node-name($template)} {
			  $value
			}
		 else ()
	else
      let $children := 
		for $element in $template/element()
		return csv:build-element($element, $map)
	  return
		if ($children) then
		  element { fn:node-name($template)} {
			  $children
			}
		 else ()
   return
     $element		 
};

(: Given a CSV line, break it into fields :)
declare function csv:break($str)
{
   if ($str) then
     if (fn:starts-with($str,'"')) then
       let $after-quote := fn:substring($str,2)
       return (
	     fn:substring-before($after-quote, '"'),
		 csv:break(fn:substring-after($after-quote, '",'))
	   )
     else if (fn:matches($str, ",")) then (
	   fn:substring-before($str, ','),
	   csv:break(fn:substring-after($str, ','))
	 )
     else
       $str
   else()	 
};








