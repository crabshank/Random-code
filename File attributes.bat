@if (@CodeSection == @Batch) @then

@echo off

CScript //E:JScript //Nologo "%~f0" %*

pause >nul
exit /b

@end

try
{

ExistsItem = function (path) {
   return FSOObj.FolderExists(path)||FSOObj.FileExists(path);
}

getFullPath = function (path) {
    return FSOObj.GetAbsolutePathName(path);
}

getParent = function(path){
   var splitted=path.split("\\");
   var result="";
   for (var s=0;s<splitted.length-1;s++){
      if (s==0) {
         result=splitted[s];
      } else {
         result=result+"\\"+splitted[s];
      }
   }
   return result;
}

getName = function(path){
   var splitted=path.split("\\");
   return splitted[splitted.length-1];
}

function main(){
	
	WScript.Echo("Enter path");
var filename=WScript.StdIn.ReadLine();
filename=filename.split('"').join('');
FSOObj = new ActiveXObject("Scripting.FileSystemObject");
var objShell=new ActiveXObject("Shell.Application");
   if (!ExistsItem(filename)) {
      WScript.Echo(filename + " does not exist\n");
      main();
   }
   var fullFilename=getFullPath(filename);
   var namespace=getParent(fullFilename);
   var name=getName(fullFilename);
   var objFolder=objShell.NameSpace(namespace);
   var objItem=objFolder.ParseName(name);
  WScript.Echo("\n");
for (var j = 0; j < 0XFFFF; j++) {
    detail = objFolder.GetDetailsOf(objItem,j);
	prp=objFolder.GetDetailsOf(objItem.name,j);
    if (detail!="") {
		if (prp==""){
			WScript.Echo( "*: " + detail);
		}else{
			WScript.Echo( prp+": " + detail);
		}

    }

}

   			WScript.Echo("\n");
  main(); 
}

main();
	WScript.Quit(7);
}
catch(e)
{
	WScript.Quit(1);
}
