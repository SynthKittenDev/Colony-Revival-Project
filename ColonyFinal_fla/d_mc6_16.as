// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.d_mc6_16

package ColonyFinal_fla
{
    import flash.display.MovieClip;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    public dynamic class d_mc6_16 extends MovieClip 
    {

        public var inBut:SimpleButton;
        public var tDate:String;
        public var tSay:String;

        public function d_mc6_16()
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
            tDate = "2252";
            tSay = "USC Ambassador proposes a special operation to supplement Athenia's labour force with life sentenced convicts and POWs. This was kept secret, and there was little protest.";
            inBut.useHandCursor = false;
        }


    }
}//package ColonyFinal_fla

