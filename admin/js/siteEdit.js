/* This file is part of Mura CMS. 

	Mura CMS is free software: you can redistribute it and/or modify 
	it under the terms of the GNU General Public License as published by 
	the Free Software Foundation, Version 2 of the License. 

	Mura CMS is distributed in the hope that it will be useful, 
	but WITHOUT ANY WARRANTY; without even the implied warranty of 
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
	GNU General Public License for more details. 

	You should have received a copy of the GNU General Public License 
	along with Mura CMS.  If not, see <http://www.gnu.org/licenses/>. 

	However, as a special exception, the copyright holders of Mura CMS grant you permission 
	to combine Mura CMS with programs or libraries that are released under the GNU Lesser General Public License version 2.1. 

	In addition, as a special exception,  the copyright holders of Mura CMS grant you permission 
	to combine Mura CMS  with independent software modules that communicate with Mura CMS solely 
	through modules packaged as Mura CMS plugins and deployed through the Mura CMS plugin installation API, 
	provided that these modules (a) may only modify the  /plugins/ directory through the Mura CMS 
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
	the GNU General Public License version 2  without this exception.  You may, if you choose, apply this exception 
	to your own modified versions of Mura CMS. */

function showEditForm(theUrl) {
	
	createDialogBox();
	
	var iframe = document.getElementById('editFormIframe');
	iframe.style.width = '100%';
	iframe.style.height = '100%';
	iframe.style.border = '0';
	iframe.src = theUrl;
	iframe.style.display = '';
	
	var div = document.getElementById('editForm');
	//new Draggable('editForm');
	div.show();
	
}

function createDialogBox() {
	var closeDiv = document.createElement('div');
	closeDiv.id = 'closeDiv';
	closeDiv.innerHTML = '<a href="#" onclick="document.getElementById(\'editForm\').hide(); return false;"><img src="' + context + '/admin/images/dialog/close.png" border="0"></a>'
	
	// create the iframe that will hold the edit page
	var editFormIframe = document.createElement('iframe');
	editFormIframe.id = 'editFormIframe';
	editFormIframe.style.display = 'none';
	
	// Create the inner container for the iframe
	var editFormIframeContainer = document.createElement('div');
	editFormIframeContainer.id = 'editFormIframeContainer';
	
	// create the outer container for the iframe
	var editForm = document.createElement('div');
	editForm.id = 'editForm';
	editForm.className = 'editForm';
	editForm.style.display = 'none';
	editForm.appendChild(editFormIframeContainer);
	editFormIframeContainer.appendChild(closeDiv);
	editFormIframeContainer.appendChild(editFormIframe);
	
	// add the div to the page

	document.body.insertBefore(editForm, document.body.childNodes[0]);
	
	// turn it into a dialog box
	new Dialog.Box('editForm');	
}

function moveFrontEndTools() {
	var frontEndTools = document.getElementById('frontEndTools');
	var frontEndToolsHandle = document.getElementById('frontEndToolsHandle');
	
	document.body.insertBefore(frontEndTools, document.body.childNodes[0]);
	document.body.insertBefore(frontEndToolsHandle, document.body.childNodes[0]);
}

//Event.observe(window, 'load', moveFrontEndTools, false);
addLoadEvent(moveFrontEndTools);
