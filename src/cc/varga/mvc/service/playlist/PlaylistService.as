package cc.varga.mvc.service.playlist
{
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	public class PlaylistService extends Actor implements IPlaylistService
	{
		[Bindable]
		private var playlist : ArrayCollection = new ArrayCollection();		
		
		public function PlaylistService()
		{
			super();
		}
		
		public function addToPlaylist(item : Object):void
		{
			playlist.addItem(item);
		}
		
		public function removeFromPlaylist(item : Object):void
		{
			
		}
		
		public function shufflePlaylist():void
		{
			
		}
		
		public function repeatPlaylist():void
		{
			
		}
		
		public function removeAll():void
		{
			
		}
		
		public function getPrev():Object{
			
			return {};
			
		}
		
		public function getNext():Object{
			return {};	
		}
		
		public function getAll():ArrayCollection
		{
			return playlist;
		}
	}
}