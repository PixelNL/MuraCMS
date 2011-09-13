<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes
the preparation of a derivative work based on Mura CMS. Thus, the terms and 	
conditions of the GNU General Public License version 2 (GPL) cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission
to combine Mura CMS with programs or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission
to combine Mura CMS with independent software modules that communicate with Mura CMS solely
through modules packaged as Mura CMS plugins and deployed through the Mura CMS plugin installation API,
provided that these modules (a) may only modify the /plugins/ directory through the Mura CMS
plugin installation API, (b) must not alter any default objects in the Mura CMS database
and (c) must not alter any files in the following directories except in cases where the code contains
a separately distributed license.

/admin/
/tasks/
/config/
/requirements/mura/

You may copy and distribute such a combined work under the terms of GPL for Mura CMS, provided that you include
the source code of that other code when and as the GNU GPL requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception
for your modified version; it is your choice whether to do so, or to make such modified version available under
the GNU General Public License version 2 without this exception. You may, if you choose, apply this exception
to your own modified versions of Mura CMS.
--->

<cfparam name="request.#attributes.parentlabels#" default="">
<cfparam name="request.#attributes.parentlist#" default="">
<cfparam name="attributes.parentlabels" default="">
<cfparam name="attributes.parentlist" default="">
<cfparam name="attributes.moduleid" default="">
<cfparam name="attributes.sortDirection" default="asc">
<cfparam name="attributes.sortBy" default="orderno">
<cfparam name="attributes.contentid" default="">

<cfset rsNest=application.contentManager.getNest('#attributes.parentid#','#attributes.siteid#','#attributes.sortBy#','#attributes.sortDirection#')>
<cfoutput query="rsNest">
<cfif attributes.contentid neq rsnest.contentid>
	<cfset variables.title=replace(rsNest.menutitle,",","","ALL")>
	<cfif (rsnest.type eq 'Page' or rsnest.type eq 'Portal' or rsnest.type eq 'Calendar')>
	<cfset "request.#attributes.parentlist#"=listappend(evaluate("request.#attributes.parentlist#"),"#rsnest.contentid#")>
	<cfsavecontent variable="templabel"><cfif attributes.nestlevel><cfloop  from="1" to="#attributes.NestLevel#" index="I">&nbsp;&nbsp;</cfloop></cfif>#variables.title#</cfsavecontent>
	<cfset "request.#attributes.parentlabels#"=listappend(evaluate("request.#attributes.parentlabels#"),templabel)>
	</cfif><cfif rsNest.hasKids>
	 <cf_siteParentsGenerate parentid="#rsnest.contentid#" 
	  nestlevel="#evaluate(attributes.nestlevel + 1)#" 
	  siteid="#attributes.siteid#"
	  moduleid="#attributes.moduleid#"
	  parentlabels="#attributes.parentlabels#"
	  parentlist="#attributes.parentlist#"
	  sortBy="#rsNest.sortBy#"
	  sortDirection="#rsNest.sortDirection#"
	  contentid="#attributes.contentid#"></cfif>
	  </cfif>
  </cfoutput>
