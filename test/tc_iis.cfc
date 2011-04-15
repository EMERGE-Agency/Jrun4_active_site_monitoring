<cfcomponent extends="mxunit.framework.TestCase">
	<cffunction name="setUp" returntype="void" access="public">
		<cfset obj = createObject("component", "iis") />
	</cffunction>
	
	<cffunction name="tearDown" access="public" returntype="void">
		<cfset obj = "" />
	</cffunction>
	
	<cffunction name="beforeTests" access="public" returntype="void"></cffunction>
	<cffunction name="afterTests" access="public" returntype="void"></cffunction>

	<cffunction name="process_should_return_a_struct_with_array_values" access="public">
		<cfset result = obj.process() />
		<cfset assertIsStruct(result, "The returned value was not a struct.") />
		<cfloop collection="#result#" item="record" >
			<cfset assertIsArray(record,"The inner element was not an array.") />
		</cfloop>
	</cffunction>
	</cffunction>
</cfcomponent>