<cfcomponent extends="mxunit.framework.TestCase">
	<cffunction name="setUp" returntype="void" access="public">
		<cfset obj = createObject("component", "iis") />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
		
	</cffunction>
</cfcomponent>