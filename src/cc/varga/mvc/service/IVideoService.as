package cc.varga.mvc.service.video
{
	public interface IVideoService
	{
		function playFLV(url:String):void
		function playYoutubeVideo(youtubePlayer:DisplayObject, videoURL:String):void
	}
}