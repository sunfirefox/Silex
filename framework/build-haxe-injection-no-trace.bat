c:\mtasc\mtasc ./as2/org/silex/core/Api.as ./as2/org/silex/link/HaxeLink.as -swf bin/silexApiAs2Lib.swf -trace no -header  800:600:20 -cp ./as2/
haxe build.hxml
copy "bin\CodeInjection.swf" "..\silex_server\silex.swf"
pause