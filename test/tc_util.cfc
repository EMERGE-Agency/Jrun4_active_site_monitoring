<cfcomponent extends="mxunit.framework.TestCase">
	<cffunction name="setUp" returntype="void" access="public">
		<cfset obj = createObject("component", "util") />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
		<cfset obj = "" />
	</cffunction>
	
	<cffunction name="beforeTests" access="public" returntype="void"></cffunction>
	<cffunction name="afterTests" access="public" returntype="void"></cffunction>
	
	<cffunction name="loadSampleData" access="private">
		<cffile action="read" file="#ExpandPath('.')#\sample_iisweb_output.txt" variable="result" />
		<cfreturn result />
	</cffunction>
	
	<cffunction name="lines_to_array_should_return_array_given_text" returntype="void" access="public">
		<cfset assertIsArray(obj.linesToArray(loadSampleData)) />
	</cffunction>
	
	<!--- To cover the case when the number of elements to delete is greater then the total in the array. --->
	<cffunction name="remove_top_array_elements_should_remove_as_many_rows_as_possible" returntype="void" access="public">
		<cfset data=[1 , 2, 3 ] />
		<cfset result = obj.removeTopArrayElements(data, 5) />
		<cfset assertIsEmptyArray(result) />
	</cffunction>
	
	<cffunction name="remove_top_array_elements_should_remove_top_x_rows_from_array" returntype="void" access="public">
		<cfset data= [1 , 2, 3, 4, 5, 6] />
		<cfset before_count = ArrayLen(data) />
		<cfset after_count = ArrayLen(obj.removeTopArrayElements(data, 4)) />
		<cfset assertEquals(after_count, (before_count-4)) />
	</cffunction>
</cfcomponent>