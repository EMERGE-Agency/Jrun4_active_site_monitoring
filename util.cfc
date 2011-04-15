<cffunction name="linesToArray" access="public">
	<cfargument name="source" type="string" />
	<cfreturn ListToArray(source, "#chr(13)##chr(10)#") />
</cffunction>

<cffunction name="removeTopArrayElements" access="public">
	<cfargument name="source" type="array" />
	<cfargument name="lines_to_remove" type="numeric" />
	<cfif lines_to_remove ge ArrayLen(source)>
		<cfset lines_to_remove = ArrayLen(source)/>
	</cfif>
	<cfloop index = "LoopCount" from="1" to="#lines_to_remove#">
		<cfset ArrayDeleteAt(source, 1) >
	</cfloop>
	<cfreturn source />
</cffunction>	