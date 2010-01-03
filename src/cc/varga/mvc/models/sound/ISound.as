package cc.varga.mvc.models.sound
{
	public interface ISound
	{
		
		function getCurrentItem():Object
		function getNextItem():Object
		function getPrevItem():Object
		function pause():void
		function play():void
		
	}
}