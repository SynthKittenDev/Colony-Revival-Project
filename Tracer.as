// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//Tracer

package 
{
    import flash.display.MovieClip;
    import flash.text.TextField;
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;

    public dynamic class Tracer extends MovieClip 
    {

        public var tr:TextField;
        public var traBut:SimpleButton;

        public function Tracer()
        {
            addFrameScript(0, frame1);
        }

        public function hideTra(e:MouseEvent):void
        {
            if (!dataTracer.progressing)
            {
                dataTracer.hideTracer();
                dataTracer.theStage.dispatchEvent(new chatEvent("CLOSETRACER"));
            };
        }

        internal function frame1():*
        {
            traBut.addEventListener(MouseEvent.CLICK, hideTra, false, 0, true);
        }


    }
}//package 

