// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//it.gotoandplay.smartfoxserver.SmartFoxClient

package it.gotoandplay.smartfoxserver
{
    import flash.events.EventDispatcher;
    import it.gotoandplay.smartfoxserver.handlers.SysHandler;
    import it.gotoandplay.smartfoxserver.handlers.ExtHandler;
    import flash.net.Socket;
    import flash.utils.ByteArray;
    import it.gotoandplay.smartfoxserver.http.HttpConnection;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import it.gotoandplay.smartfoxserver.http.HttpEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import it.gotoandplay.smartfoxserver.data.Room;
    import flash.utils.getTimer;
    import it.gotoandplay.smartfoxserver.util.Entities;
    import it.gotoandplay.smartfoxserver.util.ObjectSerializer;
    import com.adobe.serialization.json.JSON;
    import it.gotoandplay.smartfoxserver.data.User;
    import flash.net.FileReference;
    import it.gotoandplay.smartfoxserver.handlers.IMessageHandler;
    import flash.utils.setTimeout;
    import flash.events.ErrorEvent;

    public class SmartFoxClient extends EventDispatcher 
    {

        private static const EOM:int = 0;
        private static const MSG_XML:String = "<";
        private static const MSG_JSON:String = "{";
        private static var MSG_STR:String = "%";
        private static var MIN_POLL_SPEED:Number = 0;
        private static var DEFAULT_POLL_SPEED:Number = 750;
        private static var MAX_POLL_SPEED:Number = 10000;
        private static var HTTP_POLL_REQUEST:String = "poll";
        public static const MODMSG_TO_USER:String = "u";
        public static const MODMSG_TO_ROOM:String = "r";
        public static const MODMSG_TO_ZONE:String = "z";
        public static const XTMSG_TYPE_XML:String = "xml";
        public static const XTMSG_TYPE_STR:String = "str";
        public static const XTMSG_TYPE_JSON:String = "json";
        public static const CONNECTION_MODE_DISCONNECTED:String = "disconnected";
        public static const CONNECTION_MODE_SOCKET:String = "socket";
        public static const CONNECTION_MODE_HTTP:String = "http";

        private var roomList:Array;
        private var connected:Boolean;
        private var benchStartTime:int;
        private var sysHandler:SysHandler;
        private var extHandler:ExtHandler;
        private var majVersion:Number;
        private var minVersion:Number;
        private var subVersion:Number;
        private var messageHandlers:Array;
        private var socketConnection:Socket;
        private var byteBuffer:ByteArray;
        private var autoConnectOnConfigSuccess:Boolean = false;
        public var ipAddress:String;
        public var port:int = 9339;
        public var defaultZone:String;
        private var isHttpMode:Boolean = false;
        private var _httpPollSpeed:int = DEFAULT_POLL_SPEED;
        private var httpConnection:HttpConnection;
        public var blueBoxIpAddress:String;
        public var blueBoxPort:Number = 0;
        public var smartConnect:Boolean = true;
        public var buddyList:Array;
        public var myBuddyVars:Array;
        public var debug:Boolean;
        public var myUserId:int;
        public var myUserName:String;
        public var playerId:int;
        public var amIModerator:Boolean;
        public var activeRoomId:int;
        public var changingRoom:Boolean;
        public var httpPort:int = 8080;
        public var properties:Object = null;

        public function SmartFoxClient(debug:Boolean=false)
        {
            this.majVersion = 1;
            this.minVersion = 5;
            this.subVersion = 8;
            this.activeRoomId = -1;
            this.debug = debug;
            this.messageHandlers = [];
            setupMessageHandlers();
            socketConnection = new Socket();
            socketConnection.addEventListener(Event.CONNECT, handleSocketConnection);
            socketConnection.addEventListener(Event.CLOSE, handleSocketDisconnection);
            socketConnection.addEventListener(ProgressEvent.SOCKET_DATA, handleSocketData);
            socketConnection.addEventListener(IOErrorEvent.IO_ERROR, handleIOError);
            socketConnection.addEventListener(IOErrorEvent.NETWORK_ERROR, handleIOError);
            socketConnection.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
            httpConnection = new HttpConnection();
            httpConnection.addEventListener(HttpEvent.onHttpConnect, handleHttpConnect);
            httpConnection.addEventListener(HttpEvent.onHttpClose, handleHttpClose);
            httpConnection.addEventListener(HttpEvent.onHttpData, handleHttpData);
            httpConnection.addEventListener(HttpEvent.onHttpError, handleHttpError);
            byteBuffer = new ByteArray();
        }

        public function get rawProtocolSeparator():String
        {
            return (MSG_STR);
        }

        public function set rawProtocolSeparator(value:String):void
        {
            if (((!(value == "<")) && (!(value == "{"))))
            {
                MSG_STR = value;
            };
        }

        public function get isConnected():Boolean
        {
            return (this.connected);
        }

        public function set isConnected(b:Boolean):void
        {
            this.connected = b;
        }

        public function get httpPollSpeed():int
        {
            return (this._httpPollSpeed);
        }

        public function set httpPollSpeed(sp:int):void
        {
            if (((sp >= 0) && (sp <= 10000)))
            {
                this._httpPollSpeed = sp;
            };
        }

        public function loadConfig(configFile:String="config.xml", autoConnect:Boolean=true):void
        {
            this.autoConnectOnConfigSuccess = autoConnect;
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE, onConfigLoadSuccess);
            loader.addEventListener(IOErrorEvent.IO_ERROR, onConfigLoadFailure);
            loader.load(new URLRequest(configFile));
        }

        public function getConnectionMode():String
        {
            var mode:String = CONNECTION_MODE_DISCONNECTED;
            if (this.isConnected)
            {
                if (this.isHttpMode)
                {
                    mode = CONNECTION_MODE_HTTP;
                }
                else
                {
                    mode = CONNECTION_MODE_SOCKET;
                };
            };
            return (mode);
        }

        public function connect(ipAdr:String, port:int=9339):void
        {
            if (!connected)
            {
                initialize();
                this.ipAddress = ipAdr;
                this.port = port;
                socketConnection.connect(ipAdr, port);
            }
            else
            {
                debugMessage("*** ALREADY CONNECTED ***");
            };
        }

        public function disconnect():void
        {
            connected = false;
            if (!isHttpMode)
            {
                socketConnection.close();
            }
            else
            {
                httpConnection.close();
            };
            sysHandler.dispatchDisconnection();
        }

        public function addBuddy(buddyName:String):void
        {
            var xmlMsg:String;
            if (((!(buddyName == myUserName)) && (!(checkBuddyDuplicates(buddyName)))))
            {
                xmlMsg = (("<n>" + buddyName) + "</n>");
                send({"t":"sys"}, "addB", -1, xmlMsg);
            };
        }

        public function autoJoin():void
        {
            if (!checkRoomList())
            {
                return;
            };
            var header:Object = {"t":"sys"};
            this.send(header, "autoJoin", ((this.activeRoomId) ? this.activeRoomId : -1), "");
        }

        public function clearBuddyList():void
        {
            buddyList = [];
            send({"t":"sys"}, "clearB", -1, "");
            var params:Object = {};
            params.list = buddyList;
            var evt:SFSEvent = new SFSEvent(SFSEvent.onBuddyList, params);
            dispatchEvent(evt);
        }

        public function createRoom(roomObj:Object, roomId:int=-1):void
        {
            var i:String;
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var header:Object = {"t":"sys"};
            var isGame:String = ((roomObj.isGame) ? "1" : "0");
            var exitCurrentRoom:String = "1";
            var maxUsers:String = ((roomObj.maxUsers == null) ? "0" : String(roomObj.maxUsers));
            var maxSpectators:String = ((roomObj.maxSpectators == null) ? "0" : String(roomObj.maxSpectators));
            var joinAsSpectator:String = ((roomObj.joinAsSpectator) ? "1" : "0");
            if (((roomObj.isGame) && (!(roomObj.exitCurrentRoom == null))))
            {
                exitCurrentRoom = ((roomObj.exitCurrentRoom) ? "1" : "0");
            };
            var xmlMsg:* = (((((((("<room tmp='1' gam='" + isGame) + "' spec='") + maxSpectators) + "' exit='") + exitCurrentRoom) + "' jas='") + joinAsSpectator) + "'>");
            xmlMsg = (xmlMsg + (("<name><![CDATA[" + ((roomObj.name == null) ? "" : roomObj.name)) + "]]></name>"));
            xmlMsg = (xmlMsg + (("<pwd><![CDATA[" + ((roomObj.password == null) ? "" : roomObj.password)) + "]]></pwd>"));
            xmlMsg = (xmlMsg + (("<max>" + maxUsers) + "</max>"));
            if (roomObj.uCount != null)
            {
                xmlMsg = (xmlMsg + (("<uCnt>" + ((roomObj.uCount) ? "1" : "0")) + "</uCnt>"));
            };
            if (roomObj.extension != null)
            {
                xmlMsg = (xmlMsg + ("<xt n='" + roomObj.extension.name));
                xmlMsg = (xmlMsg + (("' s='" + roomObj.extension.script) + "' />"));
            };
            if (roomObj.vars == null)
            {
                xmlMsg = (xmlMsg + "<vars></vars>");
            }
            else
            {
                xmlMsg = (xmlMsg + "<vars>");
                for (i in roomObj.vars)
                {
                    xmlMsg = (xmlMsg + getXmlRoomVariable(roomObj.vars[i]));
                };
                xmlMsg = (xmlMsg + "</vars>");
            };
            xmlMsg = (xmlMsg + "</room>");
            send(header, "createRoom", roomId, xmlMsg);
        }

        public function getAllRooms():Array
        {
            return (roomList);
        }

        public function getBuddyByName(buddyName:String):Object
        {
            var buddy:Object;
            for each (buddy in buddyList)
            {
                if (buddy.name == buddyName)
                {
                    return (buddy);
                };
            };
            return (null);
        }

        public function getBuddyById(id:int):Object
        {
            var buddy:Object;
            for each (buddy in buddyList)
            {
                if (buddy.id == id)
                {
                    return (buddy);
                };
            };
            return (null);
        }

        public function getBuddyRoom(buddy:Object):void
        {
            if (buddy.id != -1)
            {
                send({"t":"sys"}, "roomB", -1, (("<b id='" + buddy.id) + "' />"));
            };
        }

        public function getRoom(roomId:int):Room
        {
            if (!checkRoomList())
            {
                return (null);
            };
            return (roomList[roomId]);
        }

        public function getRoomByName(roomName:String):Room
        {
            var r:Room;
            if (!checkRoomList())
            {
                return (null);
            };
            var room:Room;
            for each (r in roomList)
            {
                if (r.getName() == roomName)
                {
                    room = r;
                    break;
                };
            };
            return (room);
        }

        public function getRoomList():void
        {
            var header:Object = {"t":"sys"};
            send(header, "getRmList", activeRoomId, "");
        }

        public function getActiveRoom():Room
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return (null);
            };
            return (roomList[activeRoomId]);
        }

        public function getRandomKey():void
        {
            send({"t":"sys"}, "rndK", -1, "");
        }

        public function getUploadPath():String
        {
            return (((("http://" + this.ipAddress) + ":") + this.httpPort) + "/default/uploads/");
        }

        public function getVersion():String
        {
            return ((((this.majVersion + ".") + this.minVersion) + ".") + this.subVersion);
        }

        public function joinRoom(newRoom:*, pword:String="", isSpectator:Boolean=false, dontLeave:Boolean=false, oldRoom:int=-1):void
        {
            var r:Room;
            var header:Object;
            var leaveCurrRoom:String;
            var roomToLeave:int;
            var message:String;
            if (!checkRoomList())
            {
                return;
            };
            var newRoomId:int = -1;
            var isSpec:int = ((isSpectator) ? 1 : 0);
            if (!this.changingRoom)
            {
                if (typeof(newRoom) == "number")
                {
                    newRoomId = int(newRoom);
                }
                else
                {
                    if (typeof(newRoom) == "string")
                    {
                        for each (r in roomList)
                        {
                            if (r.getName() == newRoom)
                            {
                                newRoomId = r.getId();
                                break;
                            };
                        };
                    };
                };
                if (newRoomId != -1)
                {
                    header = {"t":"sys"};
                    leaveCurrRoom = ((dontLeave) ? "0" : "1");
                    roomToLeave = ((oldRoom > -1) ? oldRoom : activeRoomId);
                    if (activeRoomId == -1)
                    {
                        leaveCurrRoom = "0";
                        roomToLeave = -1;
                    };
                    message = (((((((((("<room id='" + newRoomId) + "' pwd='") + pword) + "' spec='") + isSpec) + "' leave='") + leaveCurrRoom) + "' old='") + roomToLeave) + "' />");
                    send(header, "joinRoom", activeRoomId, message);
                    changingRoom = true;
                }
                else
                {
                    debugMessage("SmartFoxError: requested room to join does not exist!");
                };
            };
        }

        public function leaveRoom(roomId:int):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            var header:Object = {"t":"sys"};
            var xmlMsg:* = (("<rm id='" + roomId) + "' />");
            send(header, "leaveRoom", roomId, xmlMsg);
        }

        public function loadBuddyList():void
        {
            send({"t":"sys"}, "loadB", -1, "");
        }

        public function login(zone:String, name:String, pass:String):void
        {
            var header:Object = {"t":"sys"};
            var message:* = (((((("<login z='" + zone) + "'><nick><![CDATA[") + name) + "]]></nick><pword><![CDATA[") + pass) + "]]></pword></login>");
            send(header, "login", 0, message);
        }

        public function logout():void
        {
            var header:Object = {"t":"sys"};
            send(header, "logout", -1, "");
        }

        public function removeBuddy(buddyName:String):void
        {
            var buddy:Object;
            var it:String;
            var header:Object;
            var xmlMsg:String;
            var params:Object;
            var evt:SFSEvent;
            var found:Boolean;
            for (it in buddyList)
            {
                buddy = buddyList[it];
                if (buddy.name == buddyName)
                {
                    delete buddyList[it];
                    found = true;
                    break;
                };
            };
            if (found)
            {
                header = {"t":"sys"};
                xmlMsg = (("<n>" + buddyName) + "</n>");
                send(header, "remB", -1, xmlMsg);
                params = {};
                params.list = buddyList;
                evt = new SFSEvent(SFSEvent.onBuddyList, params);
                dispatchEvent(evt);
            };
        }

        public function roundTripBench():void
        {
            this.benchStartTime = getTimer();
            send({"t":"sys"}, "roundTrip", activeRoomId, "");
        }

        public function sendBuddyPermissionResponse(allowBuddy:Boolean, targetBuddy:String):void
        {
            var header:Object = {"t":"sys"};
            var xmlMsg:* = (((("<n res='" + ((allowBuddy) ? "g" : "r")) + "'>") + targetBuddy) + "</n>");
            send(header, "bPrm", -1, xmlMsg);
        }

        public function sendPublicMessage(message:String, roomId:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var header:Object = {"t":"sys"};
            var xmlMsg:* = (("<txt><![CDATA[" + Entities.encodeEntities(message)) + "]]></txt>");
            send(header, "pubMsg", roomId, xmlMsg);
        }

        public function sendPrivateMessage(message:String, recipientId:int, roomId:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var header:Object = {"t":"sys"};
            var xmlMsg:* = (((("<txt rcp='" + recipientId) + "'><![CDATA[") + Entities.encodeEntities(message)) + "]]></txt>");
            send(header, "prvMsg", roomId, xmlMsg);
        }

        public function sendModeratorMessage(message:String, _arg_2:String, id:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            var header:Object = {"t":"sys"};
            var xmlMsg:* = (((((("<txt t='" + _arg_2) + "' id='") + id) + "'><![CDATA[") + Entities.encodeEntities(message)) + "]]></txt>");
            send(header, "modMsg", activeRoomId, xmlMsg);
        }

        public function sendObject(obj:Object, roomId:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var xmlData:* = (("<![CDATA[" + ObjectSerializer.getInstance().serialize(obj)) + "]]>");
            var header:Object = {"t":"sys"};
            send(header, "asObj", roomId, xmlData);
        }

        public function sendObjectToGroup(obj:Object, userList:Array, roomId:int=-1):void
        {
            var i:String;
            var header:Object;
            var xmlMsg:String;
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var strList:String = "";
            for (i in userList)
            {
                if (!isNaN(userList[i]))
                {
                    strList = (strList + (userList[i] + ","));
                };
            };
            strList = strList.substr(0, (strList.length - 1));
            obj._$$_ = strList;
            header = {"t":"sys"};
            xmlMsg = (("<![CDATA[" + ObjectSerializer.getInstance().serialize(obj)) + "]]>");
            send(header, "asObjG", roomId, xmlMsg);
        }

        public function sendXtMessage(xtName:String, cmd:String, paramObj:*, _arg_4:String="xml", roomId:int=-1):void
        {
            var header:Object;
            var xtReq:Object;
            var xmlmsg:String;
            var hdr:String;
            var i:Number;
            var body:Object;
            var obj:Object;
            var msg:String;
            if (!checkRoomList())
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            if (_arg_4 == XTMSG_TYPE_XML)
            {
                header = {"t":"xt"};
                xtReq = {
                    "name":xtName,
                    "cmd":cmd,
                    "param":paramObj
                };
                xmlmsg = (("<![CDATA[" + ObjectSerializer.getInstance().serialize(xtReq)) + "]]>");
                send(header, "xtReq", roomId, xmlmsg);
            }
            else
            {
                if (_arg_4 == XTMSG_TYPE_STR)
                {
                    hdr = ((((((((MSG_STR + "xt") + MSG_STR) + xtName) + MSG_STR) + cmd) + MSG_STR) + roomId) + MSG_STR);
                    i = 0;
                    while (i < paramObj.length)
                    {
                        hdr = (hdr + (paramObj[i].toString() + MSG_STR));
                        i++;
                    };
                    sendString(hdr);
                }
                else
                {
                    if (_arg_4 == XTMSG_TYPE_JSON)
                    {
                        body = {};
                        body.x = xtName;
                        body.c = cmd;
                        body.r = roomId;
                        body.p = paramObj;
                        obj = {};
                        obj.t = "xt";
                        obj.b = body;
                        msg = com.adobe.serialization.json.JSON.encode(obj);
                        sendJson(msg);
                    };
                };
            };
        }

        public function setBuddyBlockStatus(buddyName:String, status:Boolean):void
        {
            var xmlMsg:String;
            var params:Object;
            var evt:SFSEvent;
            var b:Object = getBuddyByName(buddyName);
            if (b != null)
            {
                if (b.isBlocked != status)
                {
                    b.isBlocked = status;
                    xmlMsg = (((("<n x='" + ((status) ? "1" : "0")) + "'>") + buddyName) + "</n>");
                    send({"t":"sys"}, "setB", -1, xmlMsg);
                    params = {};
                    params.buddy = b;
                    evt = new SFSEvent(SFSEvent.onBuddyListUpdate, params);
                    dispatchEvent(evt);
                };
            };
        }

        public function setBuddyVariables(varList:Array):void
        {
            var vName:String;
            var vValue:String;
            var header:Object = {"t":"sys"};
            var xmlMsg:String = "<vars>";
            for (vName in varList)
            {
                vValue = varList[vName];
                if (myBuddyVars[vName] != vValue)
                {
                    myBuddyVars[vName] = vValue;
                    xmlMsg = (xmlMsg + (((("<var n='" + vName) + "'><![CDATA[") + vValue) + "]]></var>"));
                };
            };
            xmlMsg = (xmlMsg + "</vars>");
            this.send(header, "setBvars", -1, xmlMsg);
        }

        public function setRoomVariables(varList:Array, roomId:int=-1, setOwnership:Boolean=true):void
        {
            var xmlMsg:String;
            var rv:Object;
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var header:Object = {"t":"sys"};
            if (setOwnership)
            {
                xmlMsg = "<vars>";
            }
            else
            {
                xmlMsg = "<vars so='0'>";
            };
            for each (rv in varList)
            {
                xmlMsg = (xmlMsg + getXmlRoomVariable(rv));
            };
            xmlMsg = (xmlMsg + "</vars>");
            send(header, "setRvars", roomId, xmlMsg);
        }

        public function setUserVariables(varObj:Object, roomId:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            var header:Object = {"t":"sys"};
            var currRoom:Room = getActiveRoom();
            var user:User = currRoom.getUser(myUserId);
            user.setVariables(varObj);
            var xmlMsg:String = getXmlUserVariable(varObj);
            send(header, "setUvars", roomId, xmlMsg);
        }

        public function switchSpectator(roomId:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            send({"t":"sys"}, "swSpec", roomId, "");
        }

        public function switchPlayer(roomId:int=-1):void
        {
            if (((!(checkRoomList())) || (!(checkJoin()))))
            {
                return;
            };
            if (roomId == -1)
            {
                roomId = activeRoomId;
            };
            send({"t":"sys"}, "swPl", roomId, "");
        }

        public function uploadFile(fileRef:FileReference, id:int=-1, nick:String="", port:int=-1):void
        {
            if (id == -1)
            {
                id = this.myUserId;
            };
            if (nick == "")
            {
                nick = this.myUserName;
            };
            if (port == -1)
            {
                port = this.httpPort;
            };
            fileRef.upload(new URLRequest(((((((("http://" + this.ipAddress) + ":") + port) + "/default/Upload.py?id=") + id) + "&nick=") + nick)));
            debugMessage(((((((("[UPLOAD]: http://" + this.ipAddress) + ":") + port) + "/default/Upload.py?id=") + id) + "&nick=") + nick));
        }

        public function __logout():void
        {
            initialize(true);
        }

        public function sendString(strMessage:String):void
        {
            debugMessage((("[Sending - STR]: " + strMessage) + "\n"));
            if (isHttpMode)
            {
                httpConnection.send(strMessage);
            }
            else
            {
                writeToSocket(strMessage);
            };
        }

        public function sendJson(jsMessage:String):void
        {
            debugMessage((("[Sending - JSON]: " + jsMessage) + "\n"));
            if (isHttpMode)
            {
                httpConnection.send(jsMessage);
            }
            else
            {
                writeToSocket(jsMessage);
            };
        }

        public function getBenchStartTime():int
        {
            return (this.benchStartTime);
        }

        public function clearRoomList():void
        {
            this.roomList = [];
        }

        private function initialize(isLogOut:Boolean=false):void
        {
            this.changingRoom = false;
            this.amIModerator = false;
            this.playerId = -1;
            this.activeRoomId = -1;
            this.myUserId = -1;
            this.myUserName = "";
            this.roomList = [];
            this.buddyList = [];
            this.myBuddyVars = [];
            if (!isLogOut)
            {
                this.connected = false;
                this.isHttpMode = false;
            };
        }

        private function onConfigLoadSuccess(evt:Event):void
        {
            var sfsEvt:SFSEvent;
            var loader:URLLoader = (evt.target as URLLoader);
            var xmlDoc:XML = new XML(loader.data);
            this.ipAddress = (this.blueBoxIpAddress = xmlDoc.ip);
            this.port = int(xmlDoc.port);
            this.defaultZone = xmlDoc.zone;
            if (xmlDoc.blueBoxIpAddress != undefined)
            {
                this.blueBoxIpAddress = xmlDoc.blueBoxIpAddress;
            };
            if (xmlDoc.blueBoxPort != undefined)
            {
                this.blueBoxPort = xmlDoc.blueBoxPort;
            };
            if (xmlDoc.debug != undefined)
            {
                this.debug = ((xmlDoc.debug.toLowerCase() == "true") ? true : false);
            };
            if (xmlDoc.smartConnect != undefined)
            {
                this.smartConnect = ((xmlDoc.smartConnect.toLowerCase() == "true") ? true : false);
            };
            if (xmlDoc.httpPort != undefined)
            {
                this.httpPort = int(xmlDoc.httpPort);
            };
            if (xmlDoc.httpPollSpeed != undefined)
            {
                this.httpPollSpeed = int(xmlDoc.httpPollSpeed);
            };
            if (xmlDoc.rawProtocolSeparator != undefined)
            {
                rawProtocolSeparator = xmlDoc.rawProtocolSeparator;
            };
            if (autoConnectOnConfigSuccess)
            {
                this.connect(ipAddress, port);
            }
            else
            {
                sfsEvt = new SFSEvent(SFSEvent.onConfigLoadSuccess, {});
                dispatchEvent(sfsEvt);
            };
        }

        private function onConfigLoadFailure(evt:IOErrorEvent):void
        {
            var params:Object = {"message":evt.text};
            var sfsEvt:SFSEvent = new SFSEvent(SFSEvent.onConfigLoadFailure, params);
            dispatchEvent(sfsEvt);
        }

        private function setupMessageHandlers():void
        {
            sysHandler = new SysHandler(this);
            extHandler = new ExtHandler(this);
            addMessageHandler("sys", sysHandler);
            addMessageHandler("xt", extHandler);
        }

        private function addMessageHandler(key:String, handler:IMessageHandler):void
        {
            if (this.messageHandlers[key] == null)
            {
                this.messageHandlers[key] = handler;
            }
            else
            {
                debugMessage((("Warning, message handler called: " + key) + " already exist!"));
            };
        }

        private function debugMessage(message:String):void
        {
            var evt:SFSEvent;
            if (this.debug)
            {
                // trace(message);
                evt = new SFSEvent(SFSEvent.onDebugMessage, {"message":message});
                dispatchEvent(evt);
            };
        }

        private function send(header:Object, action:String, fromRoom:Number, message:String):void
        {
            var xmlMsg:String = makeXmlHeader(header);
            xmlMsg = (xmlMsg + ((((((("<body action='" + action) + "' r='") + fromRoom) + "'>") + message) + "</body>") + closeHeader()));
            debugMessage((("[Sending]: " + xmlMsg) + "\n"));
            if (isHttpMode)
            {
                httpConnection.send(xmlMsg);
            }
            else
            {
                writeToSocket(xmlMsg);
            };
        }

        private function writeToSocket(msg:String):void
        {
            var byteBuff:ByteArray = new ByteArray();
            byteBuff.writeMultiByte(msg, "utf-8");
            byteBuff.writeByte(0);
            socketConnection.writeBytes(byteBuff);
            socketConnection.flush();
        }

        private function makeXmlHeader(headerObj:Object):String
        {
            var item:String;
            var xmlData:String = "<msg";
            for (item in headerObj)
            {
                xmlData = (xmlData + ((((" " + item) + "='") + headerObj[item]) + "'"));
            };
            xmlData = (xmlData + ">");
            return (xmlData);
        }

        private function closeHeader():String
        {
            return ("</msg>");
        }

        private function checkBuddyDuplicates(buddyName:String):Boolean
        {
            var buddy:Object;
            var res:Boolean;
            for each (buddy in buddyList)
            {
                if (buddy.name == buddyName)
                {
                    res = true;
                    break;
                };
            };
            return (res);
        }

        private function xmlReceived(msg:String):void
        {
            var xmlData:XML = new XML(msg);
            var handlerId:String = xmlData.@t;
            var action:String = xmlData.body.@action;
            var roomId:int = int(xmlData.body.@r);
            var handler:IMessageHandler = messageHandlers[handlerId];
            if (handler != null)
            {
                handler.handleMessage(xmlData, XTMSG_TYPE_XML);
            };
        }

        private function jsonReceived(msg:String):void
        {
            var jso:Object = com.adobe.serialization.json.JSON.decode(msg);
            var handlerId:String = jso["t"];
            var handler:IMessageHandler = messageHandlers[handlerId];
            if (handler != null)
            {
                handler.handleMessage(jso["b"], XTMSG_TYPE_JSON);
            };
        }

        private function strReceived(msg:String):void
        {
            var params:Array = msg.substr(1, (msg.length - 2)).split(MSG_STR);
            var handlerId:String = params[0];
            var handler:IMessageHandler = messageHandlers[handlerId];
            if (handler != null)
            {
                handler.handleMessage(params.splice(1, (params.length - 1)), XTMSG_TYPE_STR);
            };
        }

        private function getXmlRoomVariable(rVar:Object):String
        {
            var vName:String = rVar.name.toString();
            var vValue:* = rVar.val;
            var vPrivate:String = ((rVar.priv) ? "1" : "0");
            var vPersistent:String = ((rVar.persistent) ? "1" : "0");
            var t:String;
            var _local_7:* = typeof(vValue);
            if (_local_7 == "boolean")
            {
                t = "b";
                vValue = ((vValue) ? "1" : "0");
            }
            else
            {
                if (_local_7 == "number")
                {
                    t = "n";
                }
                else
                {
                    if (_local_7 == "string")
                    {
                        t = "s";
                    }
                    else
                    {
                        if ((((vValue == null) && (_local_7 == "object")) || (_local_7 == "undefined")))
                        {
                            t = "x";
                            vValue = "";
                        };
                    };
                };
            };
            if (t != null)
            {
                return (((((((((("<var n='" + vName) + "' t='") + t) + "' pr='") + vPrivate) + "' pe='") + vPersistent) + "'><![CDATA[") + vValue) + "]]></var>");
            };
            return ("");
        }

        private function getXmlUserVariable(uVars:Object):String
        {
            var val:*;
            var t:String;
            var _local_5:String;
            var key:String;
            var xmlStr:String = "<vars>";
            for (key in uVars)
            {
                val = uVars[key];
                _local_5 = typeof(val);
                t = null;
                if (_local_5 == "boolean")
                {
                    t = "b";
                    val = ((val) ? "1" : "0");
                }
                else
                {
                    if (_local_5 == "number")
                    {
                        t = "n";
                    }
                    else
                    {
                        if (_local_5 == "string")
                        {
                            t = "s";
                        }
                        else
                        {
                            if ((((val == null) && (_local_5 == "object")) || (_local_5 == "undefined")))
                            {
                                t = "x";
                                val = "";
                            };
                        };
                    };
                };
                if (t != null)
                {
                    xmlStr = (xmlStr + (((((("<var n='" + key) + "' t='") + t) + "'><![CDATA[") + val) + "]]></var>"));
                };
            };
            xmlStr = (xmlStr + "</vars>");
            return (xmlStr);
        }

        private function checkRoomList():Boolean
        {
            var success:Boolean = true;
            if (((roomList == null) || (roomList.length == 0)))
            {
                success = false;
                // errorTrace("The room list is empty!\nThe client API cannot function properly until the room list is populated.\nPlease consult the documentation for more infos.");
            };
            return (success);
        }

        private function checkJoin():Boolean
        {
            var success:Boolean = true;
            if (activeRoomId < 0)
            {
                success = false;
                // errorTrace("You haven't joined any rooms!\nIn order to interact with the server you should join at least one room.\nPlease consult the documentation for more infos.");
            };
            return (success);
        }

        private function errorTrace(msg:String):void
        {
            // trace("\n****************************************************************");
            // trace("Warning:");
            // trace(msg);
            // trace("****************************************************************");
        }

        private function handleHttpConnect(evt:HttpEvent):void
        {
            this.handleSocketConnection(null);
            connected = true;
            httpConnection.send(HTTP_POLL_REQUEST);
        }

        private function handleHttpClose(evt:HttpEvent):void
        {
            initialize();
            var sfse:SFSEvent = new SFSEvent(SFSEvent.onConnectionLost, {});
            dispatchEvent(sfse);
        }

        private function handleHttpData(evt:HttpEvent):void
        {
            var message:String;
            var i:int;
            var data:String = (evt.params.data as String);
            var messages:Array = data.split("\n");
            if (messages[0] != "")
            {
                i = 0;
                while (i < (messages.length - 1))
                {
                    message = messages[i];
                    if (message.length > 0)
                    {
                        handleMessage(message);
                    };
                    i++;
                };
                if (this._httpPollSpeed > 0)
                {
                    setTimeout(this.handleDelayedPoll, this._httpPollSpeed);
                }
                else
                {
                    handleDelayedPoll();
                };
            };
        }

        private function handleDelayedPoll():void
        {
            httpConnection.send(HTTP_POLL_REQUEST);
        }

        private function handleHttpError(evt:HttpEvent):void
        {
            trace("HttpError");
            if (!connected)
            {
                dispatchConnectionError();
            };
        }

        private function handleSocketConnection(e:Event):void
        {
            var header:Object = {"t":"sys"};
            var xmlMsg:* = (((("<ver v='" + this.majVersion.toString()) + this.minVersion.toString()) + this.subVersion.toString()) + "' />");
            send(header, "verChk", 0, xmlMsg);
        }

        private function handleSocketDisconnection(evt:Event):void
        {
            initialize();
            var sfse:SFSEvent = new SFSEvent(SFSEvent.onConnectionLost, {});
            dispatchEvent(sfse);
        }

        private function handleIOError(evt:IOErrorEvent):void
        {
            tryBlueBoxConnection(evt);
        }

        private function tryBlueBoxConnection(evt:ErrorEvent):void
        {
            var __ip:String;
            var __port:int;
            if (!connected)
            {
                if (smartConnect)
                {
                    debugMessage("Socket connection failed. Trying BlueBox");
                    isHttpMode = true;
                    __ip = ((blueBoxIpAddress != null) ? blueBoxIpAddress : ipAddress);
                    __port = ((blueBoxPort != 0) ? blueBoxPort : httpPort);
                    httpConnection.connect(__ip, __port);
                }
                else
                {
                    dispatchConnectionError();
                };
            }
            else
            {
                dispatchEvent(evt);
                debugMessage(("[WARN] Connection error: " + evt.text));
            };
        }

        private function handleSocketError(evt:SecurityErrorEvent):void
        {
            debugMessage(("Socket Error: " + evt.text));
        }

        private function handleSecurityError(evt:SecurityErrorEvent):void
        {
            tryBlueBoxConnection(evt);
        }

        private function handleSocketData(evt:Event):void
        {
            var b:int;
            var bytes:int = socketConnection.bytesAvailable;
            while (--bytes >= 0)
            {
                b = socketConnection.readByte();
                if (b != 0)
                {
                    byteBuffer.writeByte(b);
                }
                else
                {
                    handleMessage(byteBuffer.toString());
                    byteBuffer = new ByteArray();
                };
            };
        }

        private function handleMessage(msg:String):void
        {
            if (msg != "ok")
            {
                debugMessage((((("[ RECEIVED ]: " + msg) + ", (len: ") + msg.length) + ")"));
            };
            var _local_2:String = msg.charAt(0);
            if (_local_2 == MSG_XML)
            {
                xmlReceived(msg);
            }
            else
            {
                if (_local_2 == MSG_STR)
                {
                    strReceived(msg);
                }
                else
                {
                    if (_local_2 == MSG_JSON)
                    {
                        jsonReceived(msg);
                    };
                };
            };
        }

        private function dispatchConnectionError():void
        {
            var params:Object = {};
            params.success = false;
            params.error = "I/O Error";
            var sfse:SFSEvent = new SFSEvent(SFSEvent.onConnection, params);
            dispatchEvent(sfse);
        }


    }
}//package it.gotoandplay.smartfoxserver

