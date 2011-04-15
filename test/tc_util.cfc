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
</cfcomponent>