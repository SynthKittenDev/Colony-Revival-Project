// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//mpKon

package 
{
    import flash.events.EventDispatcher;
    import flash.utils.Timer;
    import it.gotoandplay.smartfoxserver.SmartFoxClient;
    import com.jiggmin.blossomSocket.BlossomSocket;
    import com.jiggmin.blossomSocket.BlossomRoom;
    import it.gotoandplay.smartfoxserver.SFSEvent;
    import it.gotoandplay.smartfoxserver.data.User;
    import com.jiggmin.SocketManager;
    import flash.events.TimerEvent;
    import it.gotoandplay.smartfoxserver.*;

    public class mpKon 
    {

        public static const D:EventDispatcher = new EventDispatcher();
        private static var T:Timer = new Timer(2300);
        public static var fox:SmartFoxClient;
        public static var blo:BlossomSocket;
        public static var room:BlossomRoom;
        public static var playerUnitId:uint;
        public static var foxMode:Boolean = false;
        public static var roomList:Array = new Array();
        public static var socket:*;
        public static var roomObj:*;
        private static var justJoin:Boolean = false;
        public static var userList:Array;
        public static var userName:String = "";
        public static var reacher:MultiplayerScreen;
        public static var userData:Object;
        public static var justMade:Boolean = false;
        private static var roomSaveTrans:String;
        private static var eventOverride:Boolean = false;
        private static var ROOT:Object;
        public static var gameBegun:Boolean = false;
        public static var zoneIn:Boolean = false;
        private static var yugoSlav:uint = 75;
        private static var s:String;
        public static var buddyMsg:Function = null;
        public static var buddyW:Function = null;
        private static var foxGRName:String;
        private static var byPassNotice:Boolean = false;


        public static function init(r:Object):void
        {
            ROOT = r;
        }

        public static function deactivate():void
        {
        }

        public static function sendEv(a:uint, b:Object=null, c:uint=99, d:String=""):void
        {
            var ds:String = "";
            switch (a)
            {
                case 0:
                    break;
                case 1:
                    break;
            };
            if (ds != "")
            {
            };
        }

        public static function sendOff(obj:Object, sendToSelf:Boolean, codeType:String, id:Number=-1):void
        {
            var vars:Object;
            if (id < 0)
            {
                foxSend(obj, codeType, sendToSelf);
            }
            else
            {
                vars = new Object();
                vars.sub = obj;
                vars.id = codeType;
                fox.sendObjectToGroup(vars, [id]);
            };
        }

        public static function setUserVars(a:Object):*
        {
            fox.setUserVariables(a);
        }

        public static function eventRem(a:String, b:Function, fromMan:Boolean=false):void
        {
            fox.removeEventListener(translateString(a), b);
        }

        public static function eventSub(a:String, b:Function, fromMan:Boolean=false):void
        {
            fox.addEventListener(translateString(a), b, false, 0, true);
        }

        public static function foxZone():void
        {
            fox.login("ColonyFox7", userName, "");
            fox.addEventListener(SFSEvent.onObjectReceived, obRec);
            fox.addEventListener(SFSEvent.onPublicMessage, onPublicMessageHandler);
            fox.addEventListener(SFSEvent.onConnectionLost, DC);
            fox.addEventListener(SFSEvent.onLogin, onLoginHandler);
            fox.addEventListener(SFSEvent.onExtensionResponse, repEx);
            fox.addEventListener(SFSEvent.onPrivateMessage, onPrivateMessageHandler);
            fox.addEventListener(SFSEvent.onPublicMessage, onPublicMessageHandler);
        }

        private static function onLoginHandler(e:SFSEvent):void
        {
            if (e.params.success)
            {
                // trace("Logged In.");
                fox.loadBuddyList();
                fox.addEventListener(SFSEvent.onBuddyListUpdate, onBuddyListUpdateHandler);
                fox.addEventListener(SFSEvent.onRoomListUpdate, roomListHandlerLogin, false, 0, true);
                fox.addEventListener(SFSEvent.onAdminMessage, onAdminMessageHandler);
            }
            else
            {
                dataTracer.DC("Cannot log in with that name, please choose a different name.");
                // trace("Cannot Log Into Zone.");
            };
        }

        private static function onAdminMessageHandler(evt:SFSEvent):void
        {
            dataTracer.throwError(("ADMIN: " + evt.params.message));
        }

        public static function sendMsg(t:String):void
        {
            fox.sendPublicMessage(t);
        }

        private static function onPublicMessageHandler(evt:SFSEvent):void
        {
            reacher.receiveChatHandler(null, evt.params.message, evt.params.sender.getName());
        }

        public static function sendWhisper(n:String, t:String):void
        {
            var bf:*;
            var buddy:Object;
            var buddyFound:Boolean;
            for (bf in fox.buddyList)
            {
                buddy = mpKon.fox.buddyList[bf];
                if (buddy.name == n)
                {
                    buddyFound = true;
                    if (buddy.isBlocked)
                    {
                        buddyMsg((('<font color="#E23125">' + "You cannot send private messages to blocked users.") + "</font>"));
                    }
                    else
                    {
                        if (buddy.isOnline)
                        {
                            buddyMsg((((('<font color="#8C4FA1"> To [' + n) + "]: ") + t) + "</font>"));
                            fox.sendPrivateMessage(((userName + "!!&&!!") + t), buddy.id);
                        }
                        else
                        {
                            buddyMsg(((('<font color="#E23125">' + n) + " is currently offline.") + "</font>"));
                        };
                    };
                };
            };
            if (!buddyFound)
            {
                buddyMsg(((('<font color="#E23125">' + n) + " must be on your friend list before you can send him/her private messages. Type '/add [username]' to add someone to your list.") + "</font>"));
            };
        }

        private static function onPrivateMessageHandler(evt:SFSEvent):void
        {
            var nameU:String;
            var messageSplit:Array = evt.params.message.split("!!&&!!", 2);
            nameU = messageSplit[0];
            if (nameU != userName)
            {
                buddyMsg((((('<font color="#8C4FA1"> From [' + nameU) + "]: ") + messageSplit[1]) + "</font>"));
            };
        }

        public static function blockBuddy(n:String, b:Boolean):void
        {
            var bf:*;
            var buddy:Object;
            var foundBuddy:Boolean;
            for (bf in fox.buddyList)
            {
                buddy = fox.buddyList[bf];
                if (buddy.name == n)
                {
                    foundBuddy = true;
                    byPassNotice = true;
                    fox.setBuddyBlockStatus(n, b);
                };
            };
            if (!foundBuddy)
            {
                buddyMsg(((('<font color="#4F6B47">' + n) + " must be in your friend list for you to block them. Type '/add [username]' to add someone to your list.") + "</font>"));
            }
            else
            {
                if (b)
                {
                    buddyMsg(((('<font color="#4F6B47">' + n) + " has been blocked.") + "</font>"));
                }
                else
                {
                    buddyMsg(((('<font color="#4F6B47">' + n) + " has been unblocked.") + "</font>"));
                };
            };
        }

        private static function onBuddyListUpdateHandler(evt:SFSEvent):void
        {
            var buddy:Object;
            var name:String;
            var status:String;
            var buddyInfo:String;
            var finalBuddyInfo:String;
            if (!byPassNotice)
            {
                buddy = evt.params.buddy;
                name = buddy.name;
                status = ((buddy.isOnline) ? "on." : "off.");
                buddyInfo = String(((name + " has just logged ") + status));
                if (buddy.isOnline)
                {
                    finalBuddyInfo = (('<font color="#A1F056">' + buddyInfo) + "</font>");
                }
                else
                {
                    finalBuddyInfo = (('<font color="#E23125">' + buddyInfo) + "</font>");
                };
                if (buddyMsg != null)
                {
                    buddyMsg(finalBuddyInfo);
                };
            }
            else
            {
                byPassNotice = false;
            };
        }

        private static function roomListLobbyLog(e:SFSEvent=null):void
        {
            foxRoom("MLX_6_Lobby");
            roomList = e.params.roomList;
            fox.removeEventListener(SFSEvent.onRoomListUpdate, roomListLobbyLog);
        }

        public static function reLobby():void
        {
            fox.addEventListener(SFSEvent.onRoomListUpdate, roomListLobbyLog, false, 0, true);
        }

        private static function roomListHandlerLogin(e:SFSEvent):void
        {
            fox.removeEventListener(SFSEvent.onRoomListUpdate, roomListHandlerLogin);
            roomList = e.params.roomList;
            fox.joinRoom("MLX_6_Lobby");
            fox.addEventListener(SFSEvent.onJoinRoom, joinRoomHandler, false, 0, true);
            fox.addEventListener(SFSEvent.onUserEnterRoom, userJoinedRoom, false, 0, true);
            fox.addEventListener(SFSEvent.onUserLeaveRoom, userLeftRoom, false, 0, true);
        }

        private static function joinRoomHandler(e:SFSEvent=null):void
        {
            var sendA:Array;
            var i:*;
            var user:User;
            var obj:Object = new Object();
            obj.rank = userData.rank;
            obj.gamesPlayed = userData.gamesPlayed;
            fox.setUserVariables(obj);
            updateUserList();
            if (justMade)
            {
                justMade = false;
                sendA = new Array();
                for (i in userList)
                {
                    if ((userList[i] is User))
                    {
                        user = userList[i];
                        sendA.push({
                            "name":user.getName(),
                            "id":user.getId()
                        });
                    };
                };
                reacher.updateCList_Join(sendA, userName);
            };
        }

        private static function userJoinedRoom(e:SFSEvent=null):void
        {
            var sendA:Array;
            var i:*;
            var user:User;
            updateUserList();
            if (reacher.gameRoomMode)
            {
                sendA = new Array();
                for (i in userList)
                {
                    if ((userList[i] is User))
                    {
                        user = userList[i];
                        sendA.push({
                            "name":user.getName(),
                            "id":user.getId()
                        });
                    };
                };
                reacher.updateCList_Join(sendA, e.params.user.getName());
            };
        }

        private static function userLeftRoom(e:SFSEvent=null):void
        {
            var sendA:Array;
            var i:*;
            var user:User;
            updateUserList();
            if (reacher.gameRoomMode)
            {
                sendA = new Array();
                for (i in userList)
                {
                    if ((userList[i] is User))
                    {
                        user = userList[i];
                        sendA.push({
                            "name":user.getName(),
                            "id":user.getId()
                        });
                    };
                };
                reacher.updateCList_Leave(sendA, e.params.userId);
            };
        }

        private static function updateUserList(e:SFSEvent=null):void
        {
            var i:*;
            roomObj = fox.getRoom(fox.activeRoomId);
            userList = roomObj.getUserList();
            var userNameList:Array = new Array();
            for (i in userList)
            {
                userNameList.push(userList[i].getName());
            };
            reacher.listUsers(userNameList);
        }

        private static function obRec(e:SFSEvent):void
        {
            var o:Object;
            var obj:Object;
            var player:*;
            o = e.params.obj.sub;
            var oid:String = e.params.obj.id;
            switch (oid)
            {
                case "chat":
                    break;
                case "getKicked":
                    reacher.kickHandlerFox();
                    break;
                case "requestStats":
                    obj = {};
                    obj.r = userData.rank;
                    obj.gp = userData.gamesPlayed;
                    sendOff(obj, false, "sendStats", o.requester);
                    break;
                case "sendStats":
                    reacher.showStats(o.r, o.gp, e.params.sender.getName());
                    break;
                case "updateTeamDisplay":
                    reacher.updateDBOXinGame(o.array);
                    break;
                case "beginGame":
                    userList = roomObj.getUserList();
                    reacher.foxBeginGame(o.arrayId, o.arrayPos, o.randName);
                    break;
                case "updateIncome":
                    player = ROOT.GameKon[("player" + o.pos)];
                    player.setIncome(o.race);
                    break;
                case "updateBuilding":
                    break;
                case "createUnit":
                    break;
                case "killUnit":
                    ROOT.killUnitReal(o.p, o.id, o.ran);
                    break;
                case "orderUnit":
                    gameKon.doUnitOption(o.id, o.orderArray);
                    break;
                case "createMissile":
                    break;
                case "sendChat":
                    ROOT.gogoChat(o.i, o.t);
                    break;
                case "sendExit":
                    break;
                case "sendUpdate":
                    ROOT.OPFunction();
                    break;
                case "sendOption":
                    break;
            };
        }

        public static function sendOpt(v:Object):void
        {
            var vars:Object = new Object();
            vars.option = v.option;
            vars.pos = v.pos;
            vars.body = v.body;
            vars.cmd = v.cmd;
            fox.sendXtMessage("exRoom2", "m", vars);
        }

        private static function repEx(evt:SFSEvent):void
        {
            var _local_3:Object;
            var extType:String;
            var roomId:String;
            var optionId:Number;
            var pos:uint;
            var callCommand:uint;
            var option:Object;
            var player:*;
            var def:Number;
            var cArDef:Array;
            var nhj:*;
            var traceBuild:*;
            var cancelOrder:Boolean;
            var auto:Boolean;
            var unitIdStarter:Number;
            var q:*;
            var randTot:String;
            var randArray:Array;
            var vah2:Object;
            var o:* = evt.params.dataObj;
            extType = o[0];
            roomId = o[1];
            optionId = Number(o[2]);
            pos = uint(Number(o[3]));
            callCommand = uint(Number(o[4]));
            option = optionData.LIST[optionId];
            player = ROOT.GameKon[("player" + pos)];
            if (callCommand == 0)
            {
                traceBuild = gameKon.buildingArray[Number(o[5])];
                cancelOrder = Boolean(Number(o[6]));
                auto = Boolean(Number(o[7]));
                gameKon.doOption(option, cancelOrder, auto, player, traceBuild, true);
            }
            else
            {
                if (callCommand == 1)
                {
                    unitIdStarter = Number(o[5]);
                    unitKon.setThisId(player, unitIdStarter);
                    if (((!(player == gameKon.playerNow)) && (!(player.CPUMODE))))
                    {
                        player.addRes(0, -(option[0]));
                        player.addRes(1, -(option[1]));
                        player.addRes(2, -(option[2]));
                        player.addRes(3, -(option[4]));
                        player.stock[option.stockReq]--;
                    };
                    for (q in option.buildUnits)
                    {
                        randTot = o[(6 + q)];
                        randArray = randTot.split("A");
                        unitKon.addUnit(player, option.buildUnits[q], false, unitKon.getNewId(player), (Number(randArray[0]) / 1000), (Number(randArray[1]) / 1000), (Number(randArray[2]) / 1000));
                    };
                }
                else
                {
                    if (callCommand == 2)
                    {
                        if (((!(player == gameKon.playerNow)) && (!(player.CPUMODE))))
                        {
                            player.addRes(0, -(option[0]));
                            player.addRes(1, -(option[1]));
                            player.addRes(2, -(option[2]));
                            player.addRes(3, -(option[4]));
                            player.stock[option.stockReq]--;
                        };
                        unitKon.addMissile(o[5], Number(o[6]), Number(o[7]));
                    };
                };
            };
            def = 0;
            cArDef = new Array(player.r_m, player.r_p, player.r_e, player.r_i);
            for (nhj in cArDef)
            {
                if (cArDef[nhj] < 0)
                {
                    def = (def - cArDef[nhj]);
                };
            };
            if (((def > yugoSlav) && (!(player.CPUMODE))))
            {
                ROOT.cabinet(player, s);
                vah2 = {};
                vah2.p = player.POS;
                fox.sendXtMessage("exRoom2", "h", vah2);
            };
        }

        public static function justJoined():void
        {
            justJoin = true;
            fox.addEventListener(SFSEvent.onJoinRoom, secondJoinFunction, false, 0, true);
        }

        private static function secondJoinFunction(e:SFSEvent=null):void
        {
            var i:*;
            fox.removeEventListener(SFSEvent.onJoinRoom, secondJoinFunction);
            roomObj = fox.getRoom(fox.activeRoomId);
            var v:Array = roomObj.getVariables();
            for (i in v)
            {
                switch (i)
                {
                    case "gs":
                        reacher.gameSet = v[i];
                        reacher.m3.gameSetting.gotoAndStop((v[i] + 1));
                        break;
                    case "roomLeader":
                        reacher.roomLeader = v[i];
                        break;
                    case "randomFactor":
                        break;
                    case "gameStart":
                        if (v[i])
                        {
                            breakFunction();
                        };
                        break;
                };
            };
        }

        private static function breakFunction():void
        {
            reacher.quitGameRoom();
            dataTracer.throwError("The game has already begun.");
        }

        private static function swapId(p:String):void
        {
            dataTracer.DC(p);
        }

        public static function doConnect(a:String):void
        {
            if (foxMode)
            {
                fox = new SmartFoxClient(false);
                fox.connect("127.0.0.1", 25565);
                justJoin = false;
            }
            else
            {
                SocketManager.connect(a);
                socket = SocketManager.socket;
            };
        }

        public static function createGameRoom(a:String="Game"):void
        {
            foxGRName = a;
            fox.getRoomList();
            fox.addEventListener(SFSEvent.onRoomListUpdate, makeGameRoom, false, 0, true);
        }

        public static function fetchRoomList():void
        {
            updateRoomArray();
        }

        private static function updateRoomArray():void
        {
            var i:*;
            var roomObj2:*;
            var v:Array;
            roomList = fox.getAllRooms();
            var rArr:Array = new Array();
            for (i in roomList)
            {
                roomObj2 = roomList[i];
                v = roomObj2.getVariables();
                if (!v["gameStart"])
                {
                    rArr.push({
                        "name":roomList[i].getName(),
                        "members":roomList[i].getUserCount()
                    });
                };
            };
            reacher.refreshRoomListConnect(rArr);
        }

        private static function makeGameRoom(e:SFSEvent=null):void
        {
            var i:*;
            fox.removeEventListener(SFSEvent.onRoomListUpdate, makeGameRoom);
            roomList = e.params.roomList;
            var roomCheck:Boolean = true;
            for (i in roomList)
            {
                if (roomList[i].getName() == foxGRName)
                {
                    roomCheck = false;
                };
            };
            if (foxGRName == "MLX_7_")
            {
                roomCheck = false;
            };
            if (foxGRName == "MLX_7_ ")
            {
                roomCheck = false;
            };
            if (roomCheck)
            {
                justMade = true;
                foxRoom(foxGRName);
                reacher.roomMaster = true;
                reacher.gameRoomMode = true;
                reacher.resetCB();
                fox.addEventListener(SFSEvent.onJoinRoom, setRoomVar, false, 0, true);
            }
            else
            {
                dataTracer.throwError("Error: Room Exists or name is blank.");
            };
        }

        private static function setRoomVar(e:SFSEvent=null):void
        {
            reacher.foxGameRoom();
            fox.removeEventListener(SFSEvent.onJoinRoom, setRoomVar);
        }

        public static function foxRoom(r:String, overRide:Boolean=false):void
        {
            var i:*;
            var roomObj:Object;
            var xt:*;
            var foundRoom:Boolean;
            if (overRide)
            {
                foundRoom = true;
            };
            for (i in roomList)
            {
                if (roomList[i].getName() == r)
                {
                    foundRoom = true;
                };
            };
            if (foundRoom)
            {
                fox.joinRoom(r);
                ROOT.auth = false;
            }
            else
            {
                roomObj = new Object();
                roomObj.name = r;
                roomObj.maxUsers = 4;
                roomObj.maxSpectators = 4;
                roomObj.isGame = true;
                roomObj.isTemp = true;
                xt = {};
                xt.name = "exRoom2";
                xt.script = "colonyExRoom.as";
                roomObj.extension = xt;
                fox.createRoom(roomObj);
                ROOT.auth = true;
            };
        }

        private static function translateString(a:String):String
        {
            switch (a)
            {
                case _e.RECEIVE_SOCKET_ID:
                    return (SFSEvent.onConnection);
            };
            return (a);
        }

        private static function DC(e:SFSEvent=null):void
        {
            dataTracer.DC("You have been disconnected :(");
        }

        private static function foxSend(a:Object, b:String, c:Boolean=false):void
        {
            var vars:Object = new Object();
            vars.sub = a;
            vars.id = b;
            fox.sendObject(vars);
            if (c)
            {
                fox.sendObjectToGroup(vars, [fox.myUserId]);
            };
        }

        public static function close():void
        {
            if (foxMode)
            {
                fox.disconnect();
            }
            else
            {
                SocketManager.close();
            };
        }

        public static function switchToGameMode():void
        {
            fox.removeEventListener(SFSEvent.onJoinRoom, joinRoomHandler);
            fox.removeEventListener(SFSEvent.onUserEnterRoom, userJoinedRoom);
            fox.removeEventListener(SFSEvent.onUserLeaveRoom, userLeftRoom);
            fox.addEventListener(SFSEvent.onUserLeaveRoom, userLeftInGame, false, 0, true);
        }

        public static function switchToLobbyMode():void
        {
            fox.addEventListener(SFSEvent.onJoinRoom, joinRoomHandler, false, 0, true);
            fox.addEventListener(SFSEvent.onUserEnterRoom, userJoinedRoom, false, 0, true);
            fox.addEventListener(SFSEvent.onUserLeaveRoom, userLeftRoom, false, 0, true);
            fox.removeEventListener(SFSEvent.onUserLeaveRoom, userLeftInGame);
        }

        private static function userLeftInGame(e:SFSEvent=null):void
        {
            if (gameBegun)
            {
                ROOT.userLeftHandlerFox(e.params.userId);
            };
        }

        public static function createGameProcess(a:String):void
        {
            foxRoom("MLX_6_Limbo");
            roomSaveTrans = a;
            eventOverride = false;
            fox.addEventListener(SFSEvent.onJoinRoom, eventPhase2, false, 0, true);
        }

        public static function beginGameProcess(a:String):void
        {
            roomSaveTrans = a;
            eventOverride = true;
            eventTimer();
        }

        private static function eventTimer(e:SFSEvent=null):void
        {
            T.reset();
            T.start();
            T.addEventListener(TimerEvent.TIMER, eventPhase3, false, 0, true);
        }

        private static function eventPhase3(e:*=null):void
        {
            fox.getRoomList();
            T.removeEventListener(TimerEvent.TIMER, eventPhase3);
            fox.addEventListener(SFSEvent.onRoomListUpdate, eventPhase2, false, 0, true);
            eventOverride = true;
        }

        private static function eventPhase2(e:*=null):void
        {
            var subSt:String;
            if (eventOverride)
            {
                roomList = e.params.roomList;
                eventOverride = false;
                fox.removeEventListener(SFSEvent.onRoomListUpdate, eventPhase2);
                subSt = roomSaveTrans.substr(0, 20);
                fox.joinRoom(subSt);
                fox.addEventListener(SFSEvent.onJoinRoom, doneJoining, false, 0, true);
                T.addEventListener(TimerEvent.TIMER, rejoinRoom, false, 0, true);
            }
            else
            {
                fox.removeEventListener(SFSEvent.onJoinRoom, eventPhase2);
                foxRoom(roomSaveTrans);
            };
        }

        private static function doneJoining(e:*=null):void
        {
            T.removeEventListener(TimerEvent.TIMER, rejoinRoom);
            fox.removeEventListener(SFSEvent.onJoinRoom, doneJoining);
        }

        private static function rejoinRoom(e:*=null):void
        {
            foxRoom(roomSaveTrans, true);
        }


    }
}//package 

