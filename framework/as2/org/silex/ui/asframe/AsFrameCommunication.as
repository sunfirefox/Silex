/*This file is part of Silex - see http://projects.silexlabs.org/?/silex

Silex is © 2010-2011 Silex Labs and is released under the GPL License:

This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License (GPL) as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

To read the license please visit http://www.gnu.org/copyleft/gpl.html
*/
import org.silex.core.Utils;import org.silex.ui.asframe.AsFrameBase;//import flash.external.ExternalInterface;/** * @description * <strong>Author:</strong>lex@silex-ria.org<br /> * <strong>Description: </strong> * handle the communication with the javascript frame through ExternalInterface * @author lex@silex-ria.org */class org.silex.ui.asframe.AsFrameCommunication extends AsFrameBase{	/////////////////////////////////////////////	//////////////	constants	/////////////////	/////////////////////////////////////////////	/**	 * class name	 */	private var className:String = "AsFrameCommunication";		/**	 * js class and functions (obfruscated)	 *///	private var JS_FRAME_API:String = "JsFrameBase.prototype.ALLOW_FIREBUG=false;JsFrameBase.prototype.TRACE_ERROR=\"error\";JsFrameBase.prototype.TRACE_WARNING=\"warning\";JsFrameBase.prototype.TRACE_DEBUG=\"debug\";JsFrameBase.prototype.nextZIndex=20000;JsFrameBase.prototype.className=\"JsFrameBase\";function JsFrameBase(ha){this.idFrame;this.frameContainer;this.frame;this.isHtmlTextDirty=false;this._useIframe=true;this.getUseIframe=function(){return this._useIframe;}\nthis.setUseIframe=function(ia){if(this.frame&&this._useIframe!=ia){this.exitDom();this._useIframe=ia;this.enterDom();}\nelse this._useIframe=ia;}\nthis._location=\"\";this.getLocation=function(){return this._location;}\nthis.setLocation=function(ja){if(ja&&ja!=\"\"&&ja!=this._location){this.trace(\"location set to \"+ja);this.isHtmlTextDirty=true;this._htmlText=\"\";this._location=ja;this.setUseIframe(true);this.applyFrameProperties();}}\nthis._htmlText=\"\";this.getHtmlText=function(){return this._htmlText;}\nthis.setHtmlText=function(ka){if(ka&&ka!=\"\"&&ka!=this._htmlText){this.trace(\"htmlText set to \"+ka);this.isHtmlTextDirty=true;this._htmlText=ka;this._location=\"\";this.setUseIframe(false);this.applyFrameProperties();}}\nthis._x=0;this.getX=function(){return this._x;}\nthis.setX=function(la){this._x=la;this.applyFrameProperties();}\nthis._y=0;this.getY=function(){return this._y;}\nthis.setY=function(ma){this._y=ma;this.applyFrameProperties();}\nthis._width=100;this.getWidth=function(){return this._width;}\nthis.setWidth=function(na){this._width=na;this.applyFrameProperties();}\nthis._height=100;this.getHeight=function(){return this._height;}\nthis.setHeight=function(oa){this._height=oa;this.applyFrameProperties();}\nthis.JsFrameBase=function(ha){this.trace(\"constructor - id: \"+this.idFrame);this.idFrame=ha;}\nthis.redraw=function(){this.isHtmlTextDirty=true;this.applyFrameProperties();}\nthis.trace=function(pa,qa){if(this.ALLOW_FIREBUG==true&&typeof console!=\"undefined\"){try{switch(qa){case this.TRACE_ERROR:console.error(this.className+\" - \"+this.idFrame+\": \",pa);break;case this.TRACE_WARNING:console.warning(this.className+\" - \"+this.idFrame+\": \",pa);break;default:console.log(this.className+\" - \"+this.idFrame+\": \",pa);}}\ncatch(e){}}\nelse{}}\nthis.enterDom=function(){if(!this.frame){this.trace(\"enterDom \"+this.idFrame+\" - useIframe = \"+this.getUseIframe());if(!$('#frameContainer').length)$('body').append('<div style=\"z-index: \"'+(this.nextZIndex++)+' id=\"frameContainer\"></div>');JsFrameBase.frameContainer=$('#frameContainer');var ra;if(this.getUseIframe()==true)ra=$('<iframe style=\"background-color:transparent; border-width:0\" id=\"'+this.idFrame+'\">');else ra=$('<div style=\"z-index: '+(this.nextZIndex++)+'; border: 0px; padding-top: 0px; padding-bottom: 0px; padding-left: 0px; padding-right: 0px;\" id=\"'+this.idFrame+'\" >');$('#frameContainer').append(ra);this.frame=ra[0];var sa=this;setTimeout(function(){sa.applyFrameProperties();},1);}\nelse{throw(new Error(\"enterDom - The frame is allready in the DOM: \"+ha));}}\nthis.applyFrameProperties=function(){if(this.frame){if(this.frame.style.position!=\"absolute\")this.frame.style.position=\"absolute\";if(this.frame.style.top!=this.getY()+\"px\")this.frame.style.top=this.getY();if(this.frame.style.left!=this.getX()+\"px\")this.frame.style.left=this.getX();if(this.frame.style.width!=this.getWidth()+\"px\")this.frame.style.width=this.getWidth();if(this.frame.style.height!=this.getHeight()+\"px\")this.frame.style.height=this.getHeight();if(this.getUseIframe()==true){if(this.isHtmlTextDirty&&this.frame.src!=this.getLocation()){this.frame.src=this.getLocation();this.isHtmlTextDirty=false;}}\nelse{if(this.isHtmlTextDirty){this.frame.innerHTML=this.getHtmlText();this.isHtmlTextDirty=false;}}}}\nthis.exitDom=function(){if(this.frame){this.trace(\"exitDom \"+this.idFrame);$(\"#\"+this.idFrame).remove();delete this.frame;this.frame=undefined;}\nelse{this.trace(\"exitDom error: was not in the dom\",this.TRACE_WARNING);}}\nthis.unload=function(){this.exitDom();}\nthis.JsFrameBase(ha);}\nfunction initJsFrameResize(ta){JsFrameBase.resizeSwfId=ta;}\nfunction onFrameResize(){if(JsFrameBase.resizeSwfId)$(\"#\"+JsFrameBase.resizeSwfId)[0].onFrameResize($(\"#\"+JsFrameBase.resizeSwfId).width(),$(\"#\"+JsFrameBase.resizeSwfId).height(),$(window).width(),$(window).height());}$(window).resize(onFrameResize);$(document).ready(function(){$(window).resize(onFrameResize);});function addJsFrame(ua){if(!JsFrameBase.jsFrames)JsFrameBase.jsFrames=new Array();if(JsFrameBase.jsFrames[ua]){throw(new Error(\"addJsFrame - The frame id was allready defined: \"+ua));}\nJsFrameBase.jsFrames[ua]=new JsFrameBase(ua);return JsFrameBase.jsFrames[ua];}\nfunction getJsFrame(va){return JsFrameBase.jsFrames[va];}\nfunction removeJsFrame(wa){JsFrameBase.jsFrames[wa].unload();delete JsFrameBase.jsFrames[wa];}";	/////////////////////////////////////////////	///////////////	attributes ////////////////	/////////////////////////////////////////////	/////////////////////////////////////////////	//////////////	methods		/////////////////	/////////////////////////////////////////////	/**	 * constructor	 */	public function AsFrameCommunication() 	{/*		if (ExternalInterface.available != true)		{			//_root.getURL("!!!!!!!!!!!!!!!!!!!!! ExternalInterface not available");			// error			throw(new Error("ExternalInterface not available"));		}*/				// add callback for resize event of javascript		// call through document.getElementById('silex').SetVariable('silex_result_str',...		//ExternalInterface.addCallback("onFrameResize", null, Utils.createDelegate(this, onFrameResize));	}			/**	 * write the oobject tag in the frame	 * @param	urlMedia	swf file url	 * @param	w			width in the html page coordinate system	 * @param	h			height in the html page coordinate system	 *//*	var embededObjectUrlMedia:String;	var embededObjectId:String;	var embededObjectWidth:String;	var embededObjectHeight:String;	private function writeEmbededObject(urlMedia:String, newId:String, w:Number, h:Number) 	{		// display the embeded object		// _htmlText = '<script type="text/javascript">var so = new SWFObject("' + urlMedia + '", "' + newId + '", "' + w + '", "' + h + '", "8", "#64696D"); so.addParam("wmode", "transparent"); so.addParam("AllowScriptAccess","always"); so.write("' + idFrame + '");</script>';		_htmlText = "------------------------------------------------------------------------------------------------------------------------------------------------------------------";		embededObjectUrlMedia = urlMedia;		embededObjectId = newId;		embededObjectWidth = (Math.round(w)).toString();		embededObjectHeight = (Math.round(h)).toString();	}*/	/**	 * Initialize the JS API	 */	private function initJsApi()	{				// no because bug activation on some ie		//jsCall(JS_FRAME_API);		if (_root.flashId != undefined)		{			jsCall("initJsFrameResize('" + _root.flashId + "');");		}		else		{			// workaround tfou / loaded into a shitty swf : no flashvars
			// happens sometimes			//_root.forceAlign = "";			//_root.forceScaleMode = "noScale"			jsCall("initJsFrameResize('silex');");		}				// root callback for js		_global.getSilex().interpreter.resizeAllAsFrames = function (stageW:Number,stageH:Number,winW:Number,winH:Number)		{			org.silex.ui.asframe.AsFrameBase.resizeAllAsFrames(stageW,stageH,winW,winH)		}	}	/**	 * Create the JsFrame object	 */	private function addJsFrame()	{		// check id		if (idFrame == undefined) throw(new Error("idFrame undefined"));		// call js		jsCall("addJsFrame('"+idFrame+"');");	}	/**	 * Modify a frame attributes in js	 */	public function synchAsJsValue(asProp:String, jsProp:String)	{		// check id		if (idFrame == undefined)			return;			//throw(new Error("idFrame undefined"));					// call js		if (this[asProp]!=undefined)			jsCall("getJsFrame('"+idFrame+"').set"+jsProp+"('"+cleanJsValue(this[asProp])+"');");	}	/**	 * escape ' and \ and \r and \n	 */	public function cleanJsValue(_str:String):String	{/*		var jsValue:String = replace(_str,"\n","");		jsValue = replace(jsValue,"\r","");		jsValue = replace(jsValue,"'","\\'");		return jsValue;*/		return escape(_str);	}	/**	 * Replace a string by another string in the source string.	 * @param	chaine_str	 * @param	a_remplacer_str	 * @param	remplacement_str	 * @return	the input with all occurences replaced	 	static function replace(chaine_str:String,a_remplacer_str:String,remplacement_str:String):String	{		var res_str:String="";		var tmp_index:Number;		var tmp_array:Array=chaine_str.split(a_remplacer_str);				for (tmp_index=0;tmp_index<tmp_array.length;tmp_index++)		{			res_str+=tmp_array[tmp_index];			if (tmp_index!=tmp_array.length-1)				res_str+=remplacement_str;		}		return res_str;	}*/	/**	 * Delete the JsFrame object	 */	public function removeJsFrame()	{		// check id		if (idFrame == undefined)		{			throw(new Error("idFrame undefined"));		}		// call js		jsCall("removeJsFrame('"+idFrame+"');");	}	/**	 * Display the frame after init	 */	var idxIntervalEnterDom:Number = -1;	public function enterDom() 	{		// check id		if (idFrame == undefined) throw(new Error("idFrame undefined"));		// retrieve the window size and compute scale		// will call org.silex.ui.AsFrameBase::onFrameResize in return with w and h		// only for scaleMode = exactfit		jsCall("onFrameResize()");				// call js to enter the DOM		//jsCall("getJsFrame('" + idFrame + "').enterDom();");		// workaround bug activation on some ie		//if (idxIntervalEnterDom > -1) clearInterval(idxIntervalEnterDom);		// idxIntervalEnterDom = setInterval(Utils.createDelegate(this,doEnterDom),2000);		doEnterDom();				// if needed, instanciate the flash plugin/*		if (embededObjectUrlMedia && _htmlText == "")		{			jsCall("embedFlashPlugin('" + idFrame + "','" + embededObjectUrlMedia + "','" + embededObjectId + "','" + embededObjectWidth + "','" + embededObjectHeight + "')");		}*/	}	public function doEnterDom() 	{		if (idxIntervalEnterDom > -1) clearInterval(idxIntervalEnterDom);		idxIntervalEnterDom = -1;		jsCall("getJsFrame('" + idFrame + "').enterDom();");	}	private function jsCall(command)	{		//ExternalInterface.call("eval",command);		_global.getSilex().com.jsCall(command);	}}