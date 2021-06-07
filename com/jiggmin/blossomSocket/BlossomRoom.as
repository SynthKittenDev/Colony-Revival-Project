// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.BlossomRoom

package com.jiggmin.blossomSocket
{
    import flash.display.Sprite;

    public class BlossomRoom extends Sprite 
    {

        private var socket:BlossomSocket;
        private var _roomName:String;
        private var _userArray:Array = new Array();
        private var _vars:Object;

        public function BlossomRoom(socket:BlossomSocket, roomName:String, pass:String=""):void
        {
            this.socket = socket;
            _roomName = roomName;
            socket.addEventListener((BlossomEvent.ERROR + _roomName), errorHandler, false, 0, true);
            socket.addEventListener((BlossomEvent.RECEIVE_ROOM_VARS + _roomName), receiveRoomVarsHandler, false, 0, true);
            socket.addEventListener((BlossomEvent.USER_JOIN_ROOM + _roomName), userJoinRoomHandler, false, 0, true);
            socket.addEventListener((BlossomEvent.USER_LEAVE_ROOM + _roomName), userLeaveRoomHandler, false, 0, true);
            socket.addEventListener((BlossomEvent.RECEIVE_MESSAGE + _roomName), receiveMessageHandler, false, 0, true);
            socket.joinRoom(_roomName, pass);
        }

        public function get roomName():String
        {
            return (_roomName);
        }

        public function get userArray():Object
        {
            var user:BlossomUser;
            var array:Array = new Array();
            for each (user in _userArray)
            {
                if (user != null)
                {
                    array.push(user);
                };
            };
            return (array);
        }

        public function get vars():Object
        {
            return (_vars);
        }

        public function getVars(varList:*):void
        {
            socket.getRoomVars(varList, _roomName);
        }

        public function socketIDToUser(socketID:int):BlossomUser
        {
            var user:BlossomUser = _userArray[socketID];
            return (user);
        }

        public function sendToRoom(data:*, sendToSelf:Boolean=true, _arg_3:String=null):void
        {
            var raw:Object = new Object();
            if (_arg_3 != null)
            {
                raw.type = _arg_3;
            };
            raw.data = data;
            socket.sendToRoom(_roomName, raw, sendToSelf);
        }

        public function setPass(pass:String):void
        {
            socket.setRoomPass(_roomName, pass);
        }

        public function setVars(vars:Object):*
        {
            socket.setRoomVars(vars, _roomName);
        }

        public function deleteVars(varList:*):void
        {
            socket.deleteRoomVars(varList, _roomName);
        }

        public function lockVars():void
        {
            socket.lockRoomVars(_roomName);
        }

        public function unlockVars():void
        {
            socket.unlockRoomVars(_roomName);
        }

        private function errorHandler(be:BlossomEvent):void
        {
            var error:String = be.error;
            dispatchEvent(new BlossomEvent(BlossomEvent.ERROR, be.raw));
        }

        private function receiveRoomVarsHandler(be:BlossomEvent):void
        {
            _vars = be.vars;
            dispatchEvent(new BlossomEvent(BlossomEvent.RECEIVE_ROOM_VARS, be.raw));
        }

        private function userJoinRoomHandler(be:BlossomEvent):void
        {
            var user:BlossomUser = new BlossomUser(socket, be.socketID, be.userID, be.userName, be.moderator, be.vars);
            _userArray[be.socketID] = user;
            dispatchEvent(new BlossomEvent(BlossomEvent.USER_JOIN_ROOM, be.raw, user));
        }

        private function userLeaveRoomHandler(be:BlossomEvent):void
        {
            var socketID:int = be.socketID;
            var user:BlossomUser = _userArray[socketID];
            _userArray[socketID] = null;
            if (user != null)
            {
                dispatchEvent(new BlossomEvent(BlossomEvent.USER_LEAVE_ROOM, be.raw, user));
                user.remove();
            };
            if (socketID == socket.socketID)
            {
                remove();
            };
        }

        private function receiveMessageHandler(be:BlossomEvent):void
        {
            var _local_5:String;
            var raw:Object = be.data;
            var socketID:int = be.socketID;
            var user:BlossomUser = _userArray[socketID];
            raw.socketID = socketID;
            if (((raw.type == null) || (raw.type == "")))
            {
                _local_5 = BlossomEvent.RECEIVE_MESSAGE;
            }
            else
            {
                _local_5 = raw.type;
            };
            dispatchEvent(new BlossomEvent(_local_5, raw, user));
        }

        public function leaveRoom():void
        {
            remove();
        }

        public function remove():void
        {
            socket.leaveRoom(_roomName);
            socket.removeEventListener((BlossomEvent.ERROR + _roomName), errorHandler);
            socket.removeEventListener((BlossomEvent.RECEIVE_ROOM_VARS + _roomName), receiveRoomVarsHandler);
            socket.removeEventListener((BlossomEvent.USER_JOIN_ROOM + _roomName), userJoinRoomHandler);
            socket.removeEventListener((BlossomEvent.USER_LEAVE_ROOM + _roomName), userLeaveRoomHandler);
            socket.removeEventListener((BlossomEvent.RECEIVE_MESSAGE + _roomName), receiveMessageHandler);
            socket = null;
            _userArray = null;
        }


    }
}//package com.jiggmin.blossomSocket

