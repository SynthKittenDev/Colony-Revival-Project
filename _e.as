// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_e

package 
{
    import flash.events.Event;

    public class _e extends Event 
    {

        public static const RECEIVE_SOCKET_ID:String = "receiveSocketID";
        public static const RECEIVE_USER_VARS:String = "receiveUserVars";
        public static const RECEIVE_ROOM_VARS:String = "receiveRoomVars";
        public static const RECEIVE_GLOBAL_VARS:String = "receiveGdlobalVars";
        public static const RECEIVE_IV:String = "receiveIV";
        public static const RECEIVE_VERSION:String = "receiveVersion";
        public static const RECEIVE_ROOMS:String = "receiveRooms";
        public static const RECEIVE_MESSAGE:String = "receiveMessage";
        public static const RECEIVE_USERS:String = "receiveUsers";
        public static const USER_JOIN_ROOM:String = "userJoinRoom";
        public static const USER_LEAVE_ROOM:String = "userLeaveRoom";
        public static const ERROR:String = "error";
        public static const READY:String = "ready";
        public static const REGISTER_SUCCESS:String = "registerSuccess";
        public static const REGISTER_ERROR:String = "registerError";
        public static const LOGIN_SUCCESS:String = "loginSuccess";
        public static const LOGIN_ERROR:String = "loginError";
        public static const PING:String = "ping";
        public static const RECEIVE_STATS:String = "receiveStats";

        public var obj:Object;
        public var sender:String;

        public function _e(_arg_1:String, obj:Object=null, sender:String=null, bubbles:Boolean=false, cancelable:Boolean=true)
        {
            super(_arg_1, bubbles, cancelable);
            this.obj = obj;
            this.sender = sender;
        }

    }
}//package 

