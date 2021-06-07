// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.UIScrollBar

package fl.controls
{
    import flash.text.TextField;
    import fl.core.UIComponent;
    import flash.events.Event;
    import fl.events.ScrollEvent;
    import fl.core.InvalidationType;
    import flash.events.TextEvent;

    public class UIScrollBar extends ScrollBar 
    {

        private static var defaultStyles:Object = {};

        protected var _scrollTarget:TextField;

        protected var inEdit:Boolean = false;
        protected var inScroll:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition()));
        }


        protected function handleTargetScroll(_arg_1:Event):void
        {
            if (inDrag)
            {
                return;
            };
            if (!enabled)
            {
                return;
            };
            inEdit = true;
            updateScrollTargetProperties();
            scrollPosition = ((direction == ScrollBarDirection.HORIZONTAL) ? _scrollTarget.scrollH : _scrollTarget.scrollV);
            inEdit = false;
        }

        override public function set minScrollPosition(_arg_1:Number):void
        {
            super.minScrollPosition = ((_arg_1 < 0) ? 0 : _arg_1);
        }

        override public function setScrollPosition(_arg_1:Number, _arg_2:Boolean=true):void
        {
            super.setScrollPosition(_arg_1, _arg_2);
            if (!_scrollTarget)
            {
                inScroll = false;
                return;
            };
            updateTargetScroll();
        }

        override public function setScrollProperties(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=0):void
        {
            var _local_5:Number;
            var _local_6:Number;
            _local_5 = _arg_3;
            _local_6 = ((_arg_2 < 0) ? 0 : _arg_2);
            if (_scrollTarget != null)
            {
                if (direction == ScrollBarDirection.HORIZONTAL)
                {
                    _local_5 = ((_arg_3 > _scrollTarget.maxScrollH) ? _scrollTarget.maxScrollH : _local_5);
                }
                else
                {
                    _local_5 = ((_arg_3 > _scrollTarget.maxScrollV) ? _scrollTarget.maxScrollV : _local_5);
                };
            };
            super.setScrollProperties(_arg_1, _local_6, _local_5, _arg_4);
        }

        public function get scrollTargetName():String
        {
            return (_scrollTarget.name);
        }

        public function get scrollTarget():TextField
        {
            return (_scrollTarget);
        }

        protected function updateScrollTargetProperties():void
        {
            var _local_1:Boolean;
            var _local_2:Number;
            if (_scrollTarget == null)
            {
                setScrollProperties(pageSize, minScrollPosition, maxScrollPosition, pageScrollSize);
                scrollPosition = 0;
            }
            else
            {
                _local_1 = (direction == ScrollBarDirection.HORIZONTAL);
                _local_2 = ((_local_1) ? _scrollTarget.width : 10);
                setScrollProperties(_local_2, ((_local_1) ? 0 : 1), ((_local_1) ? _scrollTarget.maxScrollH : _scrollTarget.maxScrollV), pageScrollSize);
                scrollPosition = ((_local_1) ? _scrollTarget.scrollH : _scrollTarget.scrollV);
            };
        }

        public function update():void
        {
            inEdit = true;
            updateScrollTargetProperties();
            inEdit = false;
        }

        public function set scrollTargetName(target:String):void
        {
            try
            {
                scrollTarget = (parent.getChildByName(target) as TextField);
            }
            catch(error:Error)
            {
                throw (new Error("ScrollTarget not found, or is not a TextField"));
            };
        }

        override public function set direction(_arg_1:String):void
        {
            if (isLivePreview)
            {
                return;
            };
            super.direction = _arg_1;
            updateScrollTargetProperties();
        }

        protected function handleTargetChange(_arg_1:Event):void
        {
            inEdit = true;
            setScrollPosition(((direction == ScrollBarDirection.HORIZONTAL) ? _scrollTarget.scrollH : _scrollTarget.scrollV), true);
            updateScrollTargetProperties();
            inEdit = false;
        }

        override public function set maxScrollPosition(_arg_1:Number):void
        {
            var _local_2:Number;
            _local_2 = _arg_1;
            if (_scrollTarget != null)
            {
                if (direction == ScrollBarDirection.HORIZONTAL)
                {
                    _local_2 = ((_local_2 > _scrollTarget.maxScrollH) ? _scrollTarget.maxScrollH : _local_2);
                }
                else
                {
                    _local_2 = ((_local_2 > _scrollTarget.maxScrollV) ? _scrollTarget.maxScrollV : _local_2);
                };
            };
            super.maxScrollPosition = _local_2;
        }

        protected function updateTargetScroll(_arg_1:ScrollEvent=null):void
        {
            if (inEdit)
            {
                return;
            };
            if (direction == ScrollBarDirection.HORIZONTAL)
            {
                _scrollTarget.scrollH = scrollPosition;
            }
            else
            {
                _scrollTarget.scrollV = scrollPosition;
            };
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.DATA))
            {
                updateScrollTargetProperties();
            };
            super.draw();
        }

        public function set scrollTarget(_arg_1:TextField):void
        {
            if (_scrollTarget != null)
            {
                _scrollTarget.removeEventListener(Event.CHANGE, handleTargetChange, false);
                _scrollTarget.removeEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false);
                _scrollTarget.removeEventListener(Event.SCROLL, handleTargetScroll, false);
                removeEventListener(ScrollEvent.SCROLL, updateTargetScroll, false);
            };
            _scrollTarget = _arg_1;
            if (_scrollTarget != null)
            {
                _scrollTarget.addEventListener(Event.CHANGE, handleTargetChange, false, 0, true);
                _scrollTarget.addEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false, 0, true);
                _scrollTarget.addEventListener(Event.SCROLL, handleTargetScroll, false, 0, true);
                addEventListener(ScrollEvent.SCROLL, updateTargetScroll, false, 0, true);
            };
            invalidate(InvalidationType.DATA);
        }

        override public function get direction():String
        {
            return (super.direction);
        }


    }
}//package fl.controls

