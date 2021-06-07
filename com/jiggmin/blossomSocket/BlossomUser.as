// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.jiggmin.blossomSocket.BlossomUser

package com.jiggmin.blossomSocket
{
    import flash.display.Sprite;

    public class BlossomUser extends Sprite 
    {

        private var socket:BlossomSocket;
        private var id:String;
        private var _socketID:int;
        private var _userID:int;
        private var _userName:String;
        private var _moderator:Boolean;
        private var _vars:Object;

        public function BlossomUser(socket:BlossomSocket, socketID:int, userID:int=0, userName:String=null, moderator:Boolean=false, vars:Object=null):void
        {
            this.socket = socket;
            _socketID = socketID;
            _userID = userID;
            _userName = userName;
            _moderator = moderator;
            _vars = vars;
            id = socketID.toString();
            socket.addEventListener((BlossomEvent.RECEIVE_USER_VARS + id), receiveUserVarsHandler, false, 0, true);
            socket.addEventListener((BlossomEvent.RECEIVE_MESSAGE + id), receiveMessageHandler, false, 0, true);
        }

        public function get socketID():int
        {
            return (_socketID);
        }

        public function get userID():int
        {
            return (_userID);
        }

        public function get userName():String
        {
            return (_userName);
        }

        public function get moderator():Boolean
        {
            return (_moderator);
        }

        public function get vars():Object
        {
            return (_vars);
        }

        public function set socketID(socketID:int):void
        {
            _socketID = socketID;
        }

        public function set userID(userID:int):void
        {
            _userID = userID;
        }

        public function set userName(userName:String):void
        {
        }

        public function set moderator(moderator:Boolean):void
        {
            _moderator = moderator;
        }

        public function set vars(vars:Object):void
        {
            _vars = vars;
        }

        private function receiveUserVarsHandler(be:BlossomEvent):void
        {
            addVars(be.vars);
            dispatchEvent(new BlossomEvent(BlossomEvent.RECEIVE_USER_VARS, be.vars));
        }

        private function receiveMessageHandler(be:BlossomEvent):void
        {
            var raw:Object = be.data;
            dispatchEvent(new BlossomEvent(BlossomEvent.RECEIVE_MESSAGE, raw));
        }

        public function send(data:*):void
        {
            socket.sendToUser(socketID, data);
        }

        public function getVars(varList:*):void
        {
            socket.getUserVars(socketID, varList);
        }

        internal function addVars(vars:Object):void
        {
            var variable:String;
            for (variable in vars)
            {
                _vars[variable] = vars[variable];
            };
        }

        public function remove():void
        {
            socket.removeEventListener((BlossomEvent.RECEIVE_USER_VARS + id), receiveUserVarsHandler);
            socket.removeEventListener((BlossomEvent.RECEIVE_MESSAGE + id), receiveMessageHandler);
            socket = null;
            id = null;
            _userName = null;
            _vars = null;
        }


    }
}//package com.jiggmin.blossomSocket

