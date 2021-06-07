// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.iconCombatButton_234

package ColonyFinal_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
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

    public dynamic class iconCombatButton_234 extends MovieClip 
    {

        public var theIcon:MovieClip;
        public var theButton:SimpleButton;
        public var id:uint;

        public function iconCombatButton_234()
        {
            addFrameScript(0, frame1);
        }

        public function doThing(e:MouseEvent):void
        {
            gameKon.theRoot.uiCombatBut(id);
        }

        public function showTTui(e:MouseEvent):void
        {
            gameKon.theRoot.combatUiTT(id);
        }

        public function hideTTui(e:MouseEvent):void
        {
            toolTip.unTip();
        }

        internal function frame1():*
        {
            theButton.addEventListener(MouseEvent.CLICK, doThing, false, 0, true);
            theButton.addEventListener(MouseEvent.MOUSE_OVER, showTTui, false, 0, true);
            theButton.addEventListener(MouseEvent.MOUSE_OUT, hideTTui, false, 0, true);
        }


    }
}//package ColonyFinal_fla

