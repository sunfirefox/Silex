/*This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/

/**
 * Class controlling the rotation handles. List constants for rotation handle positions
 * @author Yannick DOMINGUEZ
 */
class org.silex.tools.selectionTool.ui.uis.uiComponents.RotationHandle extends MovieClip
{
	
	/////////////////////**/*/*/*/*/*/*/
	// CONSTANTS
	////////////////////**/*/*/*/*/*/*/
	
	public static var ROTATION_HANDLE_POSITION_TL:String = "rotationHandlePositionTL";
	
	public static var ROTATION_HANDLE_POSITION_TR:String = "rotationHandlePositionTR";
	
	public static var ROTATION_HANDLE_POSITION_BL:String = "rotationHandlePositionBL";
	
	public static var ROTATION_HANDLE_POSITION_BR:String = "rotationHandlePositionBR";
	
	/////////////////////**/*/*/*/*/*/*/
	// ATTRIBUTES
	////////////////////**/*/*/*/*/*/*/
	
	/**
	 * stores the position of the rotation handle
	 */
	private var _handlePosition:String;
	
	/////////////////////**/*/*/*/*/*/*/
	// CONTRUCTOR
	////////////////////**/*/*/*/*/*/*/
	
	public function RotationHandle() 
	{
		
	}
	
	/////////////////////**/*/*/*/*/*/*/
	// GETTERS/SETTERS
	////////////////////**/*/*/*/*/*/*/
	
	public function get handlePosition():String 
	{
		return _handlePosition;
	}
	
	public function set handlePosition(value:String):Void 
	{
		_handlePosition = value;
	}
	
}