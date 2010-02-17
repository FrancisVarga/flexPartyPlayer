package cc.varga.mvc.service
{

	public interface ISoundService 
	{
		function play(uid : String, onComplete : Function, onError : Function) : void;
    function stop() : void;
	}
}
