package cc.varga.mvc.service.api
{
	public interface ISearchService
	{
	  function resolve(artist:String, track:String, onSuccess:Function, onError:Function) : void;	
	}
}
