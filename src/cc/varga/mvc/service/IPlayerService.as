package cc.varga.mvc.service {
  public interface IPlayerService {
    function set state(newState : String) : void;
    function get state() : String;
    function set beforeNext(callback : Function) : void;
    function play(sid : String) : void;
  }
}
