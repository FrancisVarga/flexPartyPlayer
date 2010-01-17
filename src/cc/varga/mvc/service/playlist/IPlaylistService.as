package cc.varga.mvc.service.playlist
{
	import mx.collections.ArrayCollection;

	public interface IPlaylistService
	{
		function addToPlaylist(item : Object):void
		function removeFromPlaylist(item : Object):void
		function shufflePlaylist():void
		function repeatPlaylist():void
		function removeAll():void
		function getAll():ArrayCollection
		function getNext():Object
		function getPrev():Object
			
	}
}