/*This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
import mx.events.EventDispatcher;

/**
 * there is no class to inherit from in AS just to use dispatch events, as you're supposed to do a mixin. Mixins suck, so use this instead
 */

class org.silex.util.EventDispatcherBase{
	
	////////////////////////////
	// Group: EventDispatcher mixin
	////////////////////////////
	var addEventListener:Function;
	var removeEventListener:Function;
	var dispatchEvent:Function
	
	public function EventDispatcherBase(){
		EventDispatcher.initialize(this);
	}
	
}