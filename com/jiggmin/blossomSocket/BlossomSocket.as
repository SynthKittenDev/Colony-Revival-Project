// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.BlossomSocket

package com.jiggmin.blossomSocket
{
    import flash.utils.clearInterval;
    import flash.utils.setInterval;
    import flash.events.Event;

    public class BlossomSocket extends CommandSocket 
    {

        private var _socketID:int;
        private var _pingTime:int;
        private var pingInterval:uint;
        private var version:Number = 1.1;
        private var _me:BlossomUser;

        public function BlossomSocket(address:String, port:int, key:String):void
        {
            initListeners();
            setKey(key);
            connect(address, port);
            _me = new BlossomUser(this, 0, 0, null, false, new Object());
        }

        public function get socketID():int
        {
            return (_socketID);
        }

        public function get pingTime():int
        {
            return (_pingTime);
        }

        public function get me():BlossomUser
        {
            return (_me);
        }

        public function getStats():void
        {
            var obj:Object = new Object();
            obj.type = "get_stats";
            send(obj);
        }

        public function register(userName:String, pass:String, email:String=""):void
        {
            var obj:Object = new Object();
            obj.type = "register";
            obj.name = userName;
            obj.pass = pass;
            obj.email = email;
            send(obj);
        }

        public function login(userName:String, pass:String):void
        {
            var obj:Object = new Object();
            obj.type = "login";
            obj.name = userName;
            obj.pass = pass;
            send(obj);
        }

        public function sendPing():void
        {
            var obj:Object = new Object();
            obj.type = "ping";
            obj.time = new Date().time;
            send(obj);
        }

        public function getRooms():void
        {
            var obj:Object = new Object();
            obj.type = "get_rooms";
            send(obj);
        }

        public function joinRoom(roomName:String, pass:String=""):void
        {
            var obj:Object = new Object();
            obj.type = "join_room";
            obj.room_name = roomName;
            obj.pass = pass;
            send(obj);
        }

        public function leaveRoom(roomName:String):void
        {
            var obj:Object = new Object();
            obj.type = "leave_room";
            obj.room_name = roomName;
            send(obj);
        }

        public function setRoomPass(roomName:String, pass:String):void
        {
            var obj:Object = new Object();
            obj.type = "set_room_pass";
            obj.room_name = roomName;
            obj.pass = pass;
            send(obj);
        }

        public function sendToRoom(roomName:String, data:*, sendToSelf:Boolean=false):void
        {
            var obj:Object = new Object();
            obj.type = "send_to_room";
            obj.room_name = roomName;
            obj.send_to_self = sendToSelf;
            obj.data = data;
            send(obj);
        }

        public function sendToUser(socketID:int, data:*):void
        {
            var obj:Object = new Object();
            obj.type = "send_to_user";
            obj.to_id = socketID;
            obj.data = data;
            send(obj);
        }

        public function setUserVars(variables:Object):void
        {
            _me.addVars(variables);
            manageVars(variables, "user", "set", "");
        }

        public function setRoomVars(variables:Object, roomName:String):void
        {
            manageVars(variables, "room", "set", roomName);
        }

        public function setGlobalVars(variables:Object):void
        {
            manageVars(variables, "global", "set", "");
        }

        public function getUserVars(varList:*, socketID:int):void
        {
            manageVars(varList, "user", "get", socketID.toString());
        }

        public function getRoomVars(varList:*, roomName:String):void
        {
            manageVars(varList, "room", "get", roomName);
        }

        public function getGlobalVars(varList:*):void
        {
            manageVars(varList, "global", "get", "");
        }

        public function deleteUserVars(varList:*):void
        {
            manageVars(varList, "user", "delete", "");
        }

        public function deleteRoomVars(varList:*, roomName:String):void
        {
            manageVars(varList, "room", "delete", roomName);
        }

        public function deleteGlobalVars(varList:*):void
        {
            manageVars(varList, "global", "delete", "");
        }

        public function lockUserVars():void
        {
            manageVars("", "user", "lock", "");
        }

        public function lockRoomVars(roomName:String):void
        {
            manageVars("", "room", "lock", roomName);
        }

        public function lockGlobalVars():void
        {
            manageVars("", "global", "lock", "");
        }

        public function unlockUserVars():void
        {
            manageVars("", "user", "unlock", "");
        }

        public function unlockRoomVars(roomName:String):void
        {
            manageVars("", "room", "unlock", roomName);
        }

        public function unlockGlobalVars():void
        {
            manageVars("", "global", "unlock", "");
        }

        override protected function connectHandler(e:Event):void
        {
            clearInterval(pingInterval);
            pingInterval = setInterval(sendPing, 30000);
            super.connectHandler(e);
        }

        override protected function closeHandler(e:Event):void
        {
            clearInterval(pingInterval);
            super.closeHandler(e);
        }

        private function manageVars(variables:*, location:String, action:String, id:String):void
        {
            var obj:Object = new Object();
            obj.type = "manage_vars";
            obj.user_vars = variables;
            obj.location = location;
            obj.action = action;
            obj.id = id;
            send(obj);
        }

        private function initListeners():void
        {
            addEventListener(BlossomEvent.RECEIVE_SOCKET_ID, receiveSocketIDHandler, false, 0, true);
            addEventListener(BlossomEvent.RECEIVE_MESSAGE, receiveMessageHandler, false, 0, true);
            addEventListener(BlossomEvent.RECEIVE_USER_VARS, receiveUserVarsHandler, false, 0, true);
            addEventListener(BlossomEvent.RECEIVE_ROOM_VARS, receiveRoomVarsHandler, false, 0, true);
            addEventListener(BlossomEvent.RECEIVE_VERSION, receiveVersionHandler, false, 0, true);
            addEventListener(BlossomEvent.RECEIVE_USERS, receiveUsersHandler, false, 0, true);
            addEventListener(BlossomEvent.USER_JOIN_ROOM, userJoinRoomHandler, false, 0, true);
            addEventListener(BlossomEvent.USER_LEAVE_ROOM, userLeaveRoomHandler, false, 0, true);
            addEventListener(BlossomEvent.LOGIN_SUCCESS, loginSuccessHandler, false, 0, true);
            addEventListener(BlossomEvent.PING, receivePing, false, 0, true);
        }

        private function receiveSocketIDHandler(be:BlossomEvent):void
        {
            _me = new BlossomUser(this, be.socketID, 0, null, false, new Object());
            this._socketID = be.socketID;
            var blossomEvent:BlossomEvent = new BlossomEvent(BlossomEvent.READY, be.raw);
            dispatchEvent(blossomEvent);
        }

        private function receiveMessageHandler(be:BlossomEvent):void
        {
            if (be.roomName != null)
            {
                dispatchEvent(new BlossomEvent((BlossomEvent.RECEIVE_MESSAGE + be.roomName), be.raw));
            };
            if (be.socketID != 0)
            {
                dispatchEvent(new BlossomEvent((BlossomEvent.RECEIVE_MESSAGE + be.socketID), be.raw));
            };
        }

        private function receiveVersionHandler(be:BlossomEvent):void
        {
            if (be.version > version)
            {
                remove();
                throw (new Error("Please update your client code. The Blossom Socket code you are using is no longer compatable with the remote server."));
            };
        }

        private function receiveUsersHandler(be:BlossomEvent):void
        {
            var i:int;
            var userObj:Object;
            var userRaw:Object;
            var users:Array = be.userList;
            var len:int = users.length;
            i = 0;
            while (i < len)
            {
                userObj = users[i];
                userRaw = new Object();
                userRaw.type = BlossomEvent.USER_JOIN_ROOM;
                userRaw.socketID = userObj.socketID;
                userRaw.userID = userObj.userID;
                userRaw.moderator = userObj.moderator;
                userRaw.userName = userObj.userName;
                userRaw.vars = userObj.vars;
                userRaw.roomName = be.roomName;
                dispatchEvent(new BlossomEvent(BlossomEvent.USER_JOIN_ROOM, userRaw));
                i++;
            };
        }

        private function receiveUserVarsHandler(be:BlossomEvent):void
        {
            dispatchEvent(new BlossomEvent((BlossomEvent.RECEIVE_USER_VARS + be.socketID), be.raw));
        }

        private function receiveRoomVarsHandler(be:BlossomEvent):void
        {
            dispatchEvent(new BlossomEvent((BlossomEvent.RECEIVE_ROOM_VARS + be.roomName), be.raw));
        }

        private function userJoinRoomHandler(be:BlossomEvent):void
        {
            dispatchEvent(new BlossomEvent((BlossomEvent.USER_JOIN_ROOM + be.roomName), be.raw));
        }

        private function userLeaveRoomHandler(be:BlossomEvent):void
        {
            dispatchEvent(new BlossomEvent((BlossomEvent.USER_LEAVE_ROOM + be.roomName), be.raw));
        }

        private function errorHandler(be:BlossomEvent):void
        {
            trace(("Error: " + be.error));
            if (be.roomName != null)
            {
                dispatchEvent(new BlossomEvent((BlossomEvent.ERROR + be.roomName), be.raw));
            };
        }

        private function loginSuccessHandler(be:BlossomEvent):void
        {
            _me = new BlossomUser(this, socketID, be.userID, be.userName, be.moderator, be.vars);
        }

        private function receivePing(be:BlossomEvent):void
        {
            _pingTime = (new Date().time - be.time);
        }

        override public function remove():void
        {
            removeEventListener(BlossomEvent.RECEIVE_SOCKET_ID, receiveSocketIDHandler);
            removeEventListener(BlossomEvent.RECEIVE_MESSAGE, receiveMessageHandler);
            removeEventListener(BlossomEvent.RECEIVE_USER_VARS, receiveUserVarsHandler);
            removeEventListener(BlossomEvent.RECEIVE_ROOM_VARS, receiveRoomVarsHandler);
            removeEventListener(BlossomEvent.RECEIVE_VERSION, receiveVersionHandler);
            removeEventListener(BlossomEvent.RECEIVE_USERS, receiveUsersHandler);
            removeEventListener(BlossomEvent.USER_JOIN_ROOM, userJoinRoomHandler);
            removeEventListener(BlossomEvent.USER_LEAVE_ROOM, userLeaveRoomHandler);
            removeEventListener(BlossomEvent.PING, receivePing);
            removeEventListener(BlossomEvent.LOGIN_SUCCESS, loginSuccessHandler);
            if (_me != null)
            {
                _me.remove();
                _me = null;
            };
            clearInterval(pingInterval);
            super.remove();
        }


    }
}//package com.jiggmin.blossomSocket

