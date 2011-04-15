<cfcomponent extends="mxunit.framework.TestCase">
	<cffunction name="setUp" returntype="void" access="public">
		<cfset obj = createObject("component", "iis") />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
		<cfset obj = "" />
	</cffunction>
	
	<cffunction name="beforeTests" access="public" returntype="void"></cffunction>
	<cffunction name="afterTests" access="public" returntype="void"></cffunction>

	</cffunction>
</cfcomponent>