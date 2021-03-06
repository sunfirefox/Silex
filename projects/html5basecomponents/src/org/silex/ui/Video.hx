/*This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
package org.silex.ui;

/**
 * ...
 * @author Benjamin Dasnois
 */

/**
*  This class implements the Video component in HTML5.
*/
class Video extends UiBase
{
	private var scale : Float;
	private var autoPlay : Bool;
	private var autoSize : Bool;
	private var loop : Bool;
	private var showNavigation : Bool;
	private var bufferSize : Int;
	private var mute : Bool;
	private var volume : Float;
	private var useHandCursor : Bool;
	private var fadeInStep : Float;
	
	public function new() 
	{
		super();
	}
	
	public override function returnHTML()
	{
		if (this.url.split(".").pop() == "flv")
		{
			return '<object width="' + this.width + '" height="' + this.height + '">
			<param name="movie" value="' + this.url + '">
			<embed src="' + this.url + '" width="' + this.width + '" height="' + this.height + '">
			</embed>
			</object>';
		} else
		{
			return "<video style='width:" +this.width + "px;height:" + this.height +"px;' src='" + this.url
		+ "' width='" + width + "' height='" + height + "'" + (if (showNavigation) { " controls='controls'"; } else { ""; } ) + "></video>";
		}
	}
	
}