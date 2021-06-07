// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.BlossomEvent

package com.jiggmin.blossomSocket
{
    import flash.events.Event;

    public class BlossomEvent extends Event 
    {

        public static var RECEIVE_SOCKET_ID:String = "receiveSocketID";
        public static var RECEIVE_USER_VARS:String = "receiveUserVars";
        public static var RECEIVE_ROOM_VARS:String = "receiveRoomVars";
        public static var RECEIVE_GLOBAL_VARS:String = "receiveGdlobalVars";
        public static var RECEIVE_IV:String = "receiveIV";
        public static var RECEIVE_VERSION:String = "receiveVersion";
        public static var RECEIVE_ROOMS:String = "receiveRooms";
        public static var RECEIVE_MESSAGE:String = "receiveMessage";
        public static var RECEIVE_USERS:String = "receiveUsers";
        public static var USER_JOIN_ROOM:String = "userJoinRoom";
        public static var USER_LEAVE_ROOM:String = "userLeaveRoom";
        public static var ERROR:String = "error";
        public static var READY:String = "ready";
        public static var REGISTER_SUCCESS:String = "registerSuccess";
        public static var REGISTER_ERROR:String = "registerError";
        public static var LOGIN_SUCCESS:String = "loginSuccess";
        public static var LOGIN_ERROR:String = "loginError";
        public static var PING:String = "ping";
        public static var RECEIVE_STATS:String = "receiveStats";

        private var _raw:Object;
        private var _fromUser:BlossomUser;
        private var _socketID:int;
        private var _roomName:String;
        private var _data:*;
        private var _vars:Object;
        private var _error:String;
        private var _roomList:Array;
        private var _userList:Array;
        private var _userName:String;
        private var _userID:int;
        private var _moderator:Boolean;
        private var _iv:String;
        private var _version:Number;
        private var _time:int;

        public function BlossomEvent(_arg_1:String, raw:Object, fromUser:BlossomUser=null, bubbles:Boolean=false, cancelable:Boolean=false):void
        {
            _raw = raw;
            _fromUser = fromUser;
            _socketID = raw.socketID;
            _roomName = raw.roomName;
            _data = raw.data;
            _vars = raw.vars;
            _error = raw.error;
            _roomList = raw.roomList;
            _userList = raw.userList;
            _userName = raw.userName;
            _userID = raw.userID;
            _moderator = raw.moderator;
            _iv = raw.iv;
            _version = raw.version;
            _time = raw.time;
            super(_arg_1, bubbles, cancelable);
        }

        public function get socketID():int
        {
            return (_socketID);
        }

        public function get raw():Object
        {
            return (_raw);
        }

        public function get fromUser():BlossomUser
        {
            return (_fromUser);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get data():*
        {
            return (_data);
        }

        public function get vars():Object
        {
            return (_vars);
        }

        public function get error():String
        {
            return (_error);
        }

        public function get roomList():Array
        {
            return (_roomList);
        }

        public function get userList():Array
        {
            return (_userList);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get userID():int
        {
            return (_userID);
        }

        public function get moderator():Boolean
        {
            return (_moderator);
        }

        public function get iv():String
        {
            return (_iv);
        }

        public function get version():Number
        {
            return (_version);
        }

        public function get time():int
        {
            return (_time);
        }


    }
}//package com.jiggmin.blossomSocket

