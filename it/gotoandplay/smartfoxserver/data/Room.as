// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.data.Room

package it.gotoandplay.smartfoxserver.data
{
    public class Room 
    {

        private var id:int;
        private var name:String;
        private var maxUsers:int;
        private var maxSpectators:int;
        private var temp:Boolean;
        private var game:Boolean;
        private var priv:Boolean;
        private var limbo:Boolean;
        private var userCount:int;
        private var specCount:int;
        private var myPlayerIndex:int;
        private var userList:Array;
        private var variables:Array;

        public function Room(id:int, name:String, maxUsers:int, maxSpectators:int, isTemp:Boolean, isGame:Boolean, isPrivate:Boolean, isLimbo:Boolean, userCount:int=0, specCount:int=0)
        {
            this.id = id;
            this.name = name;
            this.maxSpectators = maxSpectators;
            this.maxUsers = maxUsers;
            this.temp = isTemp;
            this.game = isGame;
            this.priv = isPrivate;
            this.limbo = isLimbo;
            this.userCount = userCount;
            this.specCount = specCount;
            this.userList = [];
            this.variables = [];
        }

        public function addUser(u:User, id:int):void
        {
            userList[id] = u;
            if (((this.game) && (u.isSpectator())))
            {
                specCount++;
            }
            else
            {
                userCount++;
            };
        }

        public function removeUser(id:int):void
        {
            var u:User = userList[id];
            if (((this.game) && (u.isSpectator())))
            {
                specCount--;
            }
            else
            {
                userCount--;
            };
            delete userList[id];
        }

        public function getUserList():Array
        {
            return (this.userList);
        }

        public function getUser(userId:*):User
        {
            var i:String;
            var u:User;
            var user:User;
            if (typeof(userId) == "number")
            {
                user = userList[userId];
            }
            else
            {
                if (typeof(userId) == "string")
                {
                    for (i in userList)
                    {
                        u = this.userList[i];
                        if (u.getName() == userId)
                        {
                            user = u;
                            break;
                        };
                    };
                };
            };
            return (user);
        }

        public function clearUserList():void
        {
            this.userList = [];
            this.userCount = 0;
            this.specCount = 0;
        }

        public function getVariable(varName:String):*
        {
            return (variables[varName]);
        }

        public function getVariables():Array
        {
            return (variables);
        }

        public function setVariables(vars:Array):void
        {
            this.variables = vars;
        }

        public function clearVariables():void
        {
            this.variables = [];
        }

        public function getName():String
        {
            return (this.name);
        }

        public function getId():int
        {
            return (this.id);
        }

        public function isTemp():Boolean
        {
            return (this.temp);
        }

        public function isGame():Boolean
        {
            return (this.game);
        }

        public function isPrivate():Boolean
        {
            return (this.priv);
        }

        public function getUserCount():int
        {
            return (this.userCount);
        }

        public function getSpectatorCount():int
        {
            return (this.specCount);
        }

        public function getMaxUsers():int
        {
            return (this.maxUsers);
        }

        public function getMaxSpectators():int
        {
            return (this.maxSpectators);
        }

        public function setMyPlayerIndex(id:int):void
        {
            this.myPlayerIndex = id;
        }

        public function getMyPlayerIndex():int
        {
            return (this.myPlayerIndex);
        }

        public function setIsLimbo(b:Boolean):void
        {
            this.limbo = b;
        }

        public function isLimbo():Boolean
        {
            return (this.limbo);
        }

        public function setUserCount(n:int):void
        {
            this.userCount = n;
        }

        public function setSpectatorCount(n:int):void
        {
            this.specCount = n;
        }


    }
}//package it.gotoandplay.smartfoxserver.data

