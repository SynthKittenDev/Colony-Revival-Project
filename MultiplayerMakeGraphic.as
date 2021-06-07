// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//MultiplayerMakeGraphic

package 
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.text.TextField;
    import fl.controls.Button;
    import flash.text.TextFormat;
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

    public dynamic class MultiplayerMakeGraphic extends MovieClip 
    {

        public var setChange:SimpleButton;
        public var gameName:TextField;
        public var gameSetting:MovieClip;
        public var backLobby:Button;
        public var makeGame:Button;
        public var T:MenuFont;
        public var tf:TextFormat;

        public function MultiplayerMakeGraphic()
        {
            addFrameScript(0, frame1);
            __setProp_backLobby_MultiplayerMake_Layer3_0();
            __setProp_makeGame_MultiplayerMake_Layer3_0();
        }

        internal function __setProp_backLobby_MultiplayerMake_Layer3_0():*
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

        internal function __setProp_makeGame_MultiplayerMake_Layer3_0():*
        {
            try
            {
                makeGame["componentInspectorSetting"] = true;
            }
            catch(e:Error)
            {
            };
            makeGame.emphasized = false;
            makeGame.enabled = true;
            makeGame.label = "Create Game";
            makeGame.labelPlacement = "right";
            makeGame.selected = false;
            makeGame.toggle = false;
            makeGame.visible = true;
            try
            {
                makeGame["componentInspectorSetting"] = false;
            }
            catch(e:Error)
            {
            };
        }

        internal function frame1():*
        {
            T = new MenuFont();
            tf = new TextFormat();
            tf.font = T.fontName;
            tf.size = 14;
            tf.color = 0;
            makeGame.setStyle("textFormat", tf);
            backLobby.setStyle("textFormat", tf);
        }


    }
}//package 

