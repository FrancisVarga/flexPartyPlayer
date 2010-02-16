package cc.varga.mvc.service
{
	public interface ISearchService
	{
	  function resolve(artist:String, track:String, onSuccess:Function, onError:Function) : void;	
	}
}
