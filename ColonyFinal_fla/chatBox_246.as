// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//ColonyFinal_fla.chatBox_246

package ColonyFinal_fla
{
    import flash.display.MovieClip;
    import flash.events.Event;
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

    public dynamic class chatBox_246 extends MovieClip 
    {

        public var sb:MovieClip;
        public var innerBox:MovieClip;
        public var maxY:Number;
        public var viewLength:Number;
        public var minY:Number;
        public var scrollSpeed:Number;
        public var moveDir:int;
        public var ind:Number;
        public var sb_T:Number;
        public var sb_B:Number;
        public var sb_G:Number;

        public function chatBox_246()
        {
            addFrameScript(0, frame1);
        }

        public function scrollDragS(me:MouseEvent):void
        {
            sb.addEventListener(Event.ENTER_FRAME, mouserMove, false, 0, true);
        }

        public function scrollDragE(me:MouseEvent):void
        {
            sb.removeEventListener(Event.ENTER_FRAME, mouserMove);
        }

        public function mouserMove(e:Event):void
        {
            sb.bob.y = (sb.mouseY - (sb.bob.height / 2));
            if (sb.bob.y < sb_T)
            {
                sb.bob.y = sb_T;
            };
            if ((sb.bob.y + sb.bob.height) > sb_B)
            {
                sb.bob.y = (sb_B - sb.bob.height);
            };
            ind = (((sb_B - sb.bob.height) - sb.bob.y) / sb_G);
            innerBox.y = ((ind * (maxY - minY)) + minY);
        }

        public function updateNavBar():void
        {
            if (maxY > (viewLength + 15))
            {
                sb.bob.height = ((viewLength / maxY) * 84.5);
                sb.bob.visible = true;
                sb.visible = true;
                ind = ((innerBox.y - minY) / (maxY - minY));
                sb_G = ((sb_B - sb_T) - sb.bob.height);
                sb.bob.y = ((sb_B - sb.bob.height) - (ind * sb_G));
            }
            else
            {
                sb.bob.visible = false;
                sb.visible = false;
            };
        }

        public function moveText(e:Event):void
        {
            if ((((innerBox.y < maxY) && (moveDir == 1)) || ((innerBox.y > minY) && (moveDir == -1))))
            {
                innerBox.y = (innerBox.y + (scrollSpeed * moveDir));
                updateNavBar();
            };
        }

        public function addScrollUp(e:MouseEvent):void
        {
            moveDir = 1;
            addEventListener(Event.ENTER_FRAME, moveText, false, 0, true);
        }

        public function addScrollDown(e:MouseEvent):void
        {
            moveDir = -1;
            addEventListener(Event.ENTER_FRAME, moveText, false, 0, true);
        }

        public function removeScroll(e:MouseEvent):void
        {
            removeEventListener(Event.ENTER_FRAME, moveText);
        }

        internal function frame1():*
        {
            viewLength = 103;
            minY = innerBox.y;
            scrollSpeed = 6;
            sb_T = 12;
            sb_B = 93.5;
            sb.visible = false;
            sb.butUp.addEventListener(MouseEvent.MOUSE_DOWN, addScrollUp, false, 0, true);
            sb.butDown.addEventListener(MouseEvent.MOUSE_DOWN, addScrollDown, false, 0, true);
            sb.butUp.addEventListener(MouseEvent.MOUSE_UP, removeScroll, false, 0, true);
            sb.butDown.addEventListener(MouseEvent.MOUSE_UP, removeScroll, false, 0, true);
            sb.bob.addEventListener(MouseEvent.MOUSE_DOWN, scrollDragS, false, 0, true);
            parent.stage.addEventListener(MouseEvent.MOUSE_UP, scrollDragE, false, 0, true);
        }


    }
}//package ColonyFinal_fla

