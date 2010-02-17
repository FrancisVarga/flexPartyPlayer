package cc.varga.mvc.service
{
	import mx.collections.ArrayCollection;

	public interface IPlaylistService
	{
		function add(item : Object) : void;
		function remove(item : Object) : void;
		function clear() : void;

    function get current() : Object;
		function get all() : ArrayCollection;
		function get next() : Object;
		function get prev() : Object;
	}
}
