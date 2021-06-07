// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//MultiplayerScreen

package 
{
    import flash.display.MovieClip;
    import com.jiggmin.blossomSocket.BlossomSocket;
    import com.jiggmin.blossomSocket.BlossomRoom;
    import flash.utils.Timer;
    import flash.display.Stage;
    import flash.events.TimerEvent;
    import flash.events.MouseEvent;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import com.jiggmin.data.Data;
    import com.jiggmin.blossomSocket.BlossomEvent;
    import it.gotoandplay.smartfoxserver.*;

    public class MultiplayerScreen extends MovieClip 
    {

        public var gameRoomMode:Boolean = false;
        private var lastBox:*;
        private var socket:BlossomSocket;
        public var roomMaster:Boolean;
        private var lobbyRoom:BlossomRoom;
        private var room:BlossomRoom;
        private var m:MultiplayerScreenGraphic;
        private var m2:MultiplayerMakeGraphic;
        public var m3:MultiplayerRoomGraphic;
        private var justClosed:Boolean;
        private var eSend:Object = new Object();
        private var rankedMatch:Boolean = false;
        private var roomSearch:BlossomRoom;
        public var roomLeader:uint;
        private var normalRoom:String;
        public var gameSet:uint = 0;
        private var c_buildUp:uint;
        private var c_buildUpMax:uint = 8;
        private var c_countDown:uint;
        private var c_countDownSmall:uint;
        private var c_timer:Timer;
        private var messageArray:Array = new Array();
        private var maxMessages:int = 40;
        private var userName:String;
        private var team:uint;
        private var color:uint;
        private var timerRefresh:Timer;
        private var timerRefreshUser:Timer;
        private var cBoxArray:Array;
        private var dBoxArray:Array;
        private var rBoxArray:Array;
        private var STAGE:Stage;
        public var foxRooms:Array;

        public function MultiplayerScreen(userName:String, team:uint, color:uint, userData:Object, s:Stage, n:String, usr:uint):void
        {
            var hg:*;
            super();
            if (mpKon.foxMode)
            {
                mpKon.reacher = this;
            };
            normalRoom = n;
            STAGE = s;
            c_timer = new Timer(1000);
            c_timer.start();
            c_timer.addEventListener(TimerEvent.TIMER, chatSpamHand, false, 0, true);
            c_buildUp = 0;
            c_countDown = 0;
            c_countDownSmall = 0;
            gameSet = 0;
            timerRefresh = new Timer(2000);
            timerRefresh.start();
            timerRefreshUser = new Timer(10000);
            timerRefreshUser.start();
            timerRefresh.addEventListener(TimerEvent.TIMER, refreshRoomList, false, 0, true);
            rankedMatch = false;
            mpKon.userData = userData;
            this.userName = userName;
            this.team = team;
            this.color = color;
            roomMaster = false;
            justClosed = false;
            m = new MultiplayerScreenGraphic();
            m2 = new MultiplayerMakeGraphic();
            m3 = new MultiplayerRoomGraphic();
            addChild(m);
            m.s_gplayed.text = userData.gamesPlayed;
            m.s_gwon.text = userData.gamesWon;
            m.s_cwins.text = userData.gamesConsecutiveWins;
            m.s_rank.text = userData.rank;
            m.ranker.gotoAndStop(userData.rank);
            if (userData.gamesPlayed > 0)
            {
                m.s_wratio.text = new String((Math.round(((100 * userData.gamesWon) / userData.gamesPlayed)) + "%"));
            };
            cBoxArray = new Array(m3.c1, m3.c2, m3.c3, m3.c4);
            dBoxArray = new Array(m3.d1, m3.d2, m3.d3, m3.d4);
            rBoxArray = new Array(m3.ranker_1, m3.ranker_2, m3.ranker_3, m3.ranker_4);
            mpKon.eventSub(_e.RECEIVE_MESSAGE, msgHandler);
            var userVars:Object = new Object();
            userVars.userName = userName;
            userVars.team = team;
            userVars.color = color;
            mpKon.setUserVars(userVars);
            mpKon.setUserVars(userData);
            if (mpKon.zoneIn)
            {
                mpKon.foxZone();
            }
            else
            {
                mpKon.switchToLobbyMode();
                mpKon.fox.getRoomList();
                mpKon.reLobby();
            };
            normalRoom = "Lobby";
            mpKon.buddyMsg = buddyMsg;
            m.bt_buddyList.addEventListener(MouseEvent.CLICK, buddyList, false, 0, true);
            m.exitButton.addEventListener(MouseEvent.CLICK, clickExitHandler, false, 0, true);
            m.createGameButton.addEventListener(MouseEvent.CLICK, clickCreateGameHandler, false, 0, true);
            m.joinGameButton.addEventListener(MouseEvent.CLICK, clickJoinGameHandler, false, 0, true);
            m2.backLobby.addEventListener(MouseEvent.CLICK, backLobbyHandler, false, 0, true);
            m3.backLobby.addEventListener(MouseEvent.CLICK, backLobbyHandler2, false, 0, true);
            m3.startGame.addEventListener(MouseEvent.CLICK, startGameHandler, false, 0, true);
            m.chatSend.addEventListener(KeyboardEvent.KEY_DOWN, keyInput, false, 0, true);
            m3.chatSend.addEventListener(KeyboardEvent.KEY_DOWN, keyInput, false, 0, true);
            m.roomBox.addEventListener(Event.CLOSE, beginRoomSwitch, false, 0, true);
            m.raceButton.addEventListener(MouseEvent.CLICK, changeRace, false, 0, true);
            m2.setChange.addEventListener(MouseEvent.CLICK, changeSet, false, 0, true);
            gameRoomMode = false;
            m.racePlate.gotoAndStop((usr + 1));
            var nCyAr:Array = new Array("Lobby", "Team Channel");
            foxRooms = ["MLX_6_Lobby", "MLX_6_Team_Channel"];
            for (hg in nCyAr)
            {
                if (normalRoom == nCyAr[hg])
                {
                    m.roomBox.selectedIndex = hg;
                };
            };
        }

        private function buddyList(me:MouseEvent=null):*
        {
        }

        private function changeSet(me:MouseEvent):void
        {
            gameSet++;
            if (gameSet > 5)
            {
                gameSet = 0;
            };
            m2.gameSetting.gotoAndStop((gameSet + 1));
            m3.gameSetting.gotoAndStop((gameSet + 1));
        }

        private function changeRace(me:MouseEvent):void
        {
            MovieClip(parent).userRace++;
            if (MovieClip(parent).userRace > 3)
            {
                MovieClip(parent).userRace = 0;
            };
            MovieClip(parent).userData.race = MovieClip(parent).userRace;
            m.racePlate.gotoAndStop((MovieClip(parent).userRace + 1));
        }

        private function beginRoomSwitch(e:Event):void
        {
            m.addEventListener(Event.ENTER_FRAME, changeRooms, false, 0, true);
        }

        private function changeRooms(e:Event):void
        {
            var rankST:String;
            m.removeEventListener(Event.ENTER_FRAME, changeRooms);
            if (normalRoom != m.roomBox.selectedLabel)
            {
                normalRoom = m.roomBox.selectedLabel;
                mpKon.foxRoom(foxRooms[m.roomBox.selectedIndex]);
                rankST = ((('<font color="#4F6B47">' + "Now joining chat channel: ") + normalRoom) + "</font>");
                addMessage(rankST);
            };
        }

        private function refreshUserList(te:TimerEvent):*
        {
            listUsers();
        }

        private function refreshRoomList(te:TimerEvent):*
        {
            mpKon.fetchRoomList();
        }

        public function refreshRoomListConnect(a:Array):void
        {
            var i:int;
            var room:Object;
            var selStore:String;
            var theLabel:String;
            var roomArray:Array = a;
            var len:int = roomArray.length;
            var g:int;
            if (m.theList.selectedItem != null)
            {
                selStore = m.theList.selectedItem.data;
            }
            else
            {
                selStore = "MLX_6_Lobby";
            };
            m.theList.removeAll();
            i = 0;
            while (i < len)
            {
                room = roomArray[i];
                if (((room.members < 4) && (true)))
                {
                    if (room.name.indexOf("MLX_7_") == 0)
                    {
                        if ((((room.name.indexOf("GameStartX_$") == -1) && (room.name.indexOf("MLX_6_") == -1)) && (room.name.indexOf("MLX_6_") == -1)))
                        {
                            if (room.name.indexOf("GS£_") == -1)
                            {
                                if (room.name.indexOf("GSearchXCV_$") == -1)
                                {
                                    theLabel = ((("[" + room.members) + "/4] ") + room.name.replace("MLX_7_", ""));
                                    m.theList.addItem({
                                        "label":theLabel,
                                        "data":room.name
                                    });
                                    g++;
                                    if (selStore == room.name)
                                    {
                                        m.theList.selectedIndex = (g - 1);
                                    };
                                };
                            };
                        };
                    };
                };
                i++;
            };
        }

        private function rankMatchSit(e:MouseEvent):void
        {
            dataTracer.throwError("This feature isn't available on this server.");
        }

        private function stopLooking(e:chatEvent):void
        {
        }

        private function runChatScript(caseString:uint, caseStringSub:uint, errorString:String, chatRef:*):void
        {
            var j:*;
            var i:*;
            var regExNew:RegExp;
            var tName:String;
            var rankST:String;
            var foundTheGuy:Boolean;
            var subArray:Array = new Array();
            var foxOverride:Boolean;
            var uNameRank:String = chatRef.chatSend.text.substr(caseStringSub);
            for (j in mpKon.userList)
            {
                subArray.push({
                    "n":mpKon.userList[j].getName(),
                    "id":mpKon.userList[j].getId()
                });
            };
            if (caseString > 1)
            {
                foundTheGuy = true;
                switch (caseString)
                {
                    case 2:
                        mpKon.fox.addBuddy(uNameRank);
                        rankST = (((('<font color="#1C65CC">' + "Added ") + uNameRank) + " to your friend list.") + "</font>");
                        break;
                    case 3:
                        mpKon.fox.removeBuddy(uNameRank);
                        rankST = (((('<font color="#1C65CC">' + "Removed ") + uNameRank) + " from your friend list.") + "</font>");
                        break;
                };
            }
            else
            {
                for (i in subArray)
                {
                    regExNew = new RegExp(uNameRank, "i");
                    tName = subArray[i].n;
                    if (regExNew.test(tName))
                    {
                        if (((uNameRank.length == tName.length) && (tName.indexOf("Guest_") == -1)))
                        {
                            foundTheGuy = true;
                            switch (caseString)
                            {
                                case 0:
                                    mpKon.sendOff({"requester":mpKon.fox.myUserId}, false, "requestStats", subArray[i].id);
                                    foxOverride = true;
                                    foundTheGuy = false;
                                    break;
                                case 1:
                                    rankST = (((('<font color="#4F6B47">' + "Kicked ") + tName) + " from the game.") + "</font>");
                                    mpKon.sendOff(null, false, "getKicked", subArray[i].id);
                                    break;
                            };
                        };
                    };
                };
            };
            chatRef.chatSend.text = "";
            if (!foundTheGuy)
            {
                if (!foxOverride)
                {
                    addMessage((('<font color="#4F6B47">' + errorString) + "</font>"));
                };
            }
            else
            {
                addMessage(rankST);
            };
        }

        private function showBuddyInfo():void
        {
            var bf:*;
            var buddy:Object;
            var onMode:String;
            if (mpKon.fox.buddyList.length == 0)
            {
                addMessage((('<font color="#4F6B47">' + "Your friend list is empty.") + "</font>"));
            }
            else
            {
                for (bf in mpKon.fox.buddyList)
                {
                    buddy = mpKon.fox.buddyList[bf];
                    if (buddy.isBlocked)
                    {
                        addMessage(((('<font color="#FFFFFF">' + buddy.name) + " is blocked.") + "</font>"));
                    }
                    else
                    {
                        if (buddy.isOnline)
                        {
                            onMode = "online.";
                            addMessage((((('<font color="#A1F056">' + buddy.name) + " is ") + onMode) + "</font>"));
                        }
                        else
                        {
                            onMode = "offline.";
                            addMessage((((('<font color="#E23125">' + buddy.name) + " is ") + onMode) + "</font>"));
                        };
                    };
                };
            };
        }

        private function buddyMsg(s:String):void
        {
            addMessage(s);
        }

        public function showStats(a:uint, b:uint, c:String):void
        {
            addMessage(((((((('<font color="#4F6B47">' + c) + "'s Rank: ") + a) + ". Games played: ") + b) + ".") + "</font>"));
        }

        public function whisperBuddy():void
        {
        }

        private function keyInput(ke:KeyboardEvent):void
        {
            var chatRef:*;
            var subber:Array;
            var tt:String;
            var nextString:String;
            if (ke.keyCode == 13)
            {
                if (gameRoomMode)
                {
                    chatRef = m3;
                }
                else
                {
                    chatRef = m;
                };
                if (chatRef.chatSend.text.indexOf("/stats") == 0)
                {
                    runChatScript(0, 7, "Sorry, I couldn't find a user with that name in this room.", chatRef);
                }
                else
                {
                    if (chatRef.chatSend.text.indexOf("/add") == 0)
                    {
                        runChatScript(2, 5, "??", chatRef);
                    }
                    else
                    {
                        if (chatRef.chatSend.text.indexOf("/remove") == 0)
                        {
                            runChatScript(3, 8, "??", chatRef);
                        }
                        else
                        {
                            if (chatRef.chatSend.text.indexOf("/block") == 0)
                            {
                                mpKon.blockBuddy(chatRef.chatSend.text.substr(7), true);
                                chatRef.chatSend.text = "";
                            }
                            else
                            {
                                if (chatRef.chatSend.text.indexOf("/unblock") == 0)
                                {
                                    mpKon.blockBuddy(chatRef.chatSend.text.substr(9), false);
                                    chatRef.chatSend.text = "";
                                }
                                else
                                {
                                    if (chatRef.chatSend.text.indexOf("/w") == 0)
                                    {
                                        subber = chatRef.chatSend.text.split(" ", 3);
                                        if (subber.length < 3)
                                        {
                                            addMessage((('<font color="#4F6B47">' + "Please type a message to send to this user.") + "</font>"));
                                        }
                                        else
                                        {
                                            tt = chatRef.chatSend.text;
                                            nextString = tt.substr((1 + tt.indexOf(" ", 3)));
                                            mpKon.sendWhisper(subber[1], nextString);
                                        };
                                        chatRef.chatSend.text = "";
                                    }
                                    else
                                    {
                                        if (chatRef.chatSend.text.indexOf("/friendlist") == 0)
                                        {
                                            showBuddyInfo();
                                            chatRef.chatSend.text = "";
                                        }
                                        else
                                        {
                                            if (chatRef.chatSend.text.indexOf("/kick") == 0)
                                            {
                                                if (roomMaster)
                                                {
                                                    if (gameRoomMode)
                                                    {
                                                        runChatScript(1, 6, "Sorry, I couldn't find a user with that name in this room.", chatRef);
                                                    }
                                                    else
                                                    {
                                                        addMessage((('<font color="#4F6B47">' + "You are not in a game room, and cannot kick players.") + "</font>"));
                                                    };
                                                }
                                                else
                                                {
                                                    addMessage((('<font color="#4F6B47">' + "You are not the room master, and cannot kick players.") + "</font>"));
                                                };
                                                chatRef.chatSend.text = "";
                                            }
                                            else
                                            {
                                                if (((userName.indexOf("guest_") == -1) && (userName == "")))
                                                {
                                                    if (c_countDown == 0)
                                                    {
                                                        sendMessage();
                                                        c_justSent();
                                                    }
                                                    else
                                                    {
                                                        chatRef.chatSend.text = "";
                                                        addMessage((('<font color="#4F6B47">' + "You have sent too many messages. You may not send another message for 60 seconds.") + "</font>"));
                                                    };
                                                }
                                                else
                                                {
                                                        sendMessage();
                                                        c_justSent();
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        private function sendMessage():void
        {
            var chatRef:*;
            var message:String;
            if (gameRoomMode)
            {
                chatRef = m3;
            }
            else
            {
                chatRef = m;
            };
            if (chatRef.chatSend.text != "")
            {
                message = chatRef.chatSend.text;
                chatRef.chatSend.text = "";
                mpKon.sendMsg(message);
            };
        }

        private function addSystemMessage(message:String):void
        {
            message = (("#<i>" + message) + "</i>");
            addMessage(message);
        }

        private function addMessage(str:String):void
        {
            messageArray.push(str);
            if (messageArray.length > maxMessages)
            {
                messageArray.shift();
            };
            showMessages();
        }

        private function showMessages():void
        {
            var chatRef:*;
            var str:String = messageArray.join("<br/>");
            if (gameRoomMode)
            {
                chatRef = m3;
            }
            else
            {
                chatRef = m;
            };
            chatRef.chatBox.htmlText = str;
            chatRef.chatBox.scrollV = chatRef.chatBox.maxScrollV;
            chatRef.scr_1.update();
        }

        private function clearMessages():void
        {
            messageArray = new Array();
            showMessages();
        }

        public function receiveChatHandler(be:BlossomEvent=null, a:String="", b:String=""):void
        {
            var message:String;
            var htmlName:String;
            var str:String;
            var chatSub:String = a;
            var nameSub:String = b;
            if (checkNameNormal(nameSub))
            {
                message = Data.filterSwearing(chatSub);
                if (message.length < 200)
                {
                    message = message.replace(/>/gi, "&gt;");
                    message = message.replace(/</gi, "&lt;");
                    htmlName = ((('<font color="#2B3C55">' + nameSub) + ": ") + "</font>");
                    str = (htmlName + message);
                    addMessage(str);
                };
            };
        }

        private function checkNameNormal(a:String):Boolean
        {
            var o:Object;
            var regEXP:RegExp = /([0-9a-zA-Z])/;
            var cahL:int = a.length;
            var nuller:Boolean;
            var nn:* = 0;
            while (nn < cahL)
            {
                o = regEXP.exec(a.charAt(nn));
                if (o == null)
                {
                    nuller = true;
                };
                nn++;
            };
            if (nuller)
            {
                return (true);
            };
            return (true);
        }

        public function updateCList_Join(a:Array, b:*):void
        {
            var addNew:Boolean;
            var added:Boolean;
            var saveIndex:uint;
            var j:*;
            var indexBefore:*;
            var labelBefore:*;
            var i:uint;
            var v:*;
            if (((gameRoomMode) && (roomMaster)))
            {
                addNew = false;
                added = false;
                for (j in cBoxArray)
                {
                    indexBefore = cBoxArray[j].selectedIndex;
                    labelBefore = cBoxArray[j].selectedLabel;
                    addNew = false;
                    if (cBoxArray[j].selectedLabel == "None")
                    {
                        addNew = true;
                    };
                    cBoxArray[j].removeAll();
                    cBoxArray[j].addItem({
                        "label":"None",
                        "data":"NONE"
                    });
                    cBoxArray[j].addItem({
                        "label":"Easy CPU",
                        "data":"COMPUTER1"
                    });
                    cBoxArray[j].addItem({
                        "label":"Normal CPU",
                        "data":"COMPUTER2"
                    });
                    cBoxArray[j].addItem({
                        "label":"Hard CPU",
                        "data":"COMPUTER3"
                    });
                    i = 4;
                    for (v in a)
                    {
                        cBoxArray[j].addItem({
                            "label":a[v].name,
                            "data":a[v].id
                        });
                        if (addNew)
                        {
                            if (a[v].name == b)
                            {
                                saveIndex = i;
                            };
                        }
                        else
                        {
                            if (a[v].name == labelBefore)
                            {
                                saveIndex = i;
                            };
                        };
                        i++;
                    };
                    if (((!(addNew)) || (added)))
                    {
                        if (indexBefore < 2)
                        {
                            cBoxArray[j].selectedIndex = indexBefore;
                        }
                        else
                        {
                            cBoxArray[j].selectedIndex = saveIndex;
                        };
                    }
                    else
                    {
                        cBoxArray[j].selectedIndex = saveIndex;
                        added = true;
                    };
                };
                m3.addEventListener(Event.ENTER_FRAME, upTeamHand, false, 0, true);
            };
        }

        public function updateCList_Leave(a:Array, b:*):void
        {
            var j:*;
            var labelBefore:*;
            var v:*;
            var e:*;
            if (((gameRoomMode) && (roomMaster)))
            {
                for (j in cBoxArray)
                {
                    labelBefore = cBoxArray[j].selectedLabel;
                    cBoxArray[j].removeAll();
                    cBoxArray[j].addItem({
                        "label":"None",
                        "data":"NONE"
                    });
                    cBoxArray[j].addItem({
                        "label":"Easy CPU",
                        "data":"COMPUTER1"
                    });
                    cBoxArray[j].addItem({
                        "label":"Normal CPU",
                        "data":"COMPUTER2"
                    });
                    cBoxArray[j].addItem({
                        "label":"Hard CPU",
                        "data":"COMPUTER3"
                    });
                    for (v in a)
                    {
                        cBoxArray[j].addItem({
                            "label":a[v].name,
                            "data":a[v].id
                        });
                    };
                    cBoxArray[j].selectedIndex = 0;
                    e = 0;
                    while (e < cBoxArray[j].length)
                    {
                        if (cBoxArray[j].getItemAt(e).label == labelBefore)
                        {
                            cBoxArray[j].selectedIndex = e;
                        };
                        e++;
                    };
                };
                m3.addEventListener(Event.ENTER_FRAME, upTeamHand, false, 0, true);
            }
            else
            {
                if (b == roomLeader)
                {
                    dataTracer.throwError("The Creator has left the game.");
                    quitGameRoom();
                };
            };
        }

        public function listUsers(a:Array=null):void
        {
            var i:*;
            var txt:String = "";
            var subArray:Array = new Array();
            for (i in a)
            {
                txt = (txt + (a[i] + "\n"));
            };
            if (gameRoomMode)
            {
                m3.textBox.text = txt;
            }
            else
            {
                m.textBox.text = txt;
            };
            m.scr_2.update();
        }

        private function clickCreateGameHandler(me:MouseEvent):void
        {
            removeChild(m);
            addChild(m2);
            m2.makeGame.addEventListener(MouseEvent.CLICK, makeGameHandler, false, 0, true);
        }

        private function makeGameHandler(me:MouseEvent):void
        {
            mpKon.createGameRoom(("MLX_7_" + m2.gameName.text));
        }

        public function foxBeginGame(a:Array, b:Array, c:String):void
        {
            var user:*;
            var hisPos:uint;
            var v:*;
            MovieClip(parent).remotePlayerArray = new Array(false, false, false, false);
            MovieClip(parent).allPlayers = new Array();
            var imIn:Boolean;
            var i:int;
            var myPos:int = 1;
            for each (user in mpKon.userList)
            {
                hisPos = 0;
                for (v in a)
                {
                    if (user.getId() == a[v])
                    {
                        hisPos = b[v];
                        if (mpKon.fox.myUserId == a[v])
                        {
                            myPos = hisPos;
                            imIn = true;
                        }
                        else
                        {
                            MovieClip(parent).remotePlayerArray[i] = true;
                        };
                        MovieClip(parent).allPlayers.push({
                            "POS":hisPos,
                            "NAME":user.getName(),
                            "ID":user.getId()
                        });
                    };
                };
                i++;
            };
            for (v in a)
            {
                if (((((a[v] == "NONE") || (a[v] == "COMPUTER1")) || (a[v] == "COMPUTER2")) || (a[v] == "COMPUTER3")))
                {
                    MovieClip(parent).allPlayers.push({
                        "POS":b[v],
                        "NAME":a[v],
                        "ID":0
                    });
                };
            };
            team = MovieClip(parent).userRace;
            MovieClip(parent).roomMaster = roomMaster;
            if (imIn)
            {
                MovieClip(parent).gameSet = gameSet;
                MovieClip(parent).clientPlayer = [team, myPos, color];
                MovieClip(parent).gotoAndStop("Pre", "SCENE");
                MovieClip(parent).roomName = ((("GS£_" + c) + "_") + mpKon.roomObj.getName());
                mpKon.switchToGameMode();
                if (roomMaster)
                {
                    mpKon.createGameProcess(MovieClip(parent).roomName);
                }
                else
                {
                    mpKon.beginGameProcess(MovieClip(parent).roomName);
                };
                remove();
                if (parent != null)
                {
                    parent.removeChild(this);
                };
            }
            else
            {
                quitGameRoom();
            };
        }

        public function quitGameRoom():void
        {
            mpKon.foxRoom(("MLX_6_" + normalRoom));
            removeChild(m3);
            addChild(m);
            gameRoomMode = false;
            clearMessages();
        }

        private function backLobbyHandler(me:MouseEvent):void
        {
            removeChild(m2);
            addChild(m);
        }

        private function backLobbyHandler2(me:MouseEvent):void
        {
            mpKon.foxRoom(("MLX_6_" + normalRoom));
            removeChild(m3);
            addChild(m);
            roomMaster = false;
            gameRoomMode = false;
            clearMessages();
        }

        private function startGameHandler(me:MouseEvent):void
        {
            var i:*;
            var checkID:*;
            var j:*;
            var vars:Object;
            var q:*;
            var letterArr2:Array;
            var bah2:String;
            var goAhead:Boolean = true;
            var teamArray:* = new Array();
            for (i in cBoxArray)
            {
                teamArray.push({
                    "ID":cBoxArray[i].selectedItem.data,
                    "POS":(i + 1)
                });
            };
            for (i in teamArray)
            {
                checkID = teamArray[i].ID;
                for (j in teamArray)
                {
                    if (j != i)
                    {
                        if (checkID == teamArray[j].ID)
                        {
                            if (((((!(checkID == "NONE")) && (!(checkID == "COMPUTER1"))) && (!(checkID == "COMPUTER2"))) && (!(checkID == "COMPUTER3"))))
                            {
                                goAhead = false;
                                dataTracer.throwError("You cannot have the same player in two different slots.");
                            };
                        };
                    };
                };
            };
            if (goAhead)
            {
                vars = new Object();
                vars.arrayId = new Array();
                vars.arrayPos = new Array();
                for (q in teamArray)
                {
                    vars.arrayId.push(teamArray[q].ID);
                    vars.arrayPos.push(teamArray[q].POS);
                };
                letterArr2 = new Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
                bah2 = letterArr2[Math.round((Math.random() * (letterArr2.length - 1)))];
                vars.randName = (("G_" + bah2) + Math.round((Math.random() * 9999)));
                mpKon.sendOff(vars, true, "beginGame");
            };
        }

        public function foxGameRoom():void
        {
            m3.startGame.visible = true;
            clearMessages();
            roomLeader = mpKon.fox.myUserId;
            var roomVar:Array = new Array();
            roomVar.push({
                "name":"roomLeader",
                "val":roomLeader
            });
            roomVar.push({
                "name":"randomFactor",
                "val":(Math.random() * 10)
            });
            roomVar.push({
                "name":"gs",
                "val":gameSet
            });
            roomVar.push({
                "name":"gameStart",
                "val":false
            });
            mpKon.fox.setRoomVariables(roomVar);
            addChild(m3);
        }

        public function resetCB():void
        {
            var j:*;
            var tty:*;
            for (j in cBoxArray)
            {
                cBoxArray[j].visible = true;
                cBoxArray[j].addEventListener(Event.CLOSE, closeBox, false, 0, true);
                cBoxArray[j].removeAll();
                cBoxArray[j].addItem({
                    "label":"None",
                    "data":"NONE"
                });
                cBoxArray[j].addItem({
                    "label":"Easy CPU",
                    "data":"COMPUTER1"
                });
                cBoxArray[j].addItem({
                    "label":"Normal CPU",
                    "data":"COMPUTER2"
                });
                cBoxArray[j].addItem({
                    "label":"Hard CPU",
                    "data":"COMPUTER3"
                });
                cBoxArray[j].selectedIndex = 0;
            };
            for (tty in dBoxArray)
            {
                dBoxArray[tty].n.text = "None";
                rBoxArray[tty].visible = false;
            };
        }

        public function updateDBOXinGame(a:Array):void
        {
            var i:*;
            var foxUsers:Array;
            var u:String;
            var theRank:uint;
            for (i in dBoxArray)
            {
                dBoxArray[i].n.text = a[i];
                rBoxArray[i].visible = false;
                foxUsers = mpKon.roomObj.getUserList();
                for (u in foxUsers)
                {
                    if (a[i] == foxUsers[u].getName())
                    {
                        theRank = foxUsers[u].getVariables()["rank"];
                        if (theRank == 100)
                        {
                            theRank = 0;
                        };
                        if (theRank > 0)
                        {
                            rBoxArray[i].visible = true;
                            rBoxArray[i].gotoAndStop(theRank);
                        };
                    };
                };
            };
        }

        private function closeBox(e:Event):*
        {
            lastBox = e.target;
            justClosed = true;
            m3.addEventListener(Event.ENTER_FRAME, upTeamHand, false, 0, true);
        }

        private function upTeamHand(e:Event):void
        {
            var i:*;
            var theSel:uint;
            var j:*;
            m3.removeEventListener(Event.ENTER_FRAME, upTeamHand);
            if (justClosed)
            {
                justClosed = false;
                theSel = lastBox.selectedIndex;
                for (j in cBoxArray)
                {
                    if (cBoxArray[j].selectedIndex == theSel)
                    {
                        if (theSel > 3)
                        {
                            if (cBoxArray[j] != lastBox)
                            {
                                cBoxArray[j].selectedIndex = 0;
                            };
                        };
                    };
                };
            };
            var vars:* = new Object();
            vars.array = new Array();
            for (i in cBoxArray)
            {
                vars.array.push(cBoxArray[i].selectedLabel);
            };
            mpKon.sendOff(vars, true, "updateTeamDisplay");
        }

        private function clickJoinGameHandler(me:MouseEvent):void
        {
            var j:*;
            var i:*;
            if (m.theList.selectedItem != null)
            {
                mpKon.foxRoom(m.theList.selectedItem.data);
                gameRoomMode = true;
                clearMessages();
                removeChild(m);
                roomMaster = false;
                addChild(m3);
                m3.startGame.visible = false;
                for (j in cBoxArray)
                {
                    cBoxArray[j].visible = false;
                };
                for (i in dBoxArray)
                {
                    dBoxArray[i].n.text = "None";
                    rBoxArray[i].visible = false;
                };
                mpKon.justJoined();
            };
        }

        private function msgHandler(be:BlossomEvent):void
        {
            if (be.data.kick)
            {
                if (gameRoomMode)
                {
                    if (!roomMaster)
                    {
                        quitGameRoom();
                        dataTracer.throwError("You have been kicked from the game.");
                    };
                };
            };
        }

        public function kickHandlerFox():void
        {
            if (gameRoomMode)
            {
                if (!roomMaster)
                {
                    quitGameRoom();
                    dataTracer.throwError("You have been kicked from the game.");
                };
            };
        }

        private function receRL(be:BlossomEvent):void
        {
            roomLeader = be.vars.roomLeader;
            room.removeEventListener(BlossomEvent.RECEIVE_ROOM_VARS, receRL);
            gameSet = be.vars.gs;
            m3.gameSetting.gotoAndStop((gameSet + 1));
        }

        private function clickExitHandler(me:MouseEvent=null):void
        {
            if (((!(MovieClip(parent).agi == null)) && (!(MovieClip(parent).guestMode))))
            {
                MovieClip(parent).agi.submitUserData("USD", MovieClip(parent).userData);
            };
            endIt(true);
        }

        public function endIt(a:Boolean=false):void
        {
            remove();
            dataTracer.suppress();
            dataTracer.endAfkClock();
            mpKon.close();
            if (a)
            {
                MovieClip(parent).gotoAndStop("START", "SCENE");
            };
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }

        private function chatSpamHand(e:TimerEvent):void
        {
            if (c_countDownSmall > 0)
            {
                c_countDownSmall--;
            }
            else
            {
                c_countDownSmall = 2;
                if (c_buildUp > 0)
                {
                    c_buildUp--;
                };
            };
            if (c_countDown > 0)
            {
                c_countDown--;
                if (c_countDown == 0)
                {
                    c_buildUp = 0;
                };
            };
        }

        private function c_justSent():void
        {
            c_buildUp++;
            if (c_buildUp >= c_buildUpMax)
            {
                c_buildUp = c_buildUpMax;
                c_countDown = 30;
            };
            c_countDownSmall = 3;
        }

        public function remove():void
        {
            m3.removeChild(m3.adBox);
            STAGE.frameRate = 30;
            MovieClip(parent).mpscreenMode = false;
            MovieClip(parent).normalRoom = normalRoom;
            m.exitButton.removeEventListener(MouseEvent.CLICK, clickExitHandler);
            timerRefresh.removeEventListener(TimerEvent.TIMER, refreshRoomList);
            terminateFox();
            c_timer.addEventListener(TimerEvent.TIMER, chatSpamHand, false, 0, true);
            room = null;
            socket = null;
            m = null;
            m2 = null;
            m3 = null;
            mpKon.buddyMsg = null;
        }

        private function terminateFox():void
        {
        }


    }
}//package 

