﻿// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.d_mc2_10

package ColonyFinal_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    public dynamic class d_mc2_10 extends MovieClip 
    {

        public var inBut:SimpleButton;
        public var tDate:String;
        public var tSay:String;

        public function d_mc2_10()
        {
            addFrameScript(0, frame1);
        }

        public function doFunction(me:MouseEvent):void
        {
            toolTip.tip(new tipObject(tDate, 0, 0, 0, tSay), 0);
        }

        public function outFunction(me:MouseEvent):void
        {
            toolTip.unTip();
        }

        internal function frame1():*
        {
            inBut.addEventListener(MouseEvent.MOUSE_OVER, doFunction, false, 0, true);
            inBut.addEventListener(MouseEvent.MOUSE_OUT, outFunction, false, 0, true);
            tDate = "2132";
            tSay = "A habitable planet, Minerva, has finally been indentified by the Planck-IV telescope.";
            inBut.useHandCursor = false;
        }


    }
}//package ColonyFinal_fla

