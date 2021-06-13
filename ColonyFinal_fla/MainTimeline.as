// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.MainTimeline

package ColonyFinal_fla
{
	
import flash.net.URLLoader;
import it.gotoandplay.smartfoxserver.*;
import com.jiggmin.blossomSocket.*;
import fl.data.*;
import com.jiggmin.*;
import flash.display.MovieClip;
import flash.text.TextField;
import fl.controls.Button;
import flash.display.SimpleButton;
import fl.controls.ComboBox;
import fl.controls.CheckBox;
import flash.utils.Dictionary;
import flash.display.DisplayObject;
import flash.text.TextFormat;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.display.Loader;
import flash.ui.ContextMenu;
import flash.net.SharedObject;
import flash.utils.Timer;
import flash.display.Sprite;
import flash.filters.GlowFilter;
import flash.ui.Mouse;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import com.jiggmin.blossomSocket.BlossomEvent;
import flash.net.navigateToURL;
import com.jiggmin.SocketManager;
import flash.text.TextFieldAutoSize;
import flash.events.KeyboardEvent;
import fl.data.DataProvider;
import fl.data.SimpleCollectionItem;
import flash.display.StageScaleMode;
import flash.system.Security;
import fl.controls.*;
import flash.display.*;
import flash.events.*;
import flash.utils.*;
import flash.net.*;
import flash.text.*;
import flash.media.*;
import flash.geom.*;
import flash.ui.*;
import flash.filters.*;
import flash.system.*;
import adobe.utils.*;
import flash.accessibility.*;
import flash.errors.*;
import flash.external.*;
import flash.printing.*;
import flash.profiler.*;
import flash.sampler.*;
import flash.xml.*;
import it.gotoandplay.smartfoxserver.SmartFoxClient;

    public dynamic class MainTimeline extends MovieClip 
    {

        public var r_i1:TextField;
        public var r_i:TextField;
        public var in_name:TextField;
        public var xb_back2:Button;
        public var sxB_3:Button;
        public var d_mc3:MovieClip;
        public var r_i2:TextField;
        public var xb_back:Button;
        public var sxB_4:Button;
        public var button_link:Button;
        public var button_multi:Button;
        public var agIntro:MovieClip;
        public var d_mc4:MovieClip;
        public var r_i3:TextField;
        public var chatPanel:TextField;
        public var sxB_5:Button;
        public var d_mc5:MovieClip;
        public var loadBar:MovieClip;
        public var ag_lockBut:SimpleButton;
        public var r_i4:TextField;
        public var chatToWho:TextField;
		public var OfflineA:TextField;
		public var OfflineB:TextField;
		public var success:Boolean;
        public var j_server2:Button;
        public var butmis_6:Button;
		public var butmis_7:Button;
        public var d_mc6:MovieClip;
        public var dateMC:MovieClip;
        public var r_e1:TextField;
        public var r_m:TextField;
        public var countTime:MovieClip;
        public var re_pass:TextField;
        public var mis_next:SimpleButton;
        public var j_server1:Button;
        public var button_mission:Button;
        public var r_e2:TextField;
        public var b0:MovieClip;
        public var in_pass:TextField;
        public var but_exit:Button;
        public var but_guest:Button;
        public var j_server0:Button;
        public var butmis_4:Button;
        public var adBox:MovieClip;
        public var button_res:Button;
        public var promptBox:MovieClip;
        public var r_p1:TextField;
        public var r_e3:TextField;
        public var b1:MovieClip;
        public var oi:MovieClip;
        public var goAg2:Button;
        public var butmis_5:Button;
        public var r_e4:TextField;
        public var r_p2:TextField;
        public var b2:MovieClip;
        public var n_l1:TextField;
        public var butmis_2:Button;
        public var r_p3:TextField;
        public var b3:MovieClip;
        public var n_l2:TextField;
        public var but_login3:Button;
        public var butmis_3:Button;
        public var renderBar:MovieClip;
        public var button_play:SimpleButton;
        public var shower:TextField;
        public var v_screen:MovieClip;
        public var r_p4:TextField;
        public var b4:MovieClip;
        public var r_p:TextField;
        public var n_l3:TextField;
        public var nameBox:TextField;
        public var combo1:ComboBox;
        public var button_single:Button;
        public var d_screen:MovieClip;
        public var b5:MovieClip;
        public var uiName:TextField;
        public var n_l4:TextField;
        public var but_register:Button;
        public var butmis_1:Button;
        public var b6:MovieClip;
        public var but_login:Button;
        public var ui_hp:TextField;
        public var chatBox:MovieClip;
        public var buildBar:MovieClip;
        public var b7:MovieClip;
        public var xb_back7:Button;
        public var r_m1:TextField;
        public var chatHider:MovieClip;
        public var b8:MovieClip;
        public var r_e:TextField;
        public var uiLay:MovieClip;
        public var but_login4:Button;
        public var mis_beg:SimpleButton;
        public var xb_back6:Button;
        public var r_m2:TextField;
        public var but_exit3:Button;
        public var re_pass2:TextField;
        public var but_register2:Button;
        public var d_mc0:MovieClip;
        public var r_m3:TextField;
        public var uiDesc:TextField;
        public var but_exit2:Button;
        public var reMe:CheckBox;
        public var sxB_1:Button;
        public var d_mc1:MovieClip;
        public var r_m4:TextField;
        public var re_email:TextField;
        public var re_name:TextField;
        public var goAg:Button;
        public var xb_back3:Button;
        public var sxB_2:Button;
        public var d_mc2:MovieClip;
        public var __setPropDict:Dictionary = new Dictionary(true);
        public var CPMStarPoolID:int;
        public var CPMStarSubPoolID:int;
        public var ad:DisplayObject;
        public var mW:Number;
        public var completedTheL:Boolean;
        public var userNameId:*;
        public var T:MenuFont;
        public var tf:TextFormat;
        public var josefArray:Array;
        public var iii:*;
        public var ToolTip:toolTip;
        public var dragRect:Rectangle;
        public var BuildingData:buildingData;
        public var OptionData:optionData;
        public var WeaponData:weaponData;
        public var UnitData:unitData;
        public var soundOn:Boolean;
        public var musicOn:Boolean;
        public var normalRoom:String;
        public var DataTracer:dataTracer;
        public var url2:String;
        public var urlStart:Number;
        public var urlEnd:Number;
        public var domain:String;
        public var LastDot:Number;
        public var domEnd:Number;
        public var validDomain:Boolean;
        public var agDom:Boolean;
        public var agi_url:String;
        public var devKey:String;
        public var gameKey:String;
        public var agi:*;
        public var urlRequest:URLRequest;
        public var loader:Loader;
        public var testMode:Boolean;
        public var agiLogged:Boolean;
        public var agiUserName:String;
        public var my_cMenu:ContextMenu;
        public var missionMax:uint;
        public var sav_user:String;
        public var sav_pass:String;
        public var rememberMe:Boolean;
        public var saveGame:SharedObject;
        public var colorStrings:Array;
        public var colorForm:Array;
        public var colorChat:Array;
        public var validCheckClock:Timer;
        public var jum:String;
        public var DCLINE:String;
        public var missionLevel:uint;
        public var storySetter:uint;
        public var missionOn:Boolean;
        public var missionGo:Boolean;
        public var DCTRUE:Boolean;
        public var clientPlayer:Array;
        public var remotePlayerArray:Array;
        public var allPlayers:Array;
        public var singlePlayerMode:Boolean;
        public var playerName:String;
        public var MP_userName:String;
        public var MP_team:uint;
        public var MP_color:uint;
        public var onlineServers:Array;
        public var serverNames:Array;
        public var MP_r2j:Boolean;
        public var disconnectedHandler2:Function;
        public var singleLevel:uint;
        public var tutLev:Boolean;
        public var gh:*;
        public var comicLoad:*;
        public var comicPage:uint;
        public var comicPageMax:uint;
        public var tfRe:TextFormat;
        public var justReg:Boolean;
        public var regName:String;
        public var regPass:String;
        public var guestMode:Boolean;
        public var someNames:Array;
        public var tickerUSD:uint;
        public var userID:int;
        public var userData:Object;
        public var friendList:Array;
        public var ignoreList:Array;
        public var userRace:uint;
        public var realUser:Boolean;
        public var rankLimit:Array;
        public var roomMaster:Boolean;
        public var roomName:String;
        public var rankedMatch:Boolean;
        public var mpscreenMode:Boolean;
        public var optRestrict:Array;
        public var gameSet:uint;
        public var mpSTarget:MultiplayerScreen;
        public var auth:Boolean;
        public var allyPosT:uint;
        public var allySocket:uint;
        public var legitChecker:Boolean;
        public var i:*;
        public var i2:*;
        public var allyChat:Boolean;
        public var setObj:Object;
        public var gameRunning:Boolean;
        public var iWon:Boolean;
        public var gameQuitable:Boolean;
        public var FONT:MainFont2;
        public var DTIM:Timer;
        public var yugoSlav:uint;
        public var winSave:uint;
        public var TGYUJHI:Timer;
        public var shakeStr:Number;
        public var shakeDecay:Number;
        public var shakeOsci:Number;
        public var shakeNow:Number;
        public var GameKon:gameKon;
        public var gameRun:Boolean;
        public var DisplayKon:displayKon;
        public var DisplayField:Sprite;
        public var GD3:groundDisplay3;
        public var mainPosY:Number;
        public var unitDisplay:Sprite;
        public var effectsDisplay:Sprite;
        public var screenWidth:Number;
        public var battleWidth:Number;
        public var screenPoint:Number;
        public var endPoint1:Number;
        public var endPoint2:Number;
        public var BaseKon:baseKon;
        public var secondLayer:groundDisplay2;
        public var i6:*;
        public var TICS:Timer;
        public var playerControl:*;
        public var j:*;
        public var boundLimit:Number;
        public var minBound:uint;
        public var maxBound:uint;
        public var mouseAccel:Number;
		public var mouseAccelFaster:Number;
        public var mouseMaxVel:Number;
		public var mouseMaxVelFaster:Number;
        public var mouseVel:Number;
        public var teamWin:Team;
        public var winGame:Boolean;
        public var aiSetArray:Array;
        public var aiSingArray:Array;
        public var bh:*;
        public var b:*;
        public var dif:uint;
        public var be:uint;
        public var v2:*;
		private var smartFox:SmartFoxClient;
        public var aiProfile:uint;
        public var mouseLasso:Sprite;
        public var drawing:Boolean;
        public var setRectx:Number;
        public var setRecty:Number;
        public var screenGoLeft:Boolean;
        public var screenGoRight:Boolean;
        public var hotkeyArray:Array;
        public var hotbutArray:Array;
        public var uiGlow:GlowFilter;
        public var uiGlowIn:GlowFilter;
        public var uiGlowIn2:GlowFilter;
        public var fg:*;
        public var uiCombatTipOn:Array;
        public var uiCombatTipOff:Array;
        public var cText:tipObject;

        public function MainTimeline()
        {
            addFrameScript(0, frame1, 1, frame2, 2, frame3, 3, frame4, 4, frame5, 5, frame6, 6, frame7, 15, frame16, 16, frame17, 17, frame18, 18, frame19, 19, frame20, 20, frame21, 21, frame22, 22, frame23, 23, frame24, 25, frame26, 26, frame27, 27, frame28, 28, frame29, 29, frame30, 30, frame31, 31, frame32, 32, frame33, 33, frame34, 34, frame35);
        }

        public function PL_LOADED(event:Event):void
        {
            completedTheLoad();
            Mouse.show();
        }

        public function PL_LOADING(event:ProgressEvent):void
        {
            var iii2:*;
            Mouse.show();
            var pcent:Number = (event.bytesLoaded / event.bytesTotal);
            var loadPer:Number = Math.round((2009 + (pcent * 264)));
            dateMC.t.text = loadPer;
            for (iii2 in josefArray)
            {
                if (josefArray[iii2].D < loadPer)
                {
                    josefArray[iii2].oj.visible = true;
                };
            };
            loadBar.bar.width = (mW * pcent);
            dateMC.x = (120.6 + loadBar.bar.width);
            userNameId = event.bytesTotal;
            if (pcent >= 0.99)
            {
                completedTheLoad();
            };
        }

        public function completedTheLoad():void
        {
            var pcent:uint;
            var iii2:*;
            if (!completedTheL)
            {
                completedTheL = true;
                pcent = 1;
                loadBar.bar.width = (mW * pcent);
                dateMC.x = (120.6 + loadBar.bar.width);
                for (iii2 in josefArray)
                {
                    josefArray[iii2].oj.visible = true;
                };
                this.loaderInfo.removeEventListener(ProgressEvent.PROGRESS, PL_LOADING);
                this.loaderInfo.removeEventListener(Event.COMPLETE, PL_LOADED);
                nextFrame();
            };
        }

        public function showMouse(e:Event=null):void
        {
            Mouse.show();
        }

        public function playGame(Event:MouseEvent):void
        {
            button_play.removeEventListener(MouseEvent.MOUSE_UP, playGame);
            removeChild(adBox);
            stage.frameRate = 30;
            play();
        }

        public function loadComplete(e:Event):void
        {
            agi = e.currentTarget.content;
            addChild(agi);
            agi.init(devKey, gameKey);
        }

        public function renDone():void
        {
            play();
        }

        public function checkAllValid(te:TimerEvent=null):void
        {
            if (UnitData.checkData())
            {
                errorInData();
            }
            else
            {
                if (OptionData.checkData())
                {
                    errorInData();
                };
            };
        }

        public function errorInData():void
        {
            dataTracer.DC("Error: Data altered.");
        }

        public function startSinglePlayer(Event:MouseEvent):void
        {
            singlePlayerMode = true;
            nextFrame();
        }

        public function startMissionPlayer(Event:MouseEvent):void
        {
            singlePlayerMode = true;
            gotoAndStop("MISSION", "SCENE");
        }

        public function startMultiPlayer(_arg_1:MouseEvent):void
        {
			var ServerStatusCheck:URLLoader;
            if (((DomainChecker.isDomain(stage, "armorgames.com", "ungrounded.net", "kongregate.com")) || (testMode)))
            {
                singlePlayerMode = false;
                MP_userName = (playerName = "Player");
                MP_team = 2;
                MP_color = 0;
                dataTracer.clearTracer();
                ServerStatusCheck = new URLLoader();
                ServerStatusCheck.addEventListener(Event.COMPLETE, completeHandler);
                ServerStatusCheck.load(new URLRequest("https://colony-game.000webhostapp.com/status.php"));
                gotoAndStop("SERVER", "SCENE");
            }
            else
            {
                singlePlayerMode = false;
                MP_userName = (playerName = "Player");
                MP_team = 2;
                MP_color = 0;
                dataTracer.clearTracer();
                ServerStatusCheck = new URLLoader();
                ServerStatusCheck.addEventListener(Event.COMPLETE, completeHandler);
                ServerStatusCheck.load(new URLRequest("https://colony-game.000webhostapp.com/status.php"));
                gotoAndStop("SERVER", "SCENE");
            };
        }

        public function loadGameGo(a:uint):void
        {
            singleLevel = a;
            if (a == 1)
            {
                tutLev = true;
            };
            playerName = nameBox.text;
            clientPlayer[0] = combo1.selectedItem.data;
            gotoAndStop("Game", "SCENE");
        }

        public function startSing1(e:MouseEvent):void
        {
            loadGameGo(1);
        }

        public function startSing2(e:MouseEvent):void
        {
            loadGameGo(2);
        }

        public function startSing3(e:MouseEvent):void
        {
            loadGameGo(3);
        }

        public function startSing4(e:MouseEvent):void
        {
            loadGameGo(4);
        }

        public function startSing5(e:MouseEvent):void
        {
            loadGameGo(5);
        }

        public function gotoMission1(me:MouseEvent):void
        {
            playerName = "Cpt. Baylet";
            clientPlayer = new Array(2, 1, 1);
            gotoStory(0, 1);
        }

        public function gotoMission2(me:MouseEvent):void
        {
            playerName = "Jetzul";
            clientPlayer = new Array(0, 3, 3);
            gotoStory(1, 2);
        }

        public function gotoMission3(me:MouseEvent):void
        {
            playerName = "Cpt. Baylet";
            clientPlayer = new Array(2, 1, 1);
            gotoStory(2, 3);
        }

        public function gotoMission4(me:MouseEvent):void
        {
            playerName = "Jetzul";
            clientPlayer = new Array(0, 3, 3);
            gotoStory(3, 4);
        }

        public function gotoMission5(me:MouseEvent):void
        {
            playerName = "Cpt. Baylet";
            clientPlayer = new Array(2, 1, 1);
            gotoStory(4, 5);
        }

        public function gotoMission6(me:MouseEvent):void
        {
            playerName = "Moston";
            clientPlayer = new Array(1, 1, 1);
            gotoStory(5, 6);
        }
		
        public function gotoMission7(me:MouseEvent):void
        {
            playerName = "Moston";
            clientPlayer = new Array(1, 1, 1);
            gotoStory(6, 7);
        }

        public function gotoStory(a:uint, b:uint):void
        {
            storySetter = a;
            missionLevel = b;
            singlePlayerMode = true;
            singleLevel = (b + 5);
            missionGo = true;
            missionOn = true;
            gotoAndStop("Story", "SCENE");
        }

        public function s_Con0(me:MouseEvent):void
        {
            startMpConnect(0, true);
        }

        public function s_Con1(me:MouseEvent):void
        {
            startMpConnect(1, true);
        }

        public function s_Con2(me:MouseEvent):void
        {
            startMpConnect(0, true);
        }

        public function startMpConnect(a:uint, smartFox:Boolean=false):void
        {
            var serverGo:String = onlineServers[a];
            if (smartFox)
            {
                mpKon.foxMode = true;
            }
            else
            {
                mpKon.foxMode = false;
            };
            mpKon.doConnect(serverGo);
            mpKon.eventSub(_e.RECEIVE_SOCKET_ID, connected);
            dataTracer.progressing = false;
            stage.addEventListener("CLOSETRACER", stopTheJoin, false, 0, true);
            addChild(DataTracer);
            dataTracer.update("Connecting to Custom Server..");
            MP_r2j = true;
        }

        public function connected(be:*):void
        {
            if (MP_r2j)
            {
                dataTracer.update("Getting Server Status...");
                if (!mpKon.foxMode)
                {
                    mpKon.eventSub(_e.RECEIVE_STATS, receiveStatsHandler);
                }
                else
                {
                    foxJoin();
                };
            };
        }

        public function foxJoin():void
        {
            mpKon.eventRem(_e.RECEIVE_SOCKET_ID, connected);
            dataTracer.progressing = false;
            removeChild(DataTracer);
            MP_r2j = false;
            stage.removeEventListener("CLOSETRACER", stopTheJoin);
            dataTracer.initAfkClock();
            gotoAndStop("mpAnon", "SCENE");
        }

        public function receiveStatsHandler(be:BlossomEvent=null):void
        {
            var users:int;
            if (MP_r2j)
            {
                users = be.raw.users;
                if (users < 300)
                {
                    mpKon.eventRem(_e.RECEIVE_SOCKET_ID, connected, true);
                    dataTracer.progressing = false;
                    removeChild(DataTracer);
                    MP_r2j = false;
                    stage.removeEventListener("CLOSETRACER", stopTheJoin);
                    dataTracer.initAfkClock();
                    gotoAndStop("mpLogin", "SCENE");
                }
                else
                {
                    dataTracer.update("This server is full, please try a different one :(");
                    dataTracer.suppress();
                    mpKon.close();
                };
            };
        }

        public function stopTheJoin(e:chatEvent):void
        {
            MP_r2j = false;
            stage.removeEventListener("CLOSETRACER", stopTheJoin);
        }

        public function goAGHandler(me:MouseEvent):void
        {
            var r:URLRequest = new URLRequest("https://armorgames.com/play/4264/colony");
            navigateToURL(r, "_blank");
        }

        public function nextComic(me:MouseEvent):void
        {
            comicPage++;
            comicLoad.nextFrame();
            if (comicPage == comicPageMax)
            {
                mis_next.visible = false;
                mis_beg.visible = true;
                mis_next.removeEventListener(MouseEvent.CLICK, nextComic);
                mis_beg.addEventListener(MouseEvent.CLICK, endComic);
            };
        }

        public function endComic(me:MouseEvent):void
        {
            mis_beg.removeEventListener(MouseEvent.CLICK, endComic);
            endComicMode();
        }

        public function endComicMode():void
        {
            removeChild(comicLoad);
            mis_beg.visible = false;
            if (missionGo)
            {
                this.gotoAndStop("Game", "SCENE");
            }
            else
            {
                if (missionLevel == 7)
                {
                    this.gotoAndStop("MISSION", "SCENE");
                }
                else
                {
                    this.gotoAndStop("MISSION", "SCENE");
                };
            };
        }

        public function killAllEvents():void
        {
            but_login.removeEventListener(MouseEvent.CLICK, b_loginHand);
            but_register.removeEventListener(MouseEvent.CLICK, b_registerHand);
            but_guest.removeEventListener(MouseEvent.CLICK, b_guestHand);
            but_exit.removeEventListener(MouseEvent.CLICK, b_exitHand);
        }

        public function remMeHand(me:MouseEvent):void
        {
            if (reMe.selected)
            {
                rememberMe = true;
                sav_user = in_name.text;
                sav_pass = in_pass.text;
            }
            else
            {
                rememberMe = false;
            };
            saveGame.data.sav_user = sav_user;
            saveGame.data.sav_pass = sav_pass;
            saveGame.data.rememberMe = rememberMe;
            saveGame.flush();
        }

        public function loginSuccessHandler(be:BlossomEvent):void
        {
            userID = be.userID;
            MP_userName = be.userName;
            var moderator:Boolean = be.moderator;
            realUser = true;
            dataTracer.update("Success! Retrieving data...");
            var varList:Array = new Array("userData", "userRace");
            SocketManager.socket.getUserVars(varList, SocketManager.socket.socketID);
            SocketManager.socket.addEventListener(BlossomEvent.RECEIVE_USER_VARS, receiveUserVarsHandler, false, 0, true);
        }

        public function receiveUserVarsHandler(be:BlossomEvent):void
        {
            var vars:Object;
            dataTracer.hideTracer();
            if (be.vars.userData == null)
            {
                vars = new Object();
                vars.userData = userData;
                SocketManager.socket.setUserVars(vars);
            }
            else
            {
                userData = be.vars.userData;
            };
            if (be.vars.ignoreList == null)
            {
                vars = new Object();
                vars.ignoreList = ignoreList;
                SocketManager.socket.setUserVars(vars);
            }
            else
            {
                ignoreList = be.vars.ignoreList;
            };
            if (be.vars.userRace == null)
            {
                vars = new Object();
                vars.userRace = userRace;
                SocketManager.socket.setUserVars(vars);
            }
            else
            {
                userRace = be.vars.userRace;
            };
            if (be.vars.friendList == null)
            {
                vars = new Object();
                vars.friendList = friendList;
                SocketManager.socket.setUserVars(vars);
            }
            else
            {
                friendList = be.vars.friendList;
            };
            dataTracer.progressing = false;
            killAllEvents();
            gotoAndStop("mpLobby", "SCENE");
        }

        public function loginErrorHandler(be:BlossomEvent):void
        {
            dataTracer.update(("Error logging in: " + be.error));
            dataTracer.progressing = false;
        }

        public function b_loginHand(e:MouseEvent):void
        {
            dataTracer.clearTracer();
            dataTracer.update("Logging in...");
            addChild(DataTracer);
            SocketManager.socket.login(in_name.text, in_pass.text);
            SocketManager.socket.addEventListener(BlossomEvent.LOGIN_SUCCESS, loginSuccessHandler, false, 0, true);
            SocketManager.socket.addEventListener(BlossomEvent.LOGIN_ERROR, loginErrorHandler, false, 0, true);
        }

        public function b_registerHand(e:MouseEvent):void
        {
            killAllEvents();
            gotoAndStop("mpRegister", "SCENE");
        }

        public function b_guestHand(e:MouseEvent):void
        {
            killAllEvents();
            var letterArr:Array = new Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
            var bah:String = letterArr[Math.round((Math.random() * (letterArr.length - 1)))];
            MP_userName = (("Guest_" + bah) + Math.round((Math.random() * 9999)));
            gotoAndStop("mpLobby", "SCENE");
        }

        public function b_exitHand(e:MouseEvent):void
        {
            dataTracer.suppress();
            dataTracer.endAfkClock();
            SocketManager.close();
            gotoAndStop("OutOf", "SCENE");
        }

        public function b_registerHand2(e:MouseEvent):void
        {
            if (re_pass.text == re_pass2.text)
            {
                if (checkNameValid(re_name.text))
                {
                    SocketManager.socket.register(re_name.text, re_pass.text, re_email.text);
                    SocketManager.socket.addEventListener(BlossomEvent.REGISTER_SUCCESS, registerSuccessHandler, false, 0, true);
                    SocketManager.socket.addEventListener(BlossomEvent.REGISTER_ERROR, registerErrorHandler, false, 0, true);
                    dataTracer.clearTracer();
                    dataTracer.update("Registering new account...");
                    addChild(DataTracer);
                }
                else
                {
                    dataTracer.throwError("Names can only contain letters and numbers. It cannot contain spaces or any special characters.");
                };
            }
            else
            {
                dataTracer.throwError("The passwords you entered do not match.");
            };
        }

        public function checkNameValid(a:String):*
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
            if (a.indexOf("Guest") != -1)
            {
                nuller = true;
            };
            if (nuller)
            {
                return (false);
            };
            return (true);
        }

        public function registerSuccessHandler(be:BlossomEvent):void
        {
            dataTracer.progressing = false;
            SocketManager.socket.removeEventListener(BlossomEvent.REGISTER_SUCCESS, registerSuccessHandler);
            SocketManager.socket.removeEventListener(BlossomEvent.REGISTER_ERROR, registerErrorHandler);
            removeChild(DataTracer);
            justReg = true;
            regName = re_name.text;
            regPass = re_pass.text;
            gotoAndStop("mpLogin", "SCENE");
        }

        public function registerErrorHandler(be:BlossomEvent):void
        {
            dataTracer.progressing = false;
            SocketManager.socket.removeEventListener(BlossomEvent.REGISTER_SUCCESS, registerSuccessHandler);
            SocketManager.socket.removeEventListener(BlossomEvent.REGISTER_ERROR, registerErrorHandler);
            dataTracer.update(("Error registering: " + be.error));
        }

        public function loginHand3(e:MouseEvent=null):*
        {
            dataTracer.progressing = false;
            mpKon.userName = (MP_userName = "");
            mpKon.zoneIn = true;
            guestMode = true;
            gotoAndStop("mpLobby", "SCENE");
        }

        public function loginHand4(e:MouseEvent=null):*
        {
            if (((DomainChecker.isDomain(stage, "armorgames.com", "ungrounded.net")) || (testMode)))
            {
                if (agiLogged)
                {
                    innerCall();
                }
                else
                {
                    addChild(agi);
                    agi.showLogin(loginCallback);
                };
            }
            else
            {
                nextFrame();
            };
        }

        public function loginCallback(obj:Object):void
        {
            if (obj.success)
            {
                agiUserName = obj.username;
                agiLogged = true;
                innerCall();
            };
        }

        public function innerCall():void
        {
            mpKon.userName = (MP_userName = agiUserName);
            dataTracer.progressing = false;
            mpKon.zoneIn = true;
            addEventListener(Event.ENTER_FRAME, runTickerUSD);
            dataTracer.throwError("Loading..");
            guestMode = false;
        }

        public function runTickerUSD(e:Event):void
        {
            tickerUSD--;
            if (tickerUSD == 0)
            {
                tickerUSD = 30;
                initUserData();
                agi.retrieveUserData(callBack2, "USD");
                removeEventListener(Event.ENTER_FRAME, runTickerUSD);
            };
        }

        public function callBack2(obj:Object):void
        {
            initUserData();
            if (obj.data == null)
            {
                agi.submitUserData("USD", userData);
            }
            else
            {
                userData = obj.data;
                if (userData.race == null)
                {
                    userData.race = 2;
                };
            };
            MP_team = (userRace = userData.race);
            dataTracer.hideTracer();
            realUser = true;
            gotoAndStop("mpLobby", "SCENE");
        }

        public function initUserData():void
        {
            userData = new Object();
            friendList = new Array();
            ignoreList = new Array();
            userRace = 2;
            userData.gamesPlayed = 0;
            userData.gamesWon = 0;
            userData.gamesConsecutiveWins = 0;
            userData.rank = 1;
            userData.race = 2;
            userData.pts = 0;
            userData.awards = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            rankLimit = [100, 500, 1500, 3000, 6000, 10000, 15000, 20000, 30000];
            realUser = false;
        }

        public function b_exit7Hand(me:MouseEvent):void
        {
            prevFrame();
        }

        public function adjustName(a:String):*
        {
            if (a == "NONE")
            {
                legitChecker = false;
                return ("None");
            };
            if (a == "COMPUTER1")
            {
                legitChecker = false;
                return ("Easy CPU");
            };
            if (a == "COMPUTER2")
            {
                return ("Normal CPU");
            };
            if (a == "COMPUTER3")
            {
                return ("Hard CPU");
            };
            return (a);
        }

        public function resetFocus(e:Event):void
        {
            stage.focus = this;
            chatPanel.text = "";
        }

        public function endTheGame():void
        {
            var vars2:Object;
            if (gameRunning)
            {
                if (realUser)
                {
                    if (!singlePlayerMode)
                    {
                        if (rankedMatch)
                        {
                            userData.pts = (userData.pts + 10);
                            if (iWon)
                            {
                                userData.pts = (userData.pts + 20);
                                userData.gamesWon++;
                                userData.gamesConsecutiveWins = (winSave + 1);
                                if (userData.gamesConsecutiveWins > 3)
                                {
                                    userData.pts = (userData.pts + ((userData.gamesConsecutiveWins - 3) * 15));
                                };
                                if (userData.rank < 10)
                                {
                                    if (userData.pts >= rankLimit[(userData.rank - 1)])
                                    {
                                        userData.rank++;
                                    };
                                };
                            };
                            if (!mpKon.foxMode)
                            {
                                vars2 = new Object();
                                vars2.userData = userData;
                                SocketManager.socket.setUserVars(vars2);
                            }
                            else
                            {
                                if (userData.gamesPlayed < userData.gamesWon)
                                {
                                    userData.gamesPlayed = userData.gamesWon;
                                };
                                if (((!(agi == null)) && (!(guestMode))))
                                {
                                    agi.submitUserData("USD", userData);
                                };
                            };
                        };
                    };
                };
                promptBox.p.text = "The game has ended.";
                try
                {
                    removeChild(promptBox);
                }
                catch(e:Error)
                {
                };
                addChild(promptBox);
                promptBox.b3.visible = true;
                promptBox.b1.visible = false;
                promptBox.b2.visible = false;
                promptBox.b3.p.text = "CONTINUE";
                promptBox.b3.addEventListener(MouseEvent.CLICK, terminateGame);
                gameRunning = false;
            };
        }

        public function quitTheGame():void
        {
            if (((gameRunning) && (gameQuitable)))
            {
                promptBox.p.text = "Are you sure you want to quit?";
                gameQuitable = false;
                addChild(promptBox);
                promptBox.b3.visible = false;
                promptBox.b1.visible = true;
                promptBox.b2.visible = true;
                promptBox.b1.p.text = "YES";
                promptBox.b2.p.text = "NO";
                promptBox.b1.addEventListener(MouseEvent.CLICK, terminateGame);
                promptBox.b2.addEventListener(MouseEvent.CLICK, backToGame);
            };
        }

        public function backToGame(e:MouseEvent):void
        {
            removeChild(promptBox);
            gameQuitable = true;
        }

        public function doChat(t:String, n:String, c:uint, d:String=null):*
        {
            soundKon.playSound(3, 3, true);
            soundKon.playSound(3, 3, false);
            var chatText:TextField = new TextField();
            if (d == null)
            {
                chatText.htmlText = ((((((("<font color='#FFFFFF'>" + n) + ": </font> ") + "<font color='#") + colorChat[c]) + "'>") + t) + "</font>");
            }
            else
            {
                chatText.htmlText = d;
            };
            var chatFormat:TextFormat = new TextFormat();
            chatText.width = 0x0100;
            chatText.embedFonts = true;
            chatText.autoSize = TextFieldAutoSize.LEFT;
            chatText.multiline = true;
            chatText.wordWrap = true;
            chatFormat.font = FONT.fontName;
            chatFormat.size = 14;
            chatText.setTextFormat(chatFormat);
            chatBox.innerBox.addChildAt(chatText, 0);
            chatText.y = 0;
            var i:* = 0;
            while (i < chatBox.innerBox.numChildren)
            {
                chatBox.innerBox.getChildAt(i).y = (chatBox.innerBox.getChildAt(i).y - chatText.height);
                i++;
            };
            if (chatBox.innerBox.numChildren > 25)
            {
                chatBox.innerBox.removeChildAt(25);
            };
            chatBox.maxY = chatBox.innerBox.height;
            chatBox.innerBox.y = chatBox.minY;
            chatBox.updateNavBar();
        }

        public function buddyMsg(s:String):void
        {
            doChat("", "", 0, s);
        }

        public function disconnectedHandler():void
        {
            if (gameRunning)
            {
                tg();
                gotoAndStop("START", "SCENE");
            }
            else
            {
                if (mpscreenMode)
                {
                    gotoAndStop("START", "SCENE");
                };
            };
        }

        public function terminateGame(event:MouseEvent):void
        {
            removeChild(promptBox);
            promptBox.b3.removeEventListener(MouseEvent.CLICK, terminateGame);
            tg();
            gotoAndStop("END", "SCENE");
        }

        public function tg():void
        {
            DTIM.stop();
            DTIM = null;
            mpKon.buddyMsg = null;
            _t.stopTicker();
            if (musicOn == true)
            {
                musicKon.startFader(0, 2);
            };
            if (gameKon.playerNow.team == teamWin)
            {
                winGame = true;
            }
            else
            {
                winGame = false;
            };
            mpKon.zoneIn = true;
            chatBody.killAll();
            removeEventListener(Event.ENTER_FRAME, updateUI);
            removeEventListener(Event.ENTER_FRAME, screenScroll);
            removeEventListener(MouseEvent.MOUSE_DOWN, beginDraw);
            removeEventListener(MouseEvent.MOUSE_UP, endDraw);
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyD);
            stage.removeEventListener(KeyboardEvent.KEY_UP, keyU);
            stage.removeEventListener(Event.DEACTIVATE, keyC);
            stage.removeEventListener(Event.ACTIVATE, resetFocus);
            if (!singlePlayerMode)
            {
                mpKon.foxRoom("MLX_6_Limbo");
            };
            gameQuitable = true;
            GameKon.killAll();
            GameKon.stopData();
            removeChild(GD3);
            DisplayField.removeChild(secondLayer);
            DisplayField.removeChild(unitDisplay);
            DisplayField.removeChild(effectsDisplay);
            removeChild(DisplayField);
            DisplayField = null;
            unitDisplay = null;
            effectsDisplay = null;
            GameKon = null;
        }

        public function incrDT(te:TimerEvent):void
        {
            var PPL:playerKon;
            if (yugoSlav < 100)
            {
                yugoSlav = (yugoSlav + 5);
            }
            else
            {
                yugoSlav = (yugoSlav + 1);
            };
            var bgi:* = 0;
            while (bgi < 5)
            {
                PPL = GameKon[("player" + bgi)];
                if (PPL.mcd < (PPL.mce + 5))
                {
                    PPL.mcd = (PPL.mcd + 0.25);
                };
                bgi++;
            };
        }

        public function addMPthings():void
        {
        }

        public function removeMPthings():void
        {
        }

        public function sendResInfo(te:TimerEvent):void
        {
            var vars:Object = new Object();
            vars.resArray = new Array(playerControl.r_m, playerControl.r_p, playerControl.r_e, playerControl.r_i);
            vars.pos = playerControl.POS;
            gameKon.theRoot.gameRoom.sendToRoom(vars, false, "alignResource");
        }

        public function alignResourceHand(be:BlossomEvent):void
        {
            var gj:*;
            var player:* = GameKon[("player" + be.data.pos)];
            var pRA:Array = new Array(player.r_m, player.r_p, player.r_e, player.r_i);
            for (gj in be.data.resArray)
            {
                if (pRA[gj] < be.data.resArray[gj])
                {
                    player.addRes(pRA, 1);
                };
            };
        }

        public function userExitHand(be:BlossomEvent):void
        {
            tg();
        }

        public function userLeftHandler(be:BlossomEvent):void
        {
            var i2:*;
            var leaverName:String;
            var leaverSocket:* = be.socketID;
            for (i2 in allPlayers)
            {
                if (allPlayers[i2].ID == leaverSocket)
                {
                    leaverName = allPlayers[i2].NAME;
                };
            };
            doChat((leaverName + " has left the game."), "System", 0);
        }

        public function userLeftHandlerFox(a:uint):void
        {
            var i2:*;
            var leaverName:String;
            var leaverSocket:* = a;
            for (i2 in allPlayers)
            {
                if (allPlayers[i2].ID == leaverSocket)
                {
                    leaverName = allPlayers[i2].NAME;
                };
            };
            doChat((leaverName + " has left the game."), "System", 0);
        }

        public function allyChatHandler(be:BlossomEvent):void
        {
            if (be.data.t != null)
            {
                gogoChat(be.data.i, be.data.t);
            };
            if (be.data.def)
            {
            };
            if (be.data.def2 != null)
            {
                if (be.data.def2)
                {
                    dataTracer.DC(jum);
                };
            };
        }

        public function OPFunction():void
        {
            dataTracer.DC(jum);
        }

        public function sendChatHandler(be:BlossomEvent):void
        {
            gogoChat(be.data.i, be.data.t);
        }

        public function gogoChat(id:uint, it:String):void
        {
            var i:*;
            var chat_pColor:*;
            var chat_pName:*;
            for (i in allPlayers)
            {
                if (allPlayers[i].POS == id)
                {
                    chat_pName = allPlayers[i].NAME;
                };
            };
            chat_pColor = id;
            doChat(it, chat_pName, chat_pColor);
        }

        public function updateIncomeHandler(be:BlossomEvent):void
        {
            var player:* = GameKon[("player" + be.data.pos)];
            player.setIncome(be.data.race);
        }

        public function removeIncomeListenerGO(te:TimerEvent):void
        {
            TGYUJHI.removeEventListener(TimerEvent.TIMER, removeIncomeListenerGO);
            TGYUJHI.stop();
            TGYUJHI = null;
        }

        public function createUnitHandler(be:BlossomEvent):void
        {
            realCreateUnit(be.data.pos, be.data.id, be.data.unitId, be.data.rand1, be.data.rand2, be.data.rand3, be.data.optionD);
        }

        public function updateOptionHandler():void
        {
        }

        public function realCreateUnit(a44:*, b44:uint, c44:*, d44:*, e44:*, f44:*, optionD:*):void
        {
            var nhj:*;
            var ayt:Boolean;
            var d2:*;
            var dv2:Number;
            var alreadyGotten:Boolean;
            var hg:*;
            var d:*;
            var player:* = GameKon[("player" + a44)];
            player.createGap++;
            var unoldver:Boolean = true;
            if (player != gameKon.playerNow)
            {
                if (optionD != null)
                {
                    d2 = optionData.LIST[optionD];
                    dv2 = d2.buildUnits.length;
                    player.addRes(0, -(Math.floor((d2[0] / dv2))));
                    player.addRes(1, -(Math.floor((d2[1] / dv2))));
                    player.addRes(2, -(Math.floor((d2[2] / dv2))));
                    player.addRes(3, -(Math.floor((d2[4] / dv2))));
                    player.stock[d2.stockReq]--;
                }
                else
                {
                    unoldver = false;
                    alreadyGotten = false;
                    for (hg in optionData.LIST)
                    {
                        if (optionData.LIST[hg].buildUnits != null)
                        {
                            if ((optionData.LIST[hg].buildUnits.length == 1))
                            {
                                if (((optionData.LIST[hg].buildUnits[0] == b44) && (!(alreadyGotten))))
                                {
                                    if (b44 == 5)
                                    {
                                        hg = 56;
                                    };
                                    d = optionData.LIST[hg];
                                    player.addRes(0, -(d[0]));
                                    player.addRes(1, -(d[1]));
                                    player.addRes(2, -(d[2]));
                                    player.addRes(3, -(d[4]));
                                    player.stock[d.stockReq]--;
                                    alreadyGotten = true;
                                };
                            };
                        };
                    };
                };
            };
            var def:Number = 0;
            var cArDef:Array = new Array(player.r_m, player.r_p, player.r_e, player.r_i);
            for (nhj in cArDef)
            {
                if (cArDef[nhj] < 0)
                {
                    def = (def - cArDef[nhj]);
                };
            };
            ayt = true;
            unitKon.addUnit(player, b44, false, c44, d44, e44, f44);
        }

        public function killUnitHandler(be:BlossomEvent):void
        {
            killUnitReal(be.data.p, be.data.id, be.data.ran);
        }

        public function cabinet(player:playerKon, mss:String):void
        {
            var i3:*;
            var i2:*;
            for (i3 in player.team.all)
            {
                if (((!(i3 == 0)) && (player.team.all[i3].player == player)))
                {
                    // unitKon.killOffUnit(player.team.all[i3].unitId, null);
                };
            };
            if (player.hackSend)
            {
                if (!player.desync)
                {
                    for (i2 in allPlayers)
                    {
                        if (allPlayers[i2].POS == player.POS)
                        {
                            doChat((allPlayers[i2].NAME + mss), "System", 0);
                        };
                    };
                };
                player.desync = true;
                player.hackSend = false;
            };
        }

        public function killUnitReal(p:*, id:*, ran:*):void
        {
            var pKiller:playerKon;
            try
            {
                if (p > 0)
                {
                    pKiller = GameKon[("player" + p)];
                    if (!pKiller.desync)
                    {
                        unitKon.killOffUnit(id, pKiller, ran);
                    };
                }
                else
                {
                    unitKon.killOffUnit(id, null);
                };
            }
            catch(e:Error)
            {
            };
        }

        public function orderHandler(be:BlossomEvent):void
        {
            gameKon.doUnitOption(be.data.id, be.data.orderArray);
        }

        public function missileHandler(be:BlossomEvent):void
        {
            realMissileHandler(be.data.pos, be.data.optionD, be.data.tar, be.data.px, be.data.py);
        }

        public function realMissileHandler(userPos:*, optionD:*, tar:*, px:Number, py:Number):void
        {
            var nhj:*;
            var player:*;
            var d2:*;
            var bypassD:Boolean;
            if (!bypassD)
            {
                player = GameKon[("player" + userPos)];
                if (player != gameKon.playerNow)
                {
                    if (optionD != null)
                    {
                        d2 = optionData.LIST[optionD];
                        player.addRes(0, -(Math.floor(d2[0])));
                        player.addRes(1, -(Math.floor(d2[1])));
                        player.addRes(2, -(Math.floor(d2[2])));
                        player.addRes(3, -(Math.floor(d2[4])));
                        player.stock[d2.stockReq]--;
                    };
                };
            };
            var def:Number = 0;
            var cArDef:Array = new Array(player.r_m, player.r_p, player.r_e, player.r_i);
            for (nhj in cArDef)
            {
                if (cArDef[nhj] < 0)
                {
                    def = (def - cArDef[nhj]);
                };
            };
            unitKon.addMissile(tar, px, py);
        }

        public function runShake(e:Event):void
        {
            shakeNow = (shakeNow + shakeOsci);
            shakeStr = (shakeStr / shakeDecay);
            if (shakeStr < 0.5)
            {
                shakeStr = 0;
                stage.removeEventListener(Event.ENTER_FRAME, runShake);
                DisplayField.y = mainPosY;
            }
            else
            {
                DisplayField.y = (mainPosY + (shakeStr * Math.sin(shakeNow)));
            };
        }

        public function startShake(a:Number, b:Number, c:Number):void
        {
            shakeStr = a;
            shakeDecay = b;
            shakeOsci = c;
            shakeNow = (Math.random() * 10);
            stage.addEventListener(Event.ENTER_FRAME, runShake, false, 0, true);
        }

        public function sendIncomeStatus(e:TimerEvent=null):void
        {
            var vars:Object = new Object();
            vars.race = clientPlayer[0];
            vars.pos = clientPlayer[1];
            TICS.removeEventListener(TimerEvent.TIMER, sendIncomeStatus);
            mpKon.sendOff(vars, false, "updateIncome");
        }

        public function updateUI(event:Event):void
        {
            upUIHand();
        }

        public function upUIHand():void
        {
            r_p.text = playerControl.r_p;
            r_m.text = playerControl.r_m;
            r_e.text = playerControl.r_e;
            r_i.text = playerControl.r_i;
            r_p1.text = ("" + GameKon.player1.r_p);
            r_m1.text = ("" + GameKon.player1.r_m);
            r_e1.text = ("" + GameKon.player1.r_e);
            r_i1.text = ("" + GameKon.player1.r_i);
            r_p2.text = ("" + GameKon.player2.r_p);
            r_m2.text = ("" + GameKon.player2.r_m);
            r_e2.text = ("" + GameKon.player2.r_e);
            r_i2.text = ("" + GameKon.player2.r_i);
            r_p3.text = ("" + GameKon.player3.r_p);
            r_m3.text = ("" + GameKon.player3.r_m);
            r_e3.text = ("" + GameKon.player3.r_e);
            r_i3.text = ("" + GameKon.player3.r_i);
            r_p4.text = ("" + GameKon.player4.r_p);
            r_m4.text = ("" + GameKon.player4.r_m);
            r_e4.text = ("" + GameKon.player4.r_e);
            r_i4.text = ("" + GameKon.player4.r_i);
        }

        public function screenScroll(event:Event):void
        {
            if ((((mouseY <= 400) && (mouseX < minBound)) || (screenGoLeft)))
            {
                if (screenPoint > endPoint1)
                {
                    mouseVel = (mouseVel - mouseAccel);
                    if (mouseVel < -(mouseMaxVel))
                    {
                        mouseVel = -(mouseMaxVel);
                    };
                }
                else
                {
                    mouseVel = 0;
                };
            }
            else
            {
                if ((((mouseY <= 400) && (mouseX > maxBound)) || (screenGoRight)))
                {
                    if (screenPoint < endPoint2)
                    {
                        mouseVel = (mouseVel + mouseAccel);
                        if (mouseVel > mouseMaxVel)
                        {
                            mouseVel = mouseMaxVel;
                        };
                    }
                    else
                    {
                        mouseVel = 0;
                    };
                }
                else
                {
                    if (mouseVel !== 0)
                    {
                        mouseVel = (mouseVel - (mouseAccel * (mouseVel / Math.abs(mouseVel))));
                    };
                };
            };
            screenPoint = (screenPoint + mouseVel);
            if (screenPoint > endPoint2)
            {
                screenPoint = endPoint2;
            };
            if (screenPoint < endPoint1)
            {
                screenPoint = endPoint1;
            };
            DisplayField.x = -(screenPoint);
            var screenSurrond:Number = ((2 * (screenPoint / (endPoint2 - endPoint1))) - 1);
            soundKon.surround(screenSurrond);
            secondLayer.x = (screenPoint / 2);
            GD3.x = (-(screenPoint) / 4);
        }

        public function mission2StartAi():void
        {
            gameKon.theRoot.GameKon.player1.AI.AiStrategy.forceTech = 4;
            gameKon.theRoot.GameKon.player2.AI.AiStrategy.forceTech = 4;
            gameKon.theRoot.GameKon.player4.AI.AiStrategy.forceTech = 5;
        }

        public function beginDraw(event:MouseEvent):void
        {
            if (mouseY <= 400)
            {
                setRectx = mouseX;
                setRecty = mouseY;
                addEventListener(Event.ENTER_FRAME, doDraw);
            };
        }

        public function endDraw(event:MouseEvent):void
        {
            var selectPool:Array;
            var z:*;
            if (((mouseLasso.width > 3) || (mouseLasso.height > 3)))
            {
                selectPool = new Array();
                for (z in gameKon.playerNow.team.all)
                {
                    if (z != 0)
                    {
                        if (mouseLasso.hitTestObject(gameKon.playerNow.team.all[z]))
                        {
                            if (gameKon.playerNow.team.all[z].player == gameKon.playerNow)
                            {
                                selectPool.push(gameKon.playerNow.team.all[z]);
                            };
                        };
                    };
                    if (selectPool.length > 0)
                    {
                        displayKon.updateUnit(selectPool);
                    };
                };
            };
            mouseLasso.graphics.clear();
            removeEventListener(Event.ENTER_FRAME, doDraw);
        }

        public function doDraw(event:Event):void
        {
            mouseLasso.graphics.clear();
            mouseLasso.graphics.lineStyle(1, 6750054);
            mouseLasso.graphics.drawRect(setRectx, setRecty, (mouseX - setRectx), (mouseY - setRecty));
        }

        public function keyD(event:KeyboardEvent):void
        {
            var juh:*;
            var uNameRank:String;
				
            var subber:Array;
            var tt:String;
            var nextString:String;
            var bf:*;
            var buddy:Object;
            var onMode:String;
            var vars:Object;
            var vars6:Object;
            if (event.keyCode == 27)
            {
                stage.focus = this;
                chatHider.visible = true;
                chatPanel.text = "";
            };
            if (event.keyCode == 16)
            {
                gameKon.shiftToggle = true;
                updateUIOptions();
            };
            if (stage.focus == this)
            {
                if (event.keyCode == 88)
                {
                    if (gameKon.rallyOn)
                    {
                        gameKon.rallyOn = false;
                    }
                    else
                    {
                        gameKon.rallyOn = true;
                    };
                    updateUIOptions();
                };
                if (event.keyCode == 67)
                {
                    if (allyChat)
                    {
                        allyChat = false;
                        chatToWho.text = "To All:";
                    }
                    else
                    {
                        allyChat = true;
                        chatToWho.text = "To Ally:";
                    };
                    updateUIOptions();
                };
                for (juh in hotkeyArray)
                {
                    if (event.keyCode == this.hotkeyArray[juh])
                    {
                        if (gameKon.selectedBuilding == null)
                        {
                            hotbutArray[juh].doReal();
                        }
                        else
                        {
                            if (((gameKon.selectedBuilding.working) && (gameKon.selectedBuilding.ownBy == gameKon.playerNow)))
                            {
                                gameKon.doOption(null, true, false, gameKon.playerNow, gameKon.selectedBuilding);
                                hotbutArray[juh].doReal();
                            }
                            else
                            {
                                hotbutArray[juh].doReal();
                            };
                        };
                    };
                };
                if (((event.keyCode == 37) || (event.keyCode == 65)))
                {
                    screenGoLeft = true;
                };
				
				if (event.keyCode == 71)
				{
					screenPoint = endPoint2;
					mouseVel = 0;
				};
				
				if (event.keyCode == 70)
				{
					screenPoint = endPoint1;
					mouseVel = 0;
				};
				
                if (((event.keyCode == 39) || (event.keyCode == 68)))
                {
                    screenGoRight = true;
                };
            };
            if (event.keyCode == 13)
            {
                if (stage.focus == chatPanel)
                {
                    stage.focus = this;
                    chatHider.visible = true;
                    if (((!(chatPanel.text == "")) && (!(chatPanel.text == "< Type here or press Enter to chat >"))))
                    {
                        chatBody.dealWith(chatPanel.text);
                        if (singlePlayerMode)
                        {
                            doChat(chatPanel.text, playerName, clientPlayer[2]);
                            chatPanel.text = "";
                        }
                        else
                        {
                            if (chatPanel.text.indexOf("/w") == 0)
                            {
                                subber = chatPanel.text.split(" ", 3);
                                if (subber.length < 3)
                                {
                                    buddyMsg((('<font color="#FFFFFF">' + "Please type a message to send to this user..") + "</font>"));
                                }
                                else
                                {
                                    tt = chatPanel.text;
                                    nextString = tt.substr((1 + tt.indexOf(" ", 3)));
                                    mpKon.sendWhisper(subber[1], nextString);
                                };
                            }
                            else
                            {
                                if (chatPanel.text.indexOf("/add") == 0)
                                {
                                    uNameRank = chatPanel.text.substr(5);
                                    mpKon.fox.addBuddy(uNameRank);
                                    rankST = (((('<font color="#1C65CC">' + "Added ") + uNameRank) + " to your friend list.") + "</font>");
                                    doChat("", "", 0, rankST);
                                }
                                else
                                {
                                    if (chatPanel.text.indexOf("/remove") == 0)
                                    {
                                        uNameRank = chatPanel.text.substr(8);
                                        mpKon.fox.removeBuddy(uNameRank);
                                        rankST = (((('<font color="#1C65CC">' + "Removed ") + uNameRank) + " from your friend list.") + "</font>");
                                        doChat("", "", 0, rankST);
                                    }
                                    else
                                    {
                                        if (chatPanel.text.indexOf("/friendlist") == 0)
                                        {
                                            if (mpKon.fox.buddyList.length == 0)
                                            {
                                                buddyMsg((('<font color="#FFFFFF">' + "Your friend list is empty.") + "</font>"));
                                            }
                                            else
                                            {
                                                for (bf in mpKon.fox.buddyList)
                                                {
                                                    buddy = mpKon.fox.buddyList[bf];
                                                    if (buddy.isBlocked)
                                                    {
                                                        buddyMsg(((('<font color="#FFFFFF">' + buddy.name) + " is blocked.") + "</font>"));
                                                    }
                                                    else
                                                    {
                                                        if (buddy.isOnline)
                                                        {
                                                            onMode = "online.";
                                                            buddyMsg((((('<font color="#A1F056">' + buddy.name) + " is ") + onMode) + "</font>"));
                                                        }
                                                        else
                                                        {
                                                            onMode = "offline.";
                                                            buddyMsg((((('<font color="#E23125">' + buddy.name) + " is ") + onMode) + "</font>"));
                                                        };
                                                    };
                                                };
                                            };
                                        }
                                        else
                                        {
                                            if (chatPanel.text.indexOf("/block") == 0)
                                            {
                                                mpKon.blockBuddy(chatPanel.text.substr(7), true);
                                            }
                                            else
                                            {
                                                if (chatPanel.text.indexOf("/unblock") == 0)
                                                {
                                                    mpKon.blockBuddy(chatPanel.text.substr(9), false);
                                                }
                                                else
                                                {
                                                    vars = new Object();
                                                    vars.i = clientPlayer[1];
                                                    vars.t = chatPanel.text;
                                                    if (!allyChat)
                                                    {
                                                        mpKon.sendOff(vars, true, "sendChat");
                                                    }
                                                    else
                                                    {
                                                        if (mpKon.foxMode)
                                                        {
                                                            vars6 = new Object();
                                                            vars6.sub = vars;
                                                            vars6.id = "sendChat";
                                                            mpKon.fox.sendObjectToGroup(vars6, [mpKon.fox.myUserId]);
                                                        }
                                                        else
                                                        {
                                                            SocketManager.socket.sendToUser(SocketManager.socket.socketID, vars);
                                                        };
                                                        if (allySocket != 0)
                                                        {
                                                            vars6 = new Object();
                                                            vars6.sub = vars;
                                                            vars6.id = "sendChat";
                                                            mpKon.fox.sendObjectToGroup(vars6, [allySocket]);
                                                        };
                                                        chatPanel.text = "";
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                            chatPanel.text = "";
                        };
                    }
                    else
                    {
                        chatPanel.text = "";
                    };
                }
                else
                {
                    stage.focus = chatPanel;
                    if (allyChat)
                    {
                        chatToWho.text = "To Ally:";
                    }
                    else
                    {
                        chatToWho.text = "To All:";
                    };
                    chatHider.visible = false;
                };
            };
        }

        public function keyU(event:KeyboardEvent):void
        {
            if (event.keyCode == 16)
            {
                gameKon.shiftToggle = false;
                updateUIOptions();
            };
            if (((event.keyCode == 37) || (event.keyCode == 65)))
            {
                screenGoLeft = false;
            };
            if (((event.keyCode == 39) || (event.keyCode == 68)))
            {
                screenGoRight = false;
            };
        }

        public function keyC(event:Event):void
        {
            gameKon.shiftToggle = false;
            screenGoRight = false;
            screenGoLeft = false;
        }

        public function updateUIOptions():void
        {
            var butOn:Boolean;
            var fg:* = 0;
            while (fg < 6)
            {
                butOn = false;
                switch (fg)
                {
                    case 0:
                        if (gameKon.shiftToggle)
                        {
                            butOn = true;
                        };
                        break;
                    case 1:
                        if (gameKon.rallyOn)
                        {
                            butOn = true;
                        };
                        break;
                    case 2:
                        if (allyChat)
                        {
                            butOn = true;
                        };
                        break;
                    case 3:
                        if (soundOn)
                        {
                            butOn = true;
                        };
                        break;
                    case 4:
                        if (musicOn)
                        {
                            butOn = true;
                        };
                        break;
                    case 5:
                        break;
                };
                if (butOn)
                {
                    uiLay[("bg_" + fg)].theIcon.filters = new Array(uiGlowIn, uiGlowIn2, uiGlow);
                }
                else
                {
                    uiLay[("bg_" + fg)].theIcon.filters = [];
                };
                fg++;
            };
        }

        public function uiCombatBut(id:uint):void
        {
            switch (id)
            {
                case 0:
                    if (gameKon.shiftToggle)
                    {
                        gameKon.shiftToggle = false;
                    }
                    else
                    {
                        gameKon.shiftToggle = true;
                    };
                    break;
                case 1:
                    if (gameKon.rallyOn)
                    {
                        gameKon.rallyOn = false;
                    }
                    else
                    {
                        gameKon.rallyOn = true;
                    };
                    break;
                case 2:
                    if (allyChat)
                    {
                        allyChat = false;
                        chatToWho.text = "To All:";
                    }
                    else
                    {
                        allyChat = true;
                        chatToWho.text = "To Ally:";
                    };
                    break;
                case 3:
                    if (soundOn)
                    {
                        soundOn = false;
                        soundKon.soundOn = false;
                    }
                    else
                    {
                        soundOn = true;
                        soundKon.soundOn = true;
                    };
                    break;
                case 4:
                    if (musicOn)
                    {
                        musicOn = false;
                        musicKon.startFader(0.02, 2);
                    }
                    else
                    {
                        musicOn = true;
                        musicKon.startFader(0, 1);
                    };
                    break;
                case 5:
                    quitTheGame();
                    break;
            };
            updateUIOptions();
            toolTip.unTip();
            combatUiTT(id);
        }

        public function combatUiTT(id:uint):void
        {
            switch (id)
            {
                case 0:
                    if (gameKon.shiftToggle)
                    {
                        toolTip.tip(uiCombatTipOn[0], 0);
                    }
                    else
                    {
                        toolTip.tip(uiCombatTipOff[0], 0);
                    };
                    break;
                case 1:
                    if (gameKon.rallyOn)
                    {
                        toolTip.tip(uiCombatTipOn[1], 0);
                    }
                    else
                    {
                        toolTip.tip(uiCombatTipOff[1], 0);
                    };
                    break;
                case 2:
                    if (allyChat)
                    {
                        toolTip.tip(uiCombatTipOn[2], 0);
                    }
                    else
                    {
                        toolTip.tip(uiCombatTipOff[2], 0);
                    };
                    break;
                case 3:
                    if (soundOn)
                    {
                        toolTip.tip(uiCombatTipOn[3], 0);
                    }
                    else
                    {
                        toolTip.tip(uiCombatTipOff[3], 0);
                    };
                    break;
                case 4:
                    if (musicOn)
                    {
                        toolTip.tip(uiCombatTipOn[4], 0);
                    }
                    else
                    {
                        toolTip.tip(uiCombatTipOff[4], 0);
                    };
                    break;
                case 5:
                    toolTip.tip(uiCombatTipOn[5], 0);
                    break;
            };
        }

        public function overText(event:MouseEvent):void
        {
            toolTip.tip(cText, 0);
        }

        public function overText2(event:MouseEvent):void
        {
            toolTip.tip(gameKon.cText2, 1);
            gameKon.tippingWork = true;
        }

        public function emptyText(event:MouseEvent):void
        {
            toolTip.unTip();
            gameKon.tippingWork = false;
        }

        public function restart(Event:MouseEvent):void
        {
            if (singlePlayerMode)
            {
                if (missionOn)
                {
                    gotoAndPlay("OutOf2", "SCENE");
                }
                else
                {
                    gotoAndPlay("OutOf", "SCENE");
                };
            }
            else
            {
                dataTracer.initAfkClock();
                mpKon.zoneIn = false;
                gotoAndStop("mpLobby", "SCENE");
            };
        }

        public function getAGURL(me:MouseEvent):void
        {
            var urlAGL:String = "https://colony-game.000webhostapp.com/status.php";
            var reqAGL:URLRequest = new URLRequest(urlAGL);
            try
            {
                navigateToURL(reqAGL, "_blank");
            }
            catch(e:Error)
            {
            };
        }
		
        public function getDiscordURL(me:MouseEvent):void
        {
            var urlAGL:String = "https://discord.gg/HxhyyAb";
            var reqAGL:URLRequest = new URLRequest(urlAGL);
            try
            {
                navigateToURL(reqAGL, "_blank");
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_button_single_MENU_MENU_18():*
        {
            if (((__setPropDict[button_single] == undefined) || (!(int(__setPropDict[button_single]) == 19))))
            {
                __setPropDict[button_single] = 19;
                try
                {
                    button_single["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                button_single.emphasized = false;
                button_single.enabled = true;
                button_single.label = "Quick Play";
                button_single.labelPlacement = "right";
                button_single.selected = false;
                button_single.toggle = false;
                button_single.visible = true;
                try
                {
                    button_single["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_button_multi_MENU_MENU_18():*
        {
            if (((__setPropDict[button_multi] == undefined) || (!(int(__setPropDict[button_multi]) == 19))))
            {
                __setPropDict[button_multi] = 19;
                try
                {
                    button_multi["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                button_multi.emphasized = false;
                button_multi.enabled = true;
                button_multi.label = "Multi Player";
                button_multi.labelPlacement = "right";
                button_multi.selected = false;
                button_multi.toggle = false;
                button_multi.visible = true;
                try
                {
                    button_multi["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_button_mission_MENU_MENU_18():*
        {
            if (((__setPropDict[button_mission] == undefined) || (!(int(__setPropDict[button_mission]) == 19))))
            {
                __setPropDict[button_mission] = 19;
                try
                {
                    button_mission["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                button_mission.emphasized = false;
                button_mission.enabled = true;
                button_mission.label = "Campaign Mode";
                button_mission.labelPlacement = "right";
                button_mission.selected = false;
                button_mission.toggle = false;
                button_mission.visible = true;
                try
                {
                    button_mission["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_button_link_MENU_MENU_18():*
        {
            if (((__setPropDict[button_link] == undefined) || (!(int(__setPropDict[button_link]) == 19))))
            {
                __setPropDict[button_link] = 19;
                try
                {
                    button_link["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                button_link.emphasized = false;
                button_link.enabled = true;
                button_link.label = "Server Status";
                button_link.labelPlacement = "right";
                button_link.selected = false;
                button_link.toggle = false;
                button_link.visible = true;
                try
                {
                    button_link["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_combo1_MENU_MENU_19():*
        {
            var collObj0:DataProvider;
            var itemObj0:SimpleCollectionItem;
            var collProps0:Array;
            var collProp0:Object;
            var i0:int;
            var j0:* = undefined;
            if (((__setPropDict[combo1] == undefined) || (!(int(__setPropDict[combo1]) == 20))))
            {
                __setPropDict[combo1] = 20;
                try
                {
                    combo1["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                collObj0 = new DataProvider();
                collProps0 = [{
                    "label":"Capitalist",
                    "data":2
                }, {
                    "label":"Communist",
                    "data":1
                }, {
                    "label":"Fascist",
                    "data":0
                }, {
                    "label":"Monarchy",
                    "data":3
                }];
                i0 = 0;
                while (i0 < collProps0.length)
                {
                    itemObj0 = new SimpleCollectionItem();
                    collProp0 = collProps0[i0];
                    for (j0 in collProp0)
                    {
                        itemObj0[j0] = collProp0[j0];
                    };
                    collObj0.addItem(itemObj0);
                    i0 = (i0 + 1);
                };
                combo1.dataProvider = collObj0;
                combo1.editable = false;
                combo1.enabled = true;
                combo1.prompt = "";
                combo1.restrict = "";
                combo1.rowCount = 4;
                combo1.visible = true;
                try
                {
                    combo1["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_sxB_4_MENU_MENU_19():*
        {
            if (((__setPropDict[sxB_4] == undefined) || (!(int(__setPropDict[sxB_4]) == 20))))
            {
                __setPropDict[sxB_4] = 20;
                try
                {
                    sxB_4["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                sxB_4.emphasized = false;
                sxB_4.enabled = true;
                sxB_4.label = "Hard";
                sxB_4.labelPlacement = "right";
                sxB_4.selected = false;
                sxB_4.toggle = false;
                sxB_4.visible = true;
                try
                {
                    sxB_4["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_sxB_5_MENU_MENU_19():*
        {
            if (((__setPropDict[sxB_5] == undefined) || (!(int(__setPropDict[sxB_5]) == 20))))
            {
                __setPropDict[sxB_5] = 20;
                try
                {
                    sxB_5["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                sxB_5.emphasized = false;
                sxB_5.enabled = true;
                sxB_5.label = "Hard-Hard!";
                sxB_5.labelPlacement = "right";
                sxB_5.selected = false;
                sxB_5.toggle = false;
                sxB_5.visible = true;
                try
                {
                    sxB_5["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_sxB_3_MENU_MENU_19():*
        {
            if (((__setPropDict[sxB_3] == undefined) || (!(int(__setPropDict[sxB_3]) == 20))))
            {
                __setPropDict[sxB_3] = 20;
                try
                {
                    sxB_3["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                sxB_3.emphasized = false;
                sxB_3.enabled = true;
                sxB_3.label = "Normal";
                sxB_3.labelPlacement = "right";
                sxB_3.selected = false;
                sxB_3.toggle = false;
                sxB_3.visible = true;
                try
                {
                    sxB_3["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_sxB_2_MENU_MENU_19():*
        {
            if (((__setPropDict[sxB_2] == undefined) || (!(int(__setPropDict[sxB_2]) == 20))))
            {
                __setPropDict[sxB_2] = 20;
                try
                {
                    sxB_2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                sxB_2.emphasized = false;
                sxB_2.enabled = true;
                sxB_2.label = "Easy";
                sxB_2.labelPlacement = "right";
                sxB_2.selected = false;
                sxB_2.toggle = false;
                sxB_2.visible = true;
                try
                {
                    sxB_2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_sxB_1_MENU_MENU_19():*
        {
            if (((__setPropDict[sxB_1] == undefined) || (!(int(__setPropDict[sxB_1]) == 20))))
            {
                __setPropDict[sxB_1] = 20;
                try
                {
                    sxB_1["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                sxB_1.emphasized = false;
                sxB_1.enabled = true;
                sxB_1.label = "Tutorial Level";
                sxB_1.labelPlacement = "right";
                sxB_1.selected = false;
                sxB_1.toggle = false;
                sxB_1.visible = true;
                try
                {
                    sxB_1["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_xb_back_MENU_MENU_19():*
        {
            if (((__setPropDict[xb_back] == undefined) || (!(int(__setPropDict[xb_back]) == 20))))
            {
                __setPropDict[xb_back] = 20;
                try
                {
                    xb_back["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                xb_back.emphasized = false;
                xb_back.enabled = true;
                xb_back.label = "Exit to Menu";
                xb_back.labelPlacement = "right";
                xb_back.selected = false;
                xb_back.toggle = false;
                xb_back.visible = true;
                try
                {
                    xb_back["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_xb_back2_MENU_MENU_20():*
        {
            if (((__setPropDict[xb_back2] == undefined) || (!(int(__setPropDict[xb_back2]) == 21))))
            {
                __setPropDict[xb_back2] = 21;
                try
                {
                    xb_back2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                xb_back2.emphasized = false;
                xb_back2.enabled = true;
                xb_back2.label = "Exit to Menu";
                xb_back2.labelPlacement = "right";
                xb_back2.selected = false;
                xb_back2.toggle = false;
                xb_back2.visible = true;
                try
                {
                    xb_back2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_butmis_1_MENU_MENU_20():*
        {
            if (((__setPropDict[butmis_1] == undefined) || (!(int(__setPropDict[butmis_1]) == 21))))
            {
                __setPropDict[butmis_1] = 21;
                try
                {
                    butmis_1["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                butmis_1.emphasized = false;
                butmis_1.enabled = true;
                butmis_1.label = "Mission 1";
                butmis_1.labelPlacement = "right";
                butmis_1.selected = false;
                butmis_1.toggle = false;
                butmis_1.visible = true;
                try
                {
                    butmis_1["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_butmis_2_MENU_MENU_20():*
        {
            if (((__setPropDict[butmis_2] == undefined) || (!(int(__setPropDict[butmis_2]) == 21))))
            {
                __setPropDict[butmis_2] = 21;
                try
                {
                    butmis_2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                butmis_2.emphasized = false;
                butmis_2.enabled = true;
                butmis_2.label = "Mission 2";
                butmis_2.labelPlacement = "right";
                butmis_2.selected = false;
                butmis_2.toggle = false;
                butmis_2.visible = true;
                try
                {
                    butmis_2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_butmis_3_MENU_MENU_20():*
        {
            if (((__setPropDict[butmis_3] == undefined) || (!(int(__setPropDict[butmis_3]) == 21))))
            {
                __setPropDict[butmis_3] = 21;
                try
                {
                    butmis_3["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                butmis_3.emphasized = false;
                butmis_3.enabled = true;
                butmis_3.label = "Mission 3";
                butmis_3.labelPlacement = "right";
                butmis_3.selected = false;
                butmis_3.toggle = false;
                butmis_3.visible = true;
                try
                {
                    butmis_3["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_butmis_4_MENU_MENU_20():*
        {
            if (((__setPropDict[butmis_4] == undefined) || (!(int(__setPropDict[butmis_4]) == 21))))
            {
                __setPropDict[butmis_4] = 21;
                try
                {
                    butmis_4["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                butmis_4.emphasized = false;
                butmis_4.enabled = true;
                butmis_4.label = "Mission 4";
                butmis_4.labelPlacement = "right";
                butmis_4.selected = false;
                butmis_4.toggle = false;
                butmis_4.visible = true;
                try
                {
                    butmis_4["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_butmis_5_MENU_MENU_20():*
        {
            if (((__setPropDict[butmis_5] == undefined) || (!(int(__setPropDict[butmis_5]) == 21))))
            {
                __setPropDict[butmis_5] = 21;
                try
                {
                    butmis_5["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                butmis_5.emphasized = false;
                butmis_5.enabled = true;
                butmis_5.label = "Mission 5";
                butmis_5.labelPlacement = "right";
                butmis_5.selected = false;
                butmis_5.toggle = false;
                butmis_5.visible = true;
                try
                {
                    butmis_5["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_butmis_6_MENU_MENU_20():*
        {
            if (((__setPropDict[butmis_6] == undefined) || (!(int(__setPropDict[butmis_6]) == 21))))
            {
                __setPropDict[butmis_6] = 21;
                try
                {
                    butmis_6["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                butmis_6.emphasized = false;
                butmis_6.enabled = true;
                butmis_6.label = "Mission 6";
                butmis_6.labelPlacement = "right";
                butmis_6.selected = false;
                butmis_6.toggle = false;
                butmis_6.visible = true;
                try
                {
                    butmis_6["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }
		
        //internal function __setProp_butmis_7_MENU_MENU_20():*
        //{
        //    if (((__setPropDict[butmis_7] == undefined) || (!(int(__setPropDict[butmis_7]) == 21))))
        //    {
        //        __setPropDict[butmis_7] = 21;
        //        try
        //        {
        //            butmis_7["componentInspectorSetting"] = true;
        //        }
        //        catch(e:Error)
        //        {
        //        };
        //        butmis_7.emphasized = false;
        //        butmis_7.enabled = true;
        //        butmis_7.label = "Mission 7";
        //        butmis_7.labelPlacement = "right";
        //        butmis_7.selected = false;
        //        butmis_7.toggle = false;
        //        butmis_7.visible = true;
        //        try
        //        {
        //            butmis_7["componentInspectorSetting"] = false;
        //        }
        //        catch(e:Error)
        //        {
        //        };
        //    };
        //}

        internal function __setProp_j_server1_MENU_MENU_21():*
        {
            if (((__setPropDict[j_server1] == undefined) || (!(int(__setPropDict[j_server1]) == 22))))
            {
                __setPropDict[j_server1] = 22;
                try
                {
                    j_server1["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                j_server1.emphasized = false;
                j_server1.enabled = true;
                j_server1.label = "";
                j_server1.labelPlacement = "right";
                j_server1.selected = false;
                j_server1.toggle = false;
                j_server1.visible = true;
                try
                {
                    j_server1["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_xb_back3_MENU_MENU_21():*
        {
            if (((__setPropDict[xb_back3] == undefined) || (!(int(__setPropDict[xb_back3]) == 22))))
            {
                __setPropDict[xb_back3] = 22;
                try
                {
                    xb_back3["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                xb_back3.emphasized = false;
                xb_back3.enabled = true;
                xb_back3.label = "Exit to Menu";
                xb_back3.labelPlacement = "right";
                xb_back3.selected = false;
                xb_back3.toggle = false;
                xb_back3.visible = true;
                try
                {
                    xb_back3["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_j_server0_MENU_MENU_21():*
        {
            if (((__setPropDict[j_server0] == undefined) || (!(int(__setPropDict[j_server0]) == 22))))
            {
                __setPropDict[j_server0] = 22;
                try
                {
                    j_server0["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                j_server0.emphasized = false;
                j_server0.enabled = true;
                j_server0.label = "";
                j_server0.labelPlacement = "right";
                j_server0.selected = false;
                j_server0.toggle = false;
                j_server0.visible = true;
                try
                {
                    j_server0["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_j_server2_MENU_MENU_21():*
        {
            if (((__setPropDict[j_server2] == undefined) || (!(int(__setPropDict[j_server2]) == 22))))
            {
                __setPropDict[j_server2] = 22;
                try
                {
                    j_server2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                j_server2.emphasized = false;
                j_server2.enabled = true;
                j_server2.label = "";
                j_server2.labelPlacement = "right";
                j_server2.selected = false;
                j_server2.toggle = false;
                j_server2.visible = true;
                try
                {
                    j_server2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_xb_back6_MENU_MENU_22():*
        {
            if (((__setPropDict[xb_back6] == undefined) || (!(int(__setPropDict[xb_back6]) == 23))))
            {
                __setPropDict[xb_back6] = 23;
                try
                {
                    xb_back6["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                xb_back6.emphasized = false;
                xb_back6.enabled = true;
                xb_back6.label = "Exit to Menu";
                xb_back6.labelPlacement = "right";
                xb_back6.selected = false;
                xb_back6.toggle = false;
                xb_back6.visible = true;
                try
                {
                    xb_back6["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_goAg_MENU_MENU_22():*
        {
            if (((__setPropDict[goAg] == undefined) || (!(int(__setPropDict[goAg]) == 23))))
            {
                __setPropDict[goAg] = 23;
                try
                {
                    goAg["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                goAg.emphasized = false;
                goAg.enabled = true;
                goAg.label = "I take you there.";
                goAg.labelPlacement = "right";
                goAg.selected = false;
                goAg.toggle = false;
                goAg.visible = true;
                try
                {
                    goAg["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_guest_MPCONNECT_Go_25():*
        {
            if (((__setPropDict[but_guest] == undefined) || (!(int(__setPropDict[but_guest]) == 26))))
            {
                __setPropDict[but_guest] = 26;
                try
                {
                    but_guest["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_guest.emphasized = false;
                but_guest.enabled = true;
                but_guest.label = "Play as Guest";
                but_guest.labelPlacement = "right";
                but_guest.selected = false;
                but_guest.toggle = false;
                but_guest.visible = true;
                try
                {
                    but_guest["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_exit_MPCONNECT_Go_25():*
        {
            if (((__setPropDict[but_exit] == undefined) || (!(int(__setPropDict[but_exit]) == 26))))
            {
                __setPropDict[but_exit] = 26;
                try
                {
                    but_exit["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_exit.emphasized = false;
                but_exit.enabled = true;
                but_exit.label = "Exit to Menu";
                but_exit.labelPlacement = "right";
                but_exit.selected = false;
                but_exit.toggle = false;
                but_exit.visible = true;
                try
                {
                    but_exit["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_login_MPCONNECT_Go_25():*
        {
            if (((__setPropDict[but_login] == undefined) || (!(int(__setPropDict[but_login]) == 26))))
            {
                __setPropDict[but_login] = 26;
                try
                {
                    but_login["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_login.emphasized = false;
                but_login.enabled = true;
                but_login.label = "Login";
                but_login.labelPlacement = "right";
                but_login.selected = false;
                but_login.toggle = false;
                but_login.visible = true;
                try
                {
                    but_login["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_register_MPCONNECT_Go_25():*
        {
            if (((__setPropDict[but_register] == undefined) || (!(int(__setPropDict[but_register]) == 26))))
            {
                __setPropDict[but_register] = 26;
                try
                {
                    but_register["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_register.emphasized = false;
                but_register.enabled = true;
                but_register.label = "Register";
                but_register.labelPlacement = "right";
                but_register.selected = false;
                but_register.toggle = false;
                but_register.visible = true;
                try
                {
                    but_register["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_reMe_MPCONNECT_Go_25():*
        {
            if (((__setPropDict[reMe] == undefined) || (!(int(__setPropDict[reMe]) == 26))))
            {
                __setPropDict[reMe] = 26;
                try
                {
                    reMe["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                reMe.enabled = true;
                reMe.label = "Remember Me";
                reMe.labelPlacement = "right";
                reMe.selected = false;
                reMe.visible = true;
                try
                {
                    reMe["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_register2_MPCONNECT_Go_26():*
        {
            if (((__setPropDict[but_register2] == undefined) || (!(int(__setPropDict[but_register2]) == 27))))
            {
                __setPropDict[but_register2] = 27;
                try
                {
                    but_register2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_register2.emphasized = false;
                but_register2.enabled = true;
                but_register2.label = "Register";
                but_register2.labelPlacement = "right";
                but_register2.selected = false;
                but_register2.toggle = false;
                but_register2.visible = true;
                try
                {
                    but_register2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_exit2_MPCONNECT_Go_26():*
        {
            if (((__setPropDict[but_exit2] == undefined) || (!(int(__setPropDict[but_exit2]) == 27))))
            {
                __setPropDict[but_exit2] = 27;
                try
                {
                    but_exit2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_exit2.emphasized = false;
                but_exit2.enabled = true;
                but_exit2.label = "Exit to Menu";
                but_exit2.labelPlacement = "right";
                but_exit2.selected = false;
                but_exit2.toggle = false;
                but_exit2.visible = true;
                try
                {
                    but_exit2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_login4_MPCONNECT_Go_27():*
        {
            if (((__setPropDict[but_login4] == undefined) || (!(int(__setPropDict[but_login4]) == 28))))
            {
                __setPropDict[but_login4] = 28;
                try
                {
                    but_login4["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_login4.emphasized = false;
                but_login4.enabled = true;
                but_login4.label = "Login and Play";
                but_login4.labelPlacement = "right";
                but_login4.selected = false;
                but_login4.toggle = false;
                but_login4.visible = true;
                try
                {
                    but_login4["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_exit3_MPCONNECT_Go_27():*
        {
            if (((__setPropDict[but_exit3] == undefined) || (!(int(__setPropDict[but_exit3]) == 28))))
            {
                __setPropDict[but_exit3] = 28;
                try
                {
                    but_exit3["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_exit3.emphasized = false;
                but_exit3.enabled = true;
                but_exit3.label = "Exit to Menu";
                but_exit3.labelPlacement = "right";
                but_exit3.selected = false;
                but_exit3.toggle = false;
                but_exit3.visible = true;
                try
                {
                    but_exit3["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_but_login3_MPCONNECT_Go_27():*
        {
            if (((__setPropDict[but_login3] == undefined) || (!(int(__setPropDict[but_login3]) == 28))))
            {
                __setPropDict[but_login3] = 28;
                try
                {
                    but_login3["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                but_login3.emphasized = false;
                but_login3.enabled = true;
                but_login3.label = "Play as Guest";
                but_login3.labelPlacement = "right";
                but_login3.selected = false;
                but_login3.toggle = false;
                but_login3.visible = true;
                try
                {
                    but_login3["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_xb_back7_MPCONNECT_Layer3_28():*
        {
            if (((__setPropDict[xb_back7] == undefined) || (!(int(__setPropDict[xb_back7]) == 29))))
            {
                __setPropDict[xb_back7] = 29;
                try
                {
                    xb_back7["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                xb_back7.emphasized = false;
                xb_back7.enabled = true;
                xb_back7.label = "Exit to Menu";
                xb_back7.labelPlacement = "right";
                xb_back7.selected = false;
                xb_back7.toggle = false;
                xb_back7.visible = true;
                try
                {
                    xb_back7["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_goAg2_MPCONNECT_Layer3_28():*
        {
            if (((__setPropDict[goAg2] == undefined) || (!(int(__setPropDict[goAg2]) == 29))))
            {
                __setPropDict[goAg2] = 29;
                try
                {
                    goAg2["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                goAg2.emphasized = false;
                goAg2.enabled = true;
                goAg2.label = "Play Colony ";
                goAg2.labelPlacement = "right";
                goAg2.selected = false;
                goAg2.toggle = false;
                goAg2.visible = true;
                try
                {
                    goAg2["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function __setProp_button_res_POST_Layer1_33():*
        {
            if (((__setPropDict[button_res] == undefined) || (!(int(__setPropDict[button_res]) == 34))))
            {
                __setPropDict[button_res] = 34;
                try
                {
                    button_res["componentInspectorSetting"] = true;
                }
                catch(e:Error)
                {
                };
                button_res.emphasized = false;
                button_res.enabled = true;
                button_res.label = "Proceed";
                button_res.labelPlacement = "right";
                button_res.selected = false;
                button_res.toggle = false;
                button_res.visible = true;
                try
                {
                    button_res["componentInspectorSetting"] = false;
                }
                catch(e:Error)
                {
                };
            };
        }

        internal function frame1():*
        {
            CPMStarPoolID = 1052;
            CPMStarSubPoolID = 9;
            ad = AdLoader.LoadAd(CPMStarPoolID, CPMStarSubPoolID);
            adBox.addChild(ad);
            stop();
            this.stop();
            stage.scaleMode = StageScaleMode.EXACT_FIT;
            mW = loadBar.bar.width;
            completedTheL = false;
            userNameId = "player1";
            T = new MenuFont();
            tf = new TextFormat();
            tf.font = T.fontName;
            tf.color = 0;
            tf.size = 15;
            this.loaderInfo.addEventListener(ProgressEvent.PROGRESS, PL_LOADING, false, 0, true);
            this.loaderInfo.addEventListener(Event.COMPLETE, PL_LOADED, false, 0, true);
            addEventListener(Event.ENTER_FRAME, showMouse, false, 0, true);
            josefArray = new Array();
            josefArray.push({
                "oj":d_mc0,
                "D":2115
            });
            josefArray.push({
                "oj":d_mc1,
                "D":2132
            });
            josefArray.push({
                "oj":d_mc2,
                "D":2141
            });
            josefArray.push({
                "oj":d_mc3,
                "D":2185
            });
            josefArray.push({
                "oj":d_mc4,
                "D":2207
            });
            josefArray.push({
                "oj":d_mc5,
                "D":2252
            });
            josefArray.push({
                "oj":d_mc6,
                "D":2265
            });
            for (iii in josefArray)
            {
                josefArray[iii].oj.visible = false;
            };
            ToolTip = new toolTip(stage, this, -265, 250);
            addChild(ToolTip);
            ToolTip.x = mouseX;
            ToolTip.y = mouseY;
            dragRect = new Rectangle(0, 0, 800, 575);
            ToolTip.startDrag(false, dragRect);
            BuildingData = new buildingData();
            OptionData = new optionData();
            WeaponData = new weaponData();
            UnitData = new unitData();
        }

        internal function frame2():*
        {
            stop();
            soundOn = true;
            musicOn = true;
            _t.init(stage);
            mpKon.init(this);
            dataTimer.init(stage);
            Mouse.show();
            normalRoom = "Lobby";
            DataTracer = new dataTracer(this, stage);
            url2 = stage.loaderInfo.url;
            urlStart = (url2.indexOf("://") + 3);
            urlEnd = url2.indexOf("/", urlStart);
            domain = url2.substring(urlStart, urlEnd);
            LastDot = (domain.lastIndexOf(".") - 1);
            domEnd = (domain.lastIndexOf(".", LastDot) + 1);
            domain = domain.substring(domEnd, domain.length);
            validDomain = (("armorgames.com" == domain) || ("" == domain));
            agDom = false;
            button_play.addEventListener(MouseEvent.MOUSE_UP, playGame);
        }

        internal function frame3():*
        {
            agi_url = "https://agi.armorgames.com/assets/agi/AGI.swf";
            Security.allowDomain(agi_url);
            devKey = "72ea217affa7d5ff716e5a6f04f568b1";
            gameKey = "colony";
            urlRequest = new URLRequest(agi_url);
            loader = new Loader();
            testMode = false;
            if (((DomainChecker.isDomain(stage, "armorgames.com", "ungrounded.net")) || (testMode)))
            {
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                loader.load(urlRequest);
            };
            agiLogged = false;
            agiUserName = "";
        }

        internal function frame4():*
        {
            stop();
            agIntro.main = this;
            soundKon.init();
            my_cMenu = new ContextMenu();
            my_cMenu.hideBuiltInItems();
            contextMenu = my_cMenu;
            missionMax = 1;
            sav_user = "";
            sav_pass = "";
            rememberMe = false;
            saveGame = SharedObject.getLocal("Colony");
            if (saveGame.data.al == null)
            {
                saveGame.data.al = 1;
                saveGame.data.sav_user = "";
                saveGame.data.sav_pass = "";
                saveGame.data.rememberMe = false;
                saveGame.flush();
            }
            else
            {
                missionMax = saveGame.data.al;
                sav_user = saveGame.data.sav_user;
                sav_pass = saveGame.data.sav_pass;
                rememberMe = saveGame.data.rememberMe;
            };
        }

        internal function frame5():*
        {
            aiTactic.init();
            colorStrings = new Array("White", "Red", "Blue", "Yellow", "Green");
            colorForm = new Array(0xFFFFFF, 0xFF0000, 39423, 0xFFCC00, 385051);
            colorChat = new Array("8C8C8C", "A93434", "306BA5", "BB8711", "327840");
            renderMachine.renCom = renDone;
            renderMachine.init(this, stage);
            validCheckClock = new Timer(20000);
            validCheckClock.start();
            validCheckClock.addEventListener(TimerEvent.TIMER, checkAllValid, false, 0, true);
            checkAllValid();
            this.play();
            nextFrame();
        }

        internal function frame6():*
        {
            renderMachine.renderAll(0);
            renderMachine.renderAll(2, colorForm, 0);
            renderMachine.renderAll(2, colorForm, 1);
            renderMachine.renderAll(2, colorForm, 2);
            renderMachine.renderAll(2, colorForm, 3);
            renderMachine.renderAll(2, colorForm, 4);
            renderBar.width = 1;
            renderMachine.startRen();
            stop();
        }

        internal function frame7():*
        {
            jum = "You have been kicked on suspicion of hacking.";
            this.gotoAndPlay("Prestart", "SCENE");
        }

        internal function frame16():*
        {
            musicKon.init(stage);
            gotoAndStop("START", "SCENE");
        }

        internal function frame17():*
        {
            gotoAndStop("START", "SCENE");
        }

        internal function frame18():*
        {
            gotoAndStop("MISSION", "SCENE");
        }

        internal function frame19():*
        {
            __setProp_button_link_MENU_MENU_18();
            __setProp_button_mission_MENU_MENU_18();
            __setProp_button_multi_MENU_MENU_18();
            __setProp_button_single_MENU_MENU_18();
            stop();
            optRestrict = new Array();
            if (DCTRUE == true)
            {
                dataTracer.showTracer();
                dataTracer.update(DCLINE);
            };
            missionLevel = 1;
            storySetter = 0;
            missionOn = false;
            missionGo = true;
            button_single.setStyle("textFormat", tf);
            button_multi.setStyle("textFormat", tf);
            button_mission.setStyle("textFormat", tf);
            button_link.setStyle("textFormat", tf);
            button_link.addEventListener(MouseEvent.CLICK, getAGURL, false, 0, true);
            button_single.addEventListener(MouseEvent.MOUSE_UP, startSinglePlayer, false, 0, true);
            button_multi.addEventListener(MouseEvent.MOUSE_UP, startMultiPlayer, false, 0, true);
            button_mission.addEventListener(MouseEvent.MOUSE_UP, startMissionPlayer, false, 0, true);
            DCTRUE = false;
            remotePlayerArray = new Array(false, false, false, false);
            allPlayers = new Array();
            singleLevel = 0;
            tutLev = false;
            onlineServers = new Array("127.0.0.1:25565", "127.0.0.1:25565", "127.0.0.1");
            serverNames = new Array("USNorth Server", "USEast Server", "Placeholder");
            MP_r2j = false;
            disconnectedHandler2 = new Function();
        }
		
		internal function completeHandler(ServerStatusCheck:Event):void
		{
			var CompletedTxT:String = ServerStatusCheck.target.data;
			OfflineA.text = CompletedTxT;
			OfflineB.text = CompletedTxT;
			ServerStatusCheck.removeEventListener(Event.COMPLETE, completeHandler);
		}

        internal function frame20():*
        {
            __setProp_xb_back_MENU_MENU_19();
            __setProp_sxB_1_MENU_MENU_19();
            __setProp_sxB_2_MENU_MENU_19();
            __setProp_sxB_3_MENU_MENU_19();
            __setProp_sxB_5_MENU_MENU_19();
            __setProp_sxB_4_MENU_MENU_19();
            __setProp_combo1_MENU_MENU_19();
            clientPlayer = [2, 1, 1];
            singleLevel = 0;
            tutLev = false;
            if (playerName != null)
            {
                nameBox.text = playerName;
            };
            sxB_1.addEventListener(MouseEvent.CLICK, startSing1, false, 0, true);
            sxB_2.addEventListener(MouseEvent.CLICK, startSing2, false, 0, true);
            sxB_3.addEventListener(MouseEvent.CLICK, startSing3, false, 0, true);
            sxB_4.addEventListener(MouseEvent.CLICK, startSing4, false, 0, true);
            sxB_5.addEventListener(MouseEvent.CLICK, startSing5, false, 0, true);
            sxB_1.setStyle("textFormat", tf);
            sxB_2.setStyle("textFormat", tf);
            sxB_3.setStyle("textFormat", tf);
            sxB_4.setStyle("textFormat", tf);
            sxB_5.setStyle("textFormat", tf);
            xb_back.setStyle("textFormat", tf);
            xb_back.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
        }

        internal function frame21():*
        {
			// __setProp_butmis_7_MENU_MENU_20();
            __setProp_butmis_6_MENU_MENU_20();
            __setProp_butmis_5_MENU_MENU_20();
            __setProp_butmis_4_MENU_MENU_20();
            __setProp_butmis_3_MENU_MENU_20();
            __setProp_butmis_2_MENU_MENU_20();
            __setProp_butmis_1_MENU_MENU_20();
            __setProp_xb_back2_MENU_MENU_20();
            xb_back2.setStyle("textFormat", tf);
            xb_back2.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
            tutLev = false;
            butmis_1.setStyle("textFormat", tf);
            butmis_2.setStyle("textFormat", tf);
            butmis_3.setStyle("textFormat", tf);
            butmis_4.setStyle("textFormat", tf);
            butmis_5.setStyle("textFormat", tf);
            butmis_6.setStyle("textFormat", tf);
			//butmis_7.setStyle("textFormat", tf);
            butmis_1.addEventListener(MouseEvent.CLICK, gotoMission1);
            butmis_2.addEventListener(MouseEvent.CLICK, gotoMission2);
            butmis_3.addEventListener(MouseEvent.CLICK, gotoMission3);
            butmis_4.addEventListener(MouseEvent.CLICK, gotoMission4);
            butmis_5.addEventListener(MouseEvent.CLICK, gotoMission5);
            butmis_6.addEventListener(MouseEvent.CLICK, gotoMission6);
			//butmis_7.addEventListener(MouseEvent.CLICK, gotoMission7);
            gh = 1;
            while (gh < 8)
            {
                if (missionMax < gh)
                {
                    this[("butmis_" + gh)].enabled = false;
                    this[("butmis_" + gh)].setStyle("textFormat", tf);
                    this[("butmis_" + gh)].label = "Locked";
                };
                gh++;
            };
        }

        internal function frame22():*
        {
            __setProp_j_server2_MENU_MENU_21();
            __setProp_j_server0_MENU_MENU_21();
            __setProp_xb_back3_MENU_MENU_21();
            __setProp_j_server1_MENU_MENU_21();
            stop();
            xb_back3.setStyle("textFormat", tf);
            xb_back3.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
            j_server0.setStyle("textFormat", tf);
            j_server1.setStyle("textFormat", tf);
            j_server2.setStyle("textFormat", tf);
            j_server0.label = serverNames[0];
            j_server1.label = serverNames[1];
            j_server2.label = serverNames[2];
            j_server0.addEventListener(MouseEvent.CLICK, s_Con0, false, 0, true);
            j_server1.addEventListener(MouseEvent.CLICK, s_Con1, false, 0, true);
            j_server2.addEventListener(MouseEvent.CLICK, s_Con2, false, 0, true);
        }

        internal function frame23():*
        {
            __setProp_goAg_MENU_MENU_22();
            __setProp_xb_back6_MENU_MENU_22();
            xb_back6.setStyle("textFormat", tf);
            xb_back6.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
            goAg.setStyle("textFormat", tf);
            goAg.addEventListener(MouseEvent.CLICK, goAGHandler, false, 0, true);
        }

        internal function frame24():*
        {
            switch (storySetter)
            {
                case 0:
                    comicLoad = new comic_0();
                    break;
                case 1:
                    comicLoad = new comic_1();
                    break;
                case 2:
                    comicLoad = new comic_2();
                    break;
                case 3:
                    comicLoad = new comic_3();
                    break;
                case 4:
                    comicLoad = new comic_4();
                    break;
                case 5:
                    comicLoad = new comic_5();
                    break;
                case 6:
                    comicLoad = new comic_6();
                    break;
                case 7:
                    comicLoad = new comic_7();
                    break;
                case 8:
                    comicLoad = new comic_8();
                    break;
                case 9:
                    comicLoad = new comic_9();
                    break;
                case 10:
                    comicLoad = new comic_10();
                    break;
                case 11:
                    comicLoad = new comic_11();
                    break;
            };
            addChild(comicLoad);
            comicLoad.y = 180;
            comicLoad.gotoAndStop(1);
            comicPage = 1;
            comicPageMax = comicLoad.totalFrames;
            mis_beg.visible = false;
            mis_next.visible = true;
            mis_next.addEventListener(MouseEvent.CLICK, nextComic);
        }

        internal function frame26():*
        {
            __setProp_reMe_MPCONNECT_Go_25();
            __setProp_but_register_MPCONNECT_Go_25();
            __setProp_but_login_MPCONNECT_Go_25();
            __setProp_but_exit_MPCONNECT_Go_25();
            __setProp_but_guest_MPCONNECT_Go_25();
            if (justReg)
            {
                in_name.text = regName;
                in_pass.text = regPass;
                justReg = false;
                addChild(DataTracer);
                dataTracer.update("The account registration was a grand success! Now you may log in to play.");
            };
            tfRe = new TextFormat();
            tfRe.font = T.fontName;
            tfRe.color = 0x999999;
            tfRe.size = 12;
            reMe.setStyle("textFormat", tfRe);
            reMe.addEventListener(MouseEvent.CLICK, remMeHand, false, 0, true);
            but_login.addEventListener(MouseEvent.CLICK, b_loginHand, false, 0, true);
            but_register.addEventListener(MouseEvent.CLICK, b_registerHand, false, 0, true);
            but_guest.addEventListener(MouseEvent.CLICK, b_guestHand, false, 0, true);
            but_exit.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
            but_login.setStyle("textFormat", tf);
            but_register.setStyle("textFormat", tf);
            but_guest.setStyle("textFormat", tf);
            but_exit.setStyle("textFormat", tf);
            if (rememberMe)
            {
                in_name.text = sav_user;
                in_pass.text = sav_pass;
                reMe.selected = true;
            };
        }

        internal function frame27():*
        {
            __setProp_but_exit2_MPCONNECT_Go_26();
            __setProp_but_register2_MPCONNECT_Go_26();
            but_register2.addEventListener(MouseEvent.CLICK, b_registerHand2, false, 0, true);
            but_exit2.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
            but_register2.setStyle("textFormat", tf);
            but_exit2.setStyle("textFormat", tf);
            justReg = false;
        }

        internal function frame28():*
        {
            __setProp_but_login3_MPCONNECT_Go_27();
            __setProp_but_exit3_MPCONNECT_Go_27();
            __setProp_but_login4_MPCONNECT_Go_27();
            but_login3.addEventListener(MouseEvent.CLICK, loginHand3, false, 0, true);
            but_login4.addEventListener(MouseEvent.CLICK, loginHand4, false, 0, true);
            but_exit3.addEventListener(MouseEvent.CLICK, b_exitHand, false, 0, true);
            but_login4.setStyle("textFormat", tf);
            but_login3.setStyle("textFormat", tf);
            but_exit3.setStyle("textFormat", tf);
            initUserData();
            guestMode = false;
            someNames = ["Krin", "Dave", "John", "Smith"];
            tickerUSD = 30;
            userData = new Object();
            friendList = new Array();
            ignoreList = new Array();
            userRace = 2;
            realUser = false;
            rankLimit = [100, 500, 1500, 3000, 6000, 10000, 15000, 20000, 30000];
            initUserData();
        }

        internal function frame29():*
        {
            __setProp_goAg2_MPCONNECT_Layer3_28();
            __setProp_xb_back7_MPCONNECT_Layer3_28();
            xb_back7.setStyle("textFormat", tf);
            xb_back7.addEventListener(MouseEvent.CLICK, b_exit7Hand, false, 0, true);
            goAg2.setStyle("textFormat", tf);
            goAg2.addEventListener(MouseEvent.CLICK, goAGHandler, false, 0, true);
        }

        internal function frame30():*
        {
            roomMaster = false;
            rankedMatch = false;
            mpscreenMode = true;
            optRestrict = new Array();
            gameSet = 0;
            mpSTarget = new MultiplayerScreen(MP_userName, MP_team, MP_color, userData, stage, normalRoom, userRace);
            disconnectedHandler2 = mpSTarget.endIt;
            addChildAt(mpSTarget, 0);
        }

        internal function frame31():*
        {
            gotoAndStop("Game", "SCENE");
        }

        internal function frame32():*
        {
            mpKon.gameBegun = false;
            dataTracer.endAfkClock();
            dataTracer.hideTracer();
            dataTimer.forceStart();
            switch (clientPlayer[1])
            {
                case 1:
                    allyPosT = 2;
                    break;
                case 2:
                    allyPosT = 1;
                    break;
                case 3:
                    allyPosT = 4;
                    break;
                case 4:
                    allyPosT = 3;
                    break;
            };
            legitChecker = true;
            i = 1;
            while (i < 5)
            {
                for (i2 in allPlayers)
                {
                    if (allPlayers[i2].POS == i)
                    {
                        allPlayers[i2].NAME = adjustName(allPlayers[i2].NAME);
                        this[("n_l" + i)].text = allPlayers[i2].NAME;
                        if (allPlayers[i2].POS == allyPosT)
                        {
                            allySocket = allPlayers[i2].ID;
                        };
                    };
                };
                i++;
            };
            if (allySocket != 0)
            {
                allyChat = true;
            }
            else
            {
                allyChat = false;
            };
            countTime.basic = this;
        }

        internal function frame33():*
        {
            removeChild(promptBox);
            stage.frameRate = 30;
            _t.startTicker();
            mpKon.gameBegun = true;
            stage.addEventListener(Event.ACTIVATE, resetFocus);
            if (auth)
            {
                setObj = {};
                setObj.setArray = [];
                for (i in allPlayers)
                {
                    setObj.setArray[allPlayers[i].POS] = allPlayers[i].ID;
                };
                mpKon.fox.sendXtMessage("exRoom2", "s", setObj);
            };
            stage.focus = this;
            gameRunning = true;
            iWon = false;
            gameQuitable = true;
            FONT = new MainFont2();
            mpKon.buddyMsg = buddyMsg;
            disconnectedHandler2 = disconnectedHandler;
            DTIM = new Timer(5000);
            DTIM.start();
            DTIM.addEventListener(TimerEvent.TIMER, incrDT, false, 0, true);
            yugoSlav = 25;
            gameKon.desync = false;
            winSave = 0;
            if (legitChecker)
            {
                rankedMatch = true;
            }
            else
            {
                rankedMatch = false;
            };
            if (!singlePlayerMode)
            {
                addMPthings();
                if (realUser)
                {
                    if (rankedMatch)
                    {
                        userData.gamesPlayed++;
                        winSave = userData.gamesConsecutiveWins;
                        userData.gamesConsecutiveWins = 0;
                    };
                };
            };
            if (((!(agi == null)) && (!(guestMode))))
            {
                agi.submitUserData("USD", userData);
            };
            if (!singlePlayerMode)
            {
                TGYUJHI = new Timer(10000);
                TGYUJHI.start();
                TGYUJHI.addEventListener(TimerEvent.TIMER, removeIncomeListenerGO, false, 0, true);
            };
            GameKon = new gameKon();
            gameRun = true;
            GameKon.setData(stage, this);
            GameKon.runData();
            buildBar.visible = false;
            displayKon.liftRestri();
            DisplayKon = new displayKon();
            DisplayField = new Sprite();
            addChildAt(DisplayField, 0);
            GD3 = new groundDisplay3();
            addChildAt(GD3, 0);
            DisplayField.x = 0;
            mainPosY = (DisplayField.y = 120);
            unitDisplay = new Sprite();
            DisplayField.addChild(unitDisplay);
            effectsDisplay = new Sprite();
            DisplayField.addChild(effectsDisplay);
            screenWidth = stage.stageWidth;
            battleWidth = (stage.stageWidth * 2);
            screenPoint = 0;
            endPoint1 = 0;
            endPoint2 = (battleWidth - screenWidth);
            BaseKon = new baseKon();
            secondLayer = new groundDisplay2();
            DisplayField.addChildAt(new _groundDisplay(), 0);
            DisplayField.addChildAt(secondLayer, 0);
            DisplayField.addChildAt(BaseKon.BaseHolder, 2);
            BaseKon.BaseHolder.x = (50 + (BaseKon.BaseHolder.width / 2));
            BaseKon.BaseHolder.y = 140;
            DisplayField.addChildAt(BaseKon.BaseHolder2, 2);
            BaseKon.BaseHolder2.x = (battleWidth - (50 + (BaseKon.BaseHolder2.width / 2)));
            BaseKon.BaseHolder2.y = 140;
            DisplayField.x = -(screenPoint);
            GameKon.player1 = new playerKon(0);
            GameKon.player2 = new playerKon(0);
            GameKon.player3 = new playerKon(0);
            GameKon.player4 = new playerKon(0);
            if (!singlePlayerMode)
            {
                for (i6 in allPlayers)
                {
                    if ((((allPlayers[i6].NAME == "Easy CPU") || (allPlayers[i6].NAME == "Normal CPU")) || (allPlayers[i6].NAME == "Hard CPU")))
                    {
                        GameKon[("player" + allPlayers[i6].POS)].CPUMODE = true;
                    };
                };
            };
            GameKon.player1.idTag = "p1_";
            GameKon.player2.idTag = "p2_";
            GameKon.player3.idTag = "p3_";
            GameKon.player4.idTag = "p4_";
            TICS = new Timer(3000);
            if (!singlePlayerMode)
            {
                GameKon.player1.cityColor = 1;
                GameKon.player2.cityColor = 2;
                GameKon.player3.cityColor = 3;
                GameKon.player4.cityColor = 4;
                TICS.reset();
                TICS.start();
                TICS.addEventListener(TimerEvent.TIMER, sendIncomeStatus, false, 0, true);
            }
            else
            {
                GameKon.player1.cityColor = 1;
                GameKon.player2.cityColor = 2;
                GameKon.player3.cityColor = 3;
                GameKon.player4.cityColor = 4;
            };
            GameKon.player1.POS = 1;
            GameKon.player2.POS = 2;
            GameKon.player3.POS = 3;
            GameKon.player4.POS = 4;
            if (musicOn)
            {
                musicKon.setTheme(clientPlayer[0]);
                musicKon.startFader(0, 1);
            };
            playerControl = GameKon[("player" + clientPlayer[1])];
            gameKon.playerNow = playerControl;
            playerControl.setIncome(clientPlayer[0]);
            if (singlePlayerMode)
            {
                playerControl.cityColor = clientPlayer[2];
            };
            if (((playerControl == GameKon.player3) || (playerControl == GameKon.player4)))
            {
                screenPoint = endPoint2;
                DisplayField.x = -(screenPoint);
            };
            GameKon.assignBase();
            GameKon.player1.team = (GameKon.player2.team = (GameKon.player3.eteam = (GameKon.player4.eteam = unitKon.Team1)));
            GameKon.player1.eteam = (GameKon.player2.eteam = (GameKon.player3.team = (GameKon.player4.team = unitKon.Team2)));
            unitKon.createBase(GameKon.player1, GameKon.player3);
            addEventListener(Event.ENTER_FRAME, updateUI);
            addEventListener(Event.ENTER_FRAME, screenScroll);
            j = 0;
            while (j < 9)
            {
                this[("b" + j)].id = j;
                this[("b" + j)].btn.visible = false;
                j++;
            };
            b8.visible = false;
            b8.btn.visible = true;
            oi.visible = false;
            boundLimit = 0.1;
            minBound = Math.round((stage.stageWidth * boundLimit));
            maxBound = Math.round((stage.stageWidth * (1 - boundLimit)));
            mouseAccel = 1.25;
			mouseAccelFaster = 5;
            mouseMaxVel = 35;
			mouseMaxVelFaster = 50;
            mouseVel = 0;
            winGame = false;
            aiSetArray = new Array(GameKon.player1, GameKon.player2, GameKon.player3, GameKon.player4);
            optRestrict = new Array();
            if (!singlePlayerMode)
            {
                switch (gameSet)
                {
                    case 1:
                        optRestrict = new Array(37, 40);
                        break;
                    case 2:
                        optRestrict = new Array(37, 40, 23);
                        break;
                    case 3:
                        optRestrict = new Array(13, 14, 16, 17, 18, 20, 21, 22, 24, 37, 40, 38, 39, 43, 45, 46, 48, 49, 52, 57);
                        break;
                    case 4:
                        optRestrict = new Array(15, 47, 37, 40, 23, 19, 51);
                        break;
                    case 5:
                        optRestrict = new Array(33, 34, 37, 40);
                        break;
                    default:
                        optRestrict = new Array();
                };
            };
            aiSingArray = new Array();
            chatBody.chatOn = false;
            if (optRestrict.length > 0)
            {
                displayKon.restricted = true;
                for (bh in optRestrict)
                {
                    displayKon.restrictArray.push(optRestrict[bh]);
                };
            };
            if (singlePlayerMode)
            {
                switch (singleLevel)
                {
                    case 1:
                        aiSingArray.push({
                            "isON":false,
                            "dif":0,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":1
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":0
                        });
                        chatBody.init(1);
                        break;
                    case 2:
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":99
                        });
                        chatBody.init(0);
                        break;
                    case 3:
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        chatBody.init(0);
                        break;
                    case 4:
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":99
                        });
                        chatBody.init(0);
                        break;
                    case 5:
                        aiSingArray.push({
                            "isON":true,
                            "dif":4,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":4,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":4,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":4,
                            "be":99
                        });
                        chatBody.init(0);
                        break;
                    case 6:
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":1
                        });
                        displayKon.restricted = true;
                        displayKon.restrictArray.push(3, 6, 7, 8, 9);
                        chatBody.init(2);
                        break;
                    case 7:
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":5
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":false,
                            "dif":0,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":3
                        });
                        displayKon.restricted = true;
                        displayKon.restrictArray.push(2, 8, 34, 4, 46);
                        chatBody.init(3);
                        break;
                    case 8:
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":false,
                            "dif":2,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":5
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":1,
                            "be":3
                        });
                        displayKon.restricted = true;
                        displayKon.restrictArray.push(3, 8);
                        chatBody.init(4);
                        break;
                    case 9:
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":1
                        });
                        aiSingArray.push({
                            "isON":false,
                            "dif":0,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":3
                        });
                        displayKon.restricted = true;
                        displayKon.restrictArray.push(8);
                        chatBody.init(5);
                        break;
                    case 10:
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":1
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":3
                        });
                        displayKon.restricted = true;
                        displayKon.restrictArray.push(3, 4, 33);
                        chatBody.init(6);
                        break;
                    case 11:
                        aiSingArray.push({
                            "isON":false,
                            "dif":1,
                            "be":0
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":1
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":3
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":3,
                            "be":0
                        });
                        displayKon.restricted = false;
                        chatBody.init(7);
                        break;
                    default:
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        aiSingArray.push({
                            "isON":true,
                            "dif":2,
                            "be":99
                        });
                        chatBody.init(0);
                };
            };
            for (b in aiSetArray)
            {
                if (singlePlayerMode)
                {
                    if (aiSetArray[b] != playerControl)
                    {
                        if (aiSingArray[b].isON)
                        {
                            dif = aiSingArray[b].dif;
                            be = aiSingArray[b].be;
                            aiSetArray[b].startAi(0, dif, be);
                        };
                    };
                }
                else
                {
                    if (roomMaster)
                    {
                        for (v2 in allPlayers)
                        {
                            aiProfile = 0;
                            if (allPlayers[v2].NAME == "Easy CPU")
                            {
                                aiProfile = 1;
                            };
                            if (allPlayers[v2].NAME == "Normal CPU")
                            {
                                aiProfile = 2;
                            };
                            if (allPlayers[v2].NAME == "Hard CPU")
                            {
                                aiProfile = 4;
                            };
                            if (((!(aiProfile == 0)) && (allPlayers[v2].POS == (b + 1))))
                            {
                                aiSetArray[b].startAi(allPlayers[v2].POS, aiProfile);
                            };
                        };
                    };
                };
            };
            if (singlePlayerMode)
            {
                switch (singleLevel)
                {
                    case 7:
                        mission2StartAi();
                        break;
                };
            };
            addEventListener(MouseEvent.MOUSE_DOWN, beginDraw);
            addEventListener(MouseEvent.MOUSE_UP, endDraw);
            mouseLasso = new Sprite();
            drawing = false;
            addChild(mouseLasso);
            ToolTip = new toolTip(stage, this);
            addChild(ToolTip);
            ToolTip.x = mouseX;
            ToolTip.y = mouseY;
            dragRect = new Rectangle(0, 0, 550, 530);
            ToolTip.startDrag(false, dragRect);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyD);
            stage.addEventListener(KeyboardEvent.KEY_UP, keyU);
            stage.addEventListener(Event.DEACTIVATE, keyC);
            screenGoLeft = false;
            screenGoRight = false;
            hotkeyArray = new Array(49, 50, 51, 52, 81, 87, 69, 82);
            hotbutArray = new Array(b0, b1, b2, b3, b4, b5, b6, b7);
            chatPanel.text = "";
            uiGlow = new GlowFilter(2744852, 1, 7, 7, 0.62, 1, false, false);
            uiGlowIn = new GlowFilter(14483141, 1, 15, 15, 10, 1, true, false);
            uiGlowIn2 = new GlowFilter(8911994, 1, 4, 4, 1, 1, true, false);
            updateUIOptions();
            fg = 0;
            while (fg < 6)
            {
                uiLay[("bg_" + fg)].id = fg;
                uiLay[("bg_" + fg)].theIcon.gotoAndStop((fg + 1));
                fg++;
            };
            uiCombatTipOn = new Array();
            uiCombatTipOn.push(new tipObject("Auto-Build: ON", 0, 0, 0, "If this is on, any option from a building that you click will try to repeat itself after it finishes. You can also toggle this by holding Shift."));
            uiCombatTipOn.push(new tipObject("Rally Point: ON", 0, 0, 0, "Units will mobilize in front of the base after they have been deployed."));
            uiCombatTipOn.push(new tipObject("Allied Chat: ON", 0, 0, 0, "Chat messages will only be sent to your ally."));
            uiCombatTipOn.push(new tipObject("Sound: ON", 0, 0, 0, "Sound effects are on."));
            uiCombatTipOn.push(new tipObject("Music: ON", 0, 0, 0, "Music is on."));
            uiCombatTipOn.push(new tipObject("Quit", 0, 0, 0, "Exit the game."));
            uiCombatTipOff = new Array();
            uiCombatTipOff.push(new tipObject("Auto-Build: OFF", 0, 0, 0, "Any options you build from a building will not repeat itself. You can also toggle this by holding Shift."));
            uiCombatTipOff.push(new tipObject("Rally Point: OFF", 0, 0, 0, "Units will attack as soon as they are deployed."));
            uiCombatTipOff.push(new tipObject("Allied Chat: OFF", 0, 0, 0, "Chat messages will be sent to all players in the game."));
            uiCombatTipOff.push(new tipObject("Sound: OFF", 0, 0, 0, "Sound effects are off."));
            uiCombatTipOff.push(new tipObject("Music: OFF", 0, 0, 0, "Music is off."));
            uiCombatTipOff.push(new tipObject("Quit", 0, 0, 0, "Exit the game."));
            b8.addEventListener(MouseEvent.MOUSE_OVER, overText);
            b8.addEventListener(MouseEvent.MOUSE_OUT, emptyText);
            oi.addEventListener(MouseEvent.MOUSE_OVER, overText2);
            oi.addEventListener(MouseEvent.MOUSE_OUT, emptyText);
            cText = new tipObject("Cancel", 0, 0, 0, "Click to cancel this action. You will receive a full refund.");
        }

        internal function frame34():*
        {
            __setProp_button_res_POST_Layer1_33();
            if (winGame)
            {
                if (((missionMax == missionLevel) && (missionMax < 7)))
                {
                    missionMax++;
                    saveGame.data.al = missionMax;
                    saveGame.flush();
                };
                shower.text = "VICTORY";
                removeChild(d_screen);
                d_screen.stop();
                d_screen.visible = false;
                d_screen = null;
            }
            else
            {
                shower.text = "DEFEAT";
                removeChild(v_screen);
                v_screen.stop();
                v_screen.visible = false;
                v_screen = null;
            };
            button_res.addEventListener(MouseEvent.MOUSE_UP, restart, false, 0, true);
        }

        internal function frame35():*
        {
            stop();
            ag_lockBut.addEventListener(MouseEvent.CLICK, getAGURL, false, 0, true);
        }


    }
}//package ColonyFinal_fla

