/*This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/

package org.silex.wysiwyg.toolboxes.properties
{
	import org.silex.wysiwyg.event.CommunicationEvent;
	import org.silex.wysiwyg.event.ToolsEvent;
	import org.silex.wysiwyg.toolboxes.SilexToolBase;
	
	/**
	 * This toolboxe displays the properties of a Component object. The properties are displayed in external swf loaded by the property
	 * toolbox.
	 * Acts as a link beetween the ToolController and the tool UI. Listens for event on the UI and dispatches event for the ToolController
	 */
	public class PropertiesTool extends SilexToolBase
	{
		public function PropertiesTool()
		{
			super();
			_toolUI = new PropertiesUI();
			
			this.percentWidth = 100;
			
			addChild(_toolUI);
		}
		
	}
}