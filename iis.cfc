<cffunction name="process" access="public" returntype="struct">
	<cfreturn loadIISEntriesFromCommandLine() />
</cffunction>

<cffunction name="loadIISEntriesFromCommandLine" access="private" returntype="string">
	<cfexecute name="c:\windows\system32\cscript.exe" arguments="c:\windows\system32\iisweb.vbs /query" variable="data" timeout="100" />
	<cfreturn data />
</cffunction>
