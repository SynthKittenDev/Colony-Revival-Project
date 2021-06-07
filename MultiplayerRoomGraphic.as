// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//MultiplayerRoomGraphic

package 
{
    import flash.display.MovieClip;
    import fl.controls.UIScrollBar;
    import fl.controls.ComboBox;
    import fl.controls.Button;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.display.DisplayObject;
    import fl.data.SimpleCollectionItem;
    import fl.data.DataProvider;
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

    public dynamic class MultiplayerRoomGraphic extends MovieClip 
    {

        public var d1:MovieClip;
        public var d2:MovieClip;
        public var d3:MovieClip;
        public var d4:MovieClip;
        public var ranker_4:MovieClip;
        public var ranker_3:MovieClip;
        public var adBox:MovieClip;
        public var ranker_2:MovieClip;
        public var ranker_1:MovieClip;
        public var scr_1:UIScrollBar;
        public var c1:ComboBox;
        public var c2:ComboBox;
        public var c3:ComboBox;
        public var c4:ComboBox;
        public var startGame:Button;
        public var textBox:TextField;
        public var chatBox:TextField;
        public var gameSetting:MovieClip;
        public var chatSend:TextField;
        public var InstanceName_1:MovieClip;
        public var backLobby:Button;
        public var InstanceName_2:MovieClip;
        public var T:MenuFont;
        public var tf:TextFormat;
        public var CPMStarPoolID:int;
        public var CPMStarSubPoolID:int;
        public var ad:DisplayObject;

        public function MultiplayerRoomGraphic()
        {
            addFrameScript(0, frame1);
            __setProp_backLobby_MultiplayerRoom_Layer2_0();
            __setProp_startGame_MultiplayerRoom_Layer2_0();
            __setProp_c1_MultiplayerRoom_Layer2_0();
            __setProp_c2_MultiplayerRoom_Layer2_0();
            __setProp_c3_MultiplayerRoom_Layer2_0();
            __setProp_c4_MultiplayerRoom_Layer2_0();
            __setProp_scr_1_MultiplayerRoom_Layer2_0();
        }

        internal function __setProp_backLobby_MultiplayerRoom_Layer2_0():*
        {
            try
            {
                backLobby["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            backLobby.emphasized = false;
            backLobby.enabled = true;
            backLobby.label = "Exit to Lobby";
            backLobby.labelPlacement = "right";
            backLobby.selected = false;
            backLobby.toggle = false;
            backLobby.visible = true;
            try
            {
                backLobby["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_startGame_MultiplayerRoom_Layer2_0():*
        {
            try
            {
                startGame["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            startGame.emphasized = false;
            startGame.enabled = true;
            startGame.label = "Start Game";
            startGame.labelPlacement = "right";
            startGame.selected = false;
            startGame.toggle = false;
            startGame.visible = true;
            try
            {
                startGame["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_c1_MultiplayerRoom_Layer2_0():*
        {
            var itemObj4:SimpleCollectionItem;
            var collProps4:Array;
            var collProp4:Object;
            var i4:int;
            var j4:* = undefined;
            try
            {
                c1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            var collObj4:DataProvider = new DataProvider();
            collProps4 = [{
                "label":"None",
                "data":"Computer"
            }];
            i4 = 0;
            while (i4 < collProps4.length)
            {
                itemObj4 = new SimpleCollectionItem();
                collProp4 = collProps4[i4];
                for (j4 in collProp4)
                {
                    itemObj4[j4] = collProp4[j4];
                };
                collObj4.addItem(itemObj4);
                i4 = (i4 + 1);
            };
            c1.dataProvider = collObj4;
            c1.editable = false;
            c1.enabled = true;
            c1.prompt = "";
            c1.restrict = "";
            c1.rowCount = 5;
            c1.visible = true;
            try
            {
                c1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_c2_MultiplayerRoom_Layer2_0():*
        {
            var itemObj5:SimpleCollectionItem;
            var collProps5:Array;
            var collProp5:Object;
            var i5:int;
            var j5:* = undefined;
            try
            {
                c2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            var collObj5:DataProvider = new DataProvider();
            collProps5 = [{
                "label":"None",
                "data":"Computer"
            }];
            i5 = 0;
            while (i5 < collProps5.length)
            {
                itemObj5 = new SimpleCollectionItem();
                collProp5 = collProps5[i5];
                for (j5 in collProp5)
                {
                    itemObj5[j5] = collProp5[j5];
                };
                collObj5.addItem(itemObj5);
                i5 = (i5 + 1);
            };
            c2.dataProvider = collObj5;
            c2.editable = false;
            c2.enabled = true;
            c2.prompt = "";
            c2.restrict = "";
            c2.rowCount = 5;
            c2.visible = true;
            try
            {
                c2["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_c3_MultiplayerRoom_Layer2_0():*
        {
            var itemObj6:SimpleCollectionItem;
            var collProps6:Array;
            var collProp6:Object;
            var i6:int;
            var j6:* = undefined;
            try
            {
                c3["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            var collObj6:DataProvider = new DataProvider();
            collProps6 = [{
                "label":"None",
                "data":"Computer"
            }];
            i6 = 0;
            while (i6 < collProps6.length)
            {
                itemObj6 = new SimpleCollectionItem();
                collProp6 = collProps6[i6];
                for (j6 in collProp6)
                {
                    itemObj6[j6] = collProp6[j6];
                };
                collObj6.addItem(itemObj6);
                i6 = (i6 + 1);
            };
            c3.dataProvider = collObj6;
            c3.editable = false;
            c3.enabled = true;
            c3.prompt = "";
            c3.restrict = "";
            c3.rowCount = 5;
            c3.visible = true;
            try
            {
                c3["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_c4_MultiplayerRoom_Layer2_0():*
        {
            var itemObj7:SimpleCollectionItem;
            var collProps7:Array;
            var collProp7:Object;
            var i7:int;
            var j7:* = undefined;
            try
            {
                c4["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            var collObj7:DataProvider = new DataProvider();
            collProps7 = [{
                "label":"None",
                "data":"Computer"
            }];
            i7 = 0;
            while (i7 < collProps7.length)
            {
                itemObj7 = new SimpleCollectionItem();
                collProp7 = collProps7[i7];
                for (j7 in collProp7)
                {
                    itemObj7[j7] = collProp7[j7];
                };
                collObj7.addItem(itemObj7);
                i7 = (i7 + 1);
            };
            c4.dataProvider = collObj7;
            c4.editable = false;
            c4.enabled = true;
            c4.prompt = "";
            c4.restrict = "";
            c4.rowCount = 5;
            c4.visible = true;
            try
            {
                c4["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_scr_1_MultiplayerRoom_Layer2_0():*
        {
            try
            {
                scr_1["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            scr_1.direction = "vertical";
            scr_1.scrollTargetName = "chatBox";
            scr_1.visible = true;
            try
            {
                scr_1["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function frame1():*
        {
            stop();
            T = new MenuFont();
            tf = new TextFormat();
            tf.font = T.fontName;
            tf.size = 14;
            tf.color = 0;
            backLobby.setStyle("textFormat", tf);
            startGame.setStyle("textFormat", tf);
            CPMStarPoolID = 1052;
            CPMStarSubPoolID = 37;
            ad = AdLoader.LoadAd(CPMStarPoolID, CPMStarSubPoolID);
            adBox.addChild(ad);
        }


    }
}//package 

