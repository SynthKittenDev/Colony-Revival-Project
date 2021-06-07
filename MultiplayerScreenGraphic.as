// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//MultiplayerScreenGraphic

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import fl.controls.Button;
    import fl.controls.List;
    import fl.controls.UIScrollBar;
    import flash.display.SimpleButton;
    import fl.controls.ComboBox;
    import flash.text.TextFormat;
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

    public dynamic class MultiplayerScreenGraphic extends MovieClip 
    {

        public var s_cwins:TextField;
        public var s_gplayed:TextField;
        public var bt_buddyList:Button;
        public var theList:List;
        public var __id2_:Button;
        public var scr_1:UIScrollBar;
        public var raceButton:SimpleButton;
        public var scr_2:UIScrollBar;
        public var roomBox:ComboBox;
        public var s_wratio:TextField;
        public var exitButton:Button;
        public var chatBox:TextField;
        public var textBox:TextField;
        public var racePlate:MovieClip;
        public var chatSend:TextField;
        public var InstanceName_0:MovieClip;
        public var createGameButton:Button;
        public var ranker:MovieClip;
        public var s_rank:TextField;
        public var s_gwon:TextField;
        public var joinGameButton:Button;
        public var T:MenuFont;
        public var tf:TextFormat;

        public function MultiplayerScreenGraphic()
        {
            addFrameScript(0, frame1);
            __setProp_exitButton_MultiplayerScreenGraphic_Layer2_0();
            __setProp_joinGameButton_MultiplayerScreenGraphic_Layer2_0();
            __setProp_createGameButton_MultiplayerScreenGraphic_Layer2_0();
            __setProp_bt_buddyList_MultiplayerScreenGraphic_Layer2_0();
            __setProp___id2__MultiplayerScreenGraphic_Layer2_0();
            __setProp_roomBox_MultiplayerScreenGraphic_Layer2_0();
            __setProp_scr_1_MultiplayerScreenGraphic_Layer2_0();
            __setProp_scr_2_MultiplayerScreenGraphic_Layer2_0();
        }

        internal function __setProp_exitButton_MultiplayerScreenGraphic_Layer2_0():*
        {
            try
            {
                exitButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            exitButton.emphasized = false;
            exitButton.enabled = true;
            exitButton.label = "Exit Lobby";
            exitButton.labelPlacement = "right";
            exitButton.selected = false;
            exitButton.toggle = false;
            exitButton.visible = true;
            try
            {
                exitButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_joinGameButton_MultiplayerScreenGraphic_Layer2_0():*
        {
            try
            {
                joinGameButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            joinGameButton.emphasized = false;
            joinGameButton.enabled = true;
            joinGameButton.label = "Join Game";
            joinGameButton.labelPlacement = "right";
            joinGameButton.selected = false;
            joinGameButton.toggle = false;
            joinGameButton.visible = true;
            try
            {
                joinGameButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_createGameButton_MultiplayerScreenGraphic_Layer2_0():*
        {
            try
            {
                createGameButton["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            createGameButton.emphasized = false;
            createGameButton.enabled = true;
            createGameButton.label = "Create Game";
            createGameButton.labelPlacement = "right";
            createGameButton.selected = false;
            createGameButton.toggle = false;
            createGameButton.visible = true;
            try
            {
                createGameButton["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_bt_buddyList_MultiplayerScreenGraphic_Layer2_0():*
        {
            try
            {
                bt_buddyList["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            bt_buddyList.emphasized = false;
            bt_buddyList.enabled = true;
            bt_buddyList.label = "Buddy List";
            bt_buddyList.labelPlacement = "right";
            bt_buddyList.selected = false;
            bt_buddyList.toggle = false;
            bt_buddyList.visible = true;
            try
            {
                bt_buddyList["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp___id2__MultiplayerScreenGraphic_Layer2_0():*
        {
            try
            {
                __id2_["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            __id2_.emphasized = false;
            __id2_.enabled = true;
            __id2_.label = "Play Quick Game";
            __id2_.labelPlacement = "right";
            __id2_.selected = false;
            __id2_.toggle = false;
            __id2_.visible = true;
            try
            {
                __id2_["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_roomBox_MultiplayerScreenGraphic_Layer2_0():*
        {
            var itemObj3:SimpleCollectionItem;
            var collProps3:Array;
            var collProp3:Object;
            var i3:int;
            var j3:* = undefined;
            try
            {
                roomBox["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            var collObj3:DataProvider = new DataProvider();
            collProps3 = [{
                "label":"Lobby",
                "data":""
            }, {
                "label":"Team Channel",
                "data":""
            }];
            i3 = 0;
            while (i3 < collProps3.length)
            {
                itemObj3 = new SimpleCollectionItem();
                collProp3 = collProps3[i3];
                for (j3 in collProp3)
                {
                    itemObj3[j3] = collProp3[j3];
                };
                collObj3.addItem(itemObj3);
                i3 = (i3 + 1);
            };
            roomBox.dataProvider = collObj3;
            roomBox.editable = false;
            roomBox.enabled = true;
            roomBox.prompt = "";
            roomBox.restrict = "";
            roomBox.rowCount = 5;
            roomBox.visible = true;
            try
            {
                roomBox["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function __setProp_scr_1_MultiplayerScreenGraphic_Layer2_0():*
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

        internal function __setProp_scr_2_MultiplayerScreenGraphic_Layer2_0():*
        {
            try
            {
                scr_2["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            scr_2.direction = "vertical";
            scr_2.scrollTargetName = "textBox";
            scr_2.visible = true;
            try
            {
                scr_2["componentInspectorSetting"] = false;
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
            exitButton.setStyle("textFormat", tf);
            joinGameButton.setStyle("textFormat", tf);
            createGameButton.setStyle("textFormat", tf);
            bt_buddyList.setStyle("textFormat", tf);
            theList.setRendererStyle("textFormat", tf);
        }


    }
}//package 

