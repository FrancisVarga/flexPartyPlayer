//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
//Authors: Franics Varga
//eMail: fv@varga-multimedia.com
//homepage: http://www.varga-multimedia.com
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//<a href='http://creativecommons.org/licenses/by-nc-sa/3.0/'>Creative Commons License<a\>
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//You are free:
//
//to Share — to copy, distribute and transmit the work
//to Remix — to adapt the work
//Under the following conditions:
//
//Attribution — You must attribute the work in the manner specified by the author or licensor 
//(but not in any way that suggests that they endorse you or your use of the work).
//
//Noncommercial — You may not use this work for commercial purposes.
//
//Share Alike — If you alter, transform, or build upon this work, you may distribute the resulting work only under the same or similar license to this one.
//
//With the understanding that:
//
//Waiver — Any of the above conditions can be waived if you get permission from the copyright holder.
//Public Domain — Where the work or any of its elements is in the public domain under applicable law, that status is in no way affected by the license.
//Other Rights — In no way are any of the following rights affected by the license:
//
//Your fair dealing or fair use rights, or other applicable copyright exceptions and limitations; The author's moral rights;
//
//Rights other persons may have either in the work itself or in how the work is used, such as publicity or privacy rights.
//Notice — For any reuse or distribution, you must make clear to others the license terms of this work. 
//The best way to do this is with a link to this web page.																	
//
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
package cc.varga.utils.logging
{
//	import flash.filesystem.File;
//	import flash.filesystem.FileMode;
//	import flash.filesystem.FileStream;
	import cc.varga.mvc.ApplicationContext;
	
	import flash.utils.getTimer;

	public class Logger
	{
		
		private static var traceingStr : String = "";
		//private static var tracingFile : File = new File(File.applicationDirectory.resolvePath("libs/logs/trace.log").toString());
		
		private static var errorStr : String = "";
		//private static var errorFile : File = new File(File.applicationDirectory.resolvePath("libs/logs/error.log").toString());
		
		private static var debugStr : String = "";
		//private static var debugFile : File = new File(File.applicationDirectory.resolvePath("libs/logs/debug.log").toString());
		
		public function Logger(){}
		
		public static function tracing(message:String, classpath : String):void{
			traceingStr = "["+getTimer()+"].[TRACING].["+classpath+"] --> " + message;
			trace(traceingStr);
			(ApplicationContext.INSTANCE.contextView as FlexPlayer).debug.text += traceingStr + "\n";
			//writeToFile(tracingFile, traceingStr);
		}
		
		public static function errorTracing(message:String, classpath : String):void{
			errorStr = "["+getTimer()+"].[ERROR].["+classpath+"]--> " + message;
			trace(errorStr);
			(ApplicationContext.INSTANCE.contextView as FlexPlayer).debug.text += traceingStr + "\n";
			//writeToFile(errorFile, errorStr);
		}
		
		public static function debugTracing(message:String, classpath : String):void{
			debugStr= "["+getTimer()+"].[DEBUG].["+classpath+"]--> " + message;	
			trace(debugStr);
			(ApplicationContext.INSTANCE.contextView as FlexPlayer).debug.text += traceingStr + "\n";
			//writeToFile(debugFile, debugStr);
		}
		
		/*
		private static function writeToFile(type:File, message:String):void{
			
			var fileStream : FileStream = new FileStream();
			fileStream.openAsync(type, FileMode.WRITE);
			fileStream.writeUTFBytes(message);
			fileStream.close();
			
		}
		*/
		public function toString():String{ return "cc.varga.utils.logging.Logger"}
	}
	
}