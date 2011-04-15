<cffunction name="getEntries" access="public" returntype="struct">
	<cfset result = loadIISEntriesFromCommandLine() />

	<cfset args= {source=result} />
	<cfset result = invoke_util("linesToArray", args) />
	
	<cfset args= {source=result, lines_to_remove=5} />
	<cfset result = invoke_util("removeTopArrayElements", args) />
	
	<cfreturn parseArray(result) />
</cffunction>

<cffunction name="invoke_util" access="private" returntype="any">
	<cfargument name="method_name" />
	<cfargument name="args_collection" />
	<cfinvoke component="util" method="#method_name#" argumentCollection="#args_collection#" returnVariable="result" />
	<cfreturn result />
</cffunction>

<cffunction name="loadIISEntriesFromCommandLine" access="private" returntype="string">
	<cfexecute name="c:\windows\system32\cscript.exe" arguments="c:\windows\system32\iisweb.vbs /query" variable="data" timeout="100" />
	<cfreturn data />
</cffunction>

<cffunction name="parseArray" access="private">
	<cfargument name="data_array" />

	<cfset site_struct = StructNew() />
	
	<cfset strRegEx = ("(.*)\s+\(W3SVC\/(\d+)\)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)") />
	<cfset objPattern = CreateObject( "java", "java.util.regex.Pattern" ).Compile( JavaCast( "string", strRegEx )) />	
	<cfloop index="data" array="#data_array#">
		<cfset objMatcher = objPattern.Matcher( JavaCast( "string", data )) />
		<cfset objMatcher.find() />
		<cftry>
			<cfset arr = ArrayNew(1) />
			<!--- Site Name --->
			<cfset ArrayAppend(arr ,objMatcher.Group( JavaCast( "string", 1 ))) />
			
			<!--- Status --->
			<cfset ArrayAppend(arr ,objMatcher.Group( JavaCast( "string", 3 ))) />
			
			<!--- IP Address --->
			<cfset ArrayAppend(arr ,objMatcher.Group( JavaCast( "string", 4 ))) />
			
			<!--- Metabase key --->
			<cfset metabase_key = objMatcher.Group( JavaCast( "int", 2 ) ) />
			<cfset StructInsert(site_struct, metabase_key, arr) />
			<cfcatch></cfcatch>
		</cftry>
	</cfloop>
	<cfreturn site_struct />
</cffunction>