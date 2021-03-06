<?php
/*This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/

////////////////////////////////////////////////////////////////////////
// Author: lexa and Thomas Fétiveau (thomas.fetiveau.tech@gmail.com) alias Zabojad
// get_section_preview.php
// This script allows get a resized preview image for the given page, in different scale modes : showAll, noBorder or noScale.
// inputs (GET) :
// * id_site : the name of the site, i.e. the name of the folder in contents/ (required)
// * page : the name of the page, i.e. the name of the xml file (without extension) in the folder contents/[id_site]/ (required)
// * scale : scale mode, showall or noborder or noscale (if not specified, showall by default)
// * width : the width of the result thumb (cannot be 0 or negative, keep width from source image if not specified)
// * height : the height of the result thumb (cannot be 0 or negative, keep height from source image if not specified)
////////////////////////////////////////////////////////////////////////
	require_once('../../rootdir.php');
	set_include_path(get_include_path() . PATH_SEPARATOR . ROOTPATH);
	set_include_path(get_include_path() . PATH_SEPARATOR . ROOTPATH.'cgi/library/');
	include_once("cgi/includes/media_tools.php");
	include_once("cgi/includes/site_editor.php");

	// for amfphp authentication
    session_start () ;

	// Require the site name
	if ( !isset ( $_GET['id_site'] ) )
	{
		?>
		<h2>Get section preview script for Silex</h2>
		<h3>About</h3>
		<i>cgi/scripts/get_section_preview.php</i><br /><br />
Author: lexa and Thomas Fétiveau (thomas.fetiveau.tech@gmail.com) alias Zabojad<br><br>get_section_preview.php<br> This script allows get a resized preview image for the given page, in different scale modes : showAll, noBorder or noScale.<br><br>inputs (GET) :<br> * id_site : the name of the site, i.e. the name of the folder in contents/ (required)<br> * page : the name of the page, i.e. the name of the xml file (without extension) in the folder contents/[id_site]/ (required)<br> * scale : scale mode, showall or noborder or noscale (if not specified, showall by default)<br> * width : the width of the result thumb (cannot be 0 or negative, keep width from source image if not specified)<br>* height : the height of the result thumb (cannot be 0 or negative, keep height from source image if not specified)<br>
		<h3>How to use this script</h3>
		<h3>The result</h3>
		<br /><br /><br/><br/><hr />
		<?php
		die("Help for the <a href='http://community.silexlabs.org/silex/help/?page_id=644'>PHP scripts of Silex</a><br/>&phpStatus=ko&message=id_site (site name) not specified&");
//		die ('Author: lexa and Thomas Fétiveau (thomas.fetiveau.tech@gmail.com) alias Zabojad<br><br>get_section_preview.php<br> This script allows get a resized preview image for the given page, in different scale modes : showAll, noBorder or noScale.<br><br>inputs (GET) :<br> * id_site : the name of the site, i.e. the name of the folder in contents/ (required)<br> * page : the name of the page, i.e. the name of the xml file (without extension) in the folder contents/[id_site]/ (required)<br> * scale : scale mode, showall or noborder or noscale (if not specified, showall by default)<br> * width : the width of the result thumb (cannot be 0 or negative, keep width from source image if not specified)<br>* height : the height of the result thumb (cannot be 0 or negative, keep height from source image if not specified)<br>&phpStatus=ko&message=id_site (site name) not specified&') ;
	}
	$id_site = $_GET['id_site'];

	// Require the page name
	if ( !isset ( $_GET['page'] ) )
	{
		?>
		<h2>Get image resized script for Silex</h2>
		<h3>About</h3>
		<i>cgi/scripts/get_resized_image.php</i><br /><br />
Author: lexa and Thomas Fétiveau (thomas.fetiveau.tech@gmail.com) alias Zabojad<br><br>get_section_preview.php<br> This script allows get a resized preview image for the given page, in different scale modes : showAll, noBorder or noScale.<br><br>inputs (GET) :<br> * id_site : the name of the site, i.e. the name of the folder in contents/ (required)<br> * page : the name of the page, i.e. the name of the xml file (without extension) in the folder contents/[id_site]/ (required)<br> * scale : scale mode, showall or noborder or noscale (if not specified, showall by default)<br> * width : the width of the result thumb (cannot be 0 or negative, keep width from source image if not specified)<br>* height : the height of the result thumb (cannot be 0 or negative, keep height from source image if not specified)<br>
		<h3>How to use this script</h3>
		<h3>The result</h3>
		<br /><br /><br/><br/><hr />
		<?php
		die("Help for the <a href='http://community.silexlabs.org/silex/help/?page_id=644'>PHP scripts of Silex</a><br/>&phpStatus=ko&message=page (page name) not specified&");
//		die ('<br> Author: Thomas Fétiveau (thomas.fetiveau.tech@gmail.com) alias Zabojad<br><br> get_resized_image.php<br> This script allows to resize a image in different scale modes : showAll, noBorder or noScale.<br><br>inputs (GET) :<br> * file : the path to the image from Silex root dir (required)<br> * scale : scale mode, showall or noborder or noscale (if not specified, showall by default)<br> * width : the width of the result thumb (cannot be 0 or negative, keep width from source image if not specified)<br> * height : the height of the result thumb (cannot be 0 or negative, keep height from source image if not specified)<br>&phpStatus=ko&message=page (page name) not specified&') ;
	}
	$page = $_GET['page'];

	if ( isset( $_GET["scale"] ) && is_numeric ( $_GET['scale'] ) )
		$scale =  $_GET['scale'];
	else
		$scale = NULL;
		
	if ( isset( $_GET["width"] ) && is_numeric ( $_GET['width'] ) )
		$width = $_GET['width'] ;
	else
		$width = NULL;
		
	if ( isset( $_GET["height"] ) && is_numeric ( $_GET['height'] ) )
		$height = $_GET['height'] ;
	else
		$height = NULL;
		
	// create a media tool
	$media_tools = new media_tools();
	
	// find the preview for the given page
	$s = new site_editor();
	$file = $s->getPagePreview($id_site,$page);
	
	// output the image
	$ret = $media_tools->outputResizedImage($file["path"], $scale, $width, $height);	

	// output errors if any
	if ($ret!='') echo "phpStatus=ko&message=$ret&"
?>