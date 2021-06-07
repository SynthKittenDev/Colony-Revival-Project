// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.baseGraphicsHolder_301

package ColonyFinal_fla
{
    import flash.display.MovieClip;

    public dynamic class baseGraphicsHolder_301 extends MovieClip 
    {

        public var bgi:MovieClip;

        public function baseGraphicsHolder_301()
        {
            addFrameScript(0, frame1, 1, frame2, 10, frame11, 26, frame27, 43, frame44);
        }

        internal function frame1():*
        {
            visible = false;
            stop();
        }

        internal function frame2():*
        {
            stop();
        }

        internal function frame11():*
        {
            visible = true;
        }

        internal function frame27():*
        {
            gotoAndStop("Built");
        }

        internal function frame44():*
        {
            visible = false;
            gotoAndStop("Built");
        }


    }
}//package ColonyFinal_fla

