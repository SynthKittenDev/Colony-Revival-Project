// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.ScrollBar

package fl.controls
{
    import fl.core.UIComponent;
    import fl.events.ScrollEvent;
    import flash.events.MouseEvent;
    import fl.core.InvalidationType;
    import fl.events.ComponentEvent;

    public class ScrollBar extends UIComponent 
    {

        public static const WIDTH:Number = 15;
        private static var defaultStyles:Object = {
            "downArrowDisabledSkin":"ScrollArrowDown_disabledSkin",
            "downArrowDownSkin":"ScrollArrowDown_downSkin",
            "downArrowOverSkin":"ScrollArrowDown_overSkin",
            "downArrowUpSkin":"ScrollArrowDown_upSkin",
            "thumbDisabledSkin":"ScrollThumb_upSkin",
            "thumbDownSkin":"ScrollThumb_downSkin",
            "thumbOverSkin":"ScrollThumb_overSkin",
            "thumbUpSkin":"ScrollThumb_upSkin",
            "trackDisabledSkin":"ScrollTrack_skin",
            "trackDownSkin":"ScrollTrack_skin",
            "trackOverSkin":"ScrollTrack_skin",
            "trackUpSkin":"ScrollTrack_skin",
            "upArrowDisabledSkin":"ScrollArrowUp_disabledSkin",
            "upArrowDownSkin":"ScrollArrowUp_downSkin",
            "upArrowOverSkin":"ScrollArrowUp_overSkin",
            "upArrowUpSkin":"ScrollArrowUp_upSkin",
            "thumbIcon":"ScrollBar_thumbIcon",
            "repeatDelay":500,
            "repeatInterval":35
        };
        protected static const DOWN_ARROW_STYLES:Object = {
            "disabledSkin":"downArrowDisabledSkin",
            "downSkin":"downArrowDownSkin",
            "overSkin":"downArrowOverSkin",
            "upSkin":"downArrowUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };
        protected static const THUMB_STYLES:Object = {
            "disabledSkin":"thumbDisabledSkin",
            "downSkin":"thumbDownSkin",
            "overSkin":"thumbOverSkin",
            "upSkin":"thumbUpSkin",
            "icon":"thumbIcon",
            "textPadding":0
        };
        protected static const TRACK_STYLES:Object = {
            "disabledSkin":"trackDisabledSkin",
            "downSkin":"trackDownSkin",
            "overSkin":"trackOverSkin",
            "upSkin":"trackUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };
        protected static const UP_ARROW_STYLES:Object = {
            "disabledSkin":"upArrowDisabledSkin",
            "downSkin":"upArrowDownSkin",
            "overSkin":"upArrowOverSkin",
            "upSkin":"upArrowUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };

        protected var upArrow:BaseButton;
        protected var downArrow:BaseButton;
        private var thumbScrollOffset:Number;
        protected var track:BaseButton;
        protected var thumb:LabelButton;

        private var _pageSize:Number = 10;
        private var _pageScrollSize:Number = 0;
        private var _lineScrollSize:Number = 1;
        private var _minScrollPosition:Number = 0;
        private var _maxScrollPosition:Number = 0;
        private var _scrollPosition:Number = 0;
        private var _direction:String = ScrollBarDirection.VERTICAL;//"vertical"
        protected var inDrag:Boolean = false;

        public function ScrollBar()
        {
            setStyles();
            focusEnabled = false;
        }

        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        public function get minScrollPosition():Number
        {
            return (_minScrollPosition);
        }

        public function set minScrollPosition(_arg_1:Number):void
        {
            setScrollProperties(_pageSize, _arg_1, _maxScrollPosition);
        }

        public function setScrollPosition(_arg_1:Number, _arg_2:Boolean=true):void
        {
            var _local_3:Number;
            _local_3 = scrollPosition;
            _scrollPosition = Math.max(_minScrollPosition, Math.min(_maxScrollPosition, _arg_1));
            if (_local_3 == _scrollPosition)
            {
                return;
            };
            if (_arg_2)
            {
                dispatchEvent(new ScrollEvent(_direction, (scrollPosition - _local_3), scrollPosition));
            };
            updateThumb();
        }

        public function set scrollPosition(_arg_1:Number):void
        {
            setScrollPosition(_arg_1, true);
        }

        public function get pageScrollSize():Number
        {
            return ((_pageScrollSize == 0) ? _pageSize : _pageScrollSize);
        }

        public function set pageSize(_arg_1:Number):void
        {
            if (_arg_1 > 0)
            {
                _pageSize = _arg_1;
            };
        }

        public function setScrollProperties(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number=0):void
        {
            this.pageSize = _arg_1;
            _minScrollPosition = _arg_2;
            _maxScrollPosition = _arg_3;
            if (_arg_4 >= 0)
            {
                _pageScrollSize = _arg_4;
            };
            enabled = (_maxScrollPosition > _minScrollPosition);
            setScrollPosition(_scrollPosition, false);
            updateThumb();
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            downArrow.enabled = (track.enabled = (thumb.enabled = (upArrow.enabled = ((enabled) && (_maxScrollPosition > _minScrollPosition)))));
            updateThumb();
        }

        protected function updateThumb():void
        {
            var _local_1:Number;
            _local_1 = ((_maxScrollPosition - _minScrollPosition) + _pageSize);
            if ((((track.height <= 12) || (_maxScrollPosition <= _minScrollPosition)) || ((_local_1 == 0) || (isNaN(_local_1)))))
            {
                thumb.height = 12;
                thumb.visible = false;
            }
            else
            {
                thumb.height = Math.max(13, ((_pageSize / _local_1) * track.height));
                thumb.y = (track.y + ((track.height - thumb.height) * ((_scrollPosition - _minScrollPosition) / (_maxScrollPosition - _minScrollPosition))));
                thumb.visible = enabled;
            };
        }

        protected function thumbPressHandler(_arg_1:MouseEvent):void
        {
            inDrag = true;
            thumbScrollOffset = (mouseY - thumb.y);
            thumb.mouseStateLocked = true;
            mouseChildren = false;
            stage.addEventListener(MouseEvent.MOUSE_MOVE, handleThumbDrag, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, thumbReleaseHandler, false, 0, true);
        }

        protected function thumbReleaseHandler(_arg_1:MouseEvent):void
        {
            inDrag = false;
            mouseChildren = true;
            thumb.mouseStateLocked = false;
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleThumbDrag);
            stage.removeEventListener(MouseEvent.MOUSE_UP, thumbReleaseHandler);
        }

        public function set pageScrollSize(_arg_1:Number):void
        {
            if (_arg_1 >= 0)
            {
                _pageScrollSize = _arg_1;
            };
        }

        protected function handleThumbDrag(_arg_1:MouseEvent):void
        {
            var _local_2:Number;
            _local_2 = Math.max(0, Math.min((track.height - thumb.height), ((mouseY - track.y) - thumbScrollOffset)));
            setScrollPosition((((_local_2 / (track.height - thumb.height)) * (_maxScrollPosition - _minScrollPosition)) + _minScrollPosition));
        }

        public function set direction(_arg_1:String):void
        {
            var _local_2:Boolean;
            if (_direction == _arg_1)
            {
                return;
            };
            _direction = _arg_1;
            if (isLivePreview)
            {
                return;
            };
            setScaleY(1);
            _local_2 = (_direction == ScrollBarDirection.HORIZONTAL);
            if (((_local_2) && (componentInspectorSetting)))
            {
                if (rotation == 90)
                {
                    return;
                };
                setScaleX(-1);
                rotation = -90;
            };
            if (!componentInspectorSetting)
            {
                if (((_local_2) && (rotation == 0)))
                {
                    rotation = -90;
                    setScaleX(-1);
                }
                else
                {
                    if (((!(_local_2)) && (rotation == -90)))
                    {
                        rotation = 0;
                        setScaleX(1);
                    };
                };
            };
            invalidate(InvalidationType.SIZE);
        }

        public function set lineScrollSize(_arg_1:Number):void
        {
            if (_arg_1 > 0)
            {
                _lineScrollSize = _arg_1;
            };
        }

        override public function get height():Number
        {
            return ((_direction == ScrollBarDirection.HORIZONTAL) ? super.width : super.height);
        }

        protected function scrollPressHandler(_arg_1:ComponentEvent):void
        {
            var _local_2:Number;
            var _local_3:Number;
            _arg_1.stopImmediatePropagation();
            if (_arg_1.currentTarget == upArrow)
            {
                setScrollPosition((_scrollPosition - _lineScrollSize));
            }
            else
            {
                if (_arg_1.currentTarget == downArrow)
                {
                    setScrollPosition((_scrollPosition + _lineScrollSize));
                }
                else
                {
                    _local_2 = (((track.mouseY / track.height) * (_maxScrollPosition - _minScrollPosition)) + _minScrollPosition);
                    _local_3 = ((pageScrollSize == 0) ? pageSize : pageScrollSize);
                    if (_scrollPosition < _local_2)
                    {
                        setScrollPosition(Math.min(_local_2, (_scrollPosition + _local_3)));
                    }
                    else
                    {
                        if (_scrollPosition > _local_2)
                        {
                            setScrollPosition(Math.max(_local_2, (_scrollPosition - _local_3)));
                        };
                    };
                };
            };
        }

        public function get pageSize():Number
        {
            return (_pageSize);
        }

        public function set maxScrollPosition(_arg_1:Number):void
        {
            setScrollProperties(_pageSize, _minScrollPosition, _arg_1);
        }

        public function get scrollPosition():Number
        {
            return (_scrollPosition);
        }

        override public function get enabled():Boolean
        {
            return (super.enabled);
        }

        override protected function draw():void
        {
            var _local_1:Number;
            if (isInvalid(InvalidationType.SIZE))
            {
                _local_1 = super.height;
                downArrow.move(0, Math.max(upArrow.height, (_local_1 - downArrow.height)));
                track.setSize(WIDTH, Math.max(0, (_local_1 - (downArrow.height + upArrow.height))));
                updateThumb();
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                setStyles();
            };
            downArrow.drawNow();
            upArrow.drawNow();
            track.drawNow();
            thumb.drawNow();
            validate();
        }

        override protected function configUI():void
        {
            super.configUI();
            track = new BaseButton();
            track.move(0, 14);
            track.useHandCursor = false;
            track.autoRepeat = true;
            track.focusEnabled = false;
            addChild(track);
            thumb = new LabelButton();
            thumb.label = "";
            thumb.setSize(WIDTH, 15);
            thumb.move(0, 15);
            thumb.focusEnabled = false;
            addChild(thumb);
            downArrow = new BaseButton();
            downArrow.setSize(WIDTH, 14);
            downArrow.autoRepeat = true;
            downArrow.focusEnabled = false;
            addChild(downArrow);
            upArrow = new BaseButton();
            upArrow.setSize(WIDTH, 14);
            upArrow.move(0, 0);
            upArrow.autoRepeat = true;
            upArrow.focusEnabled = false;
            addChild(upArrow);
            upArrow.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
            downArrow.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
            track.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
            thumb.addEventListener(MouseEvent.MOUSE_DOWN, thumbPressHandler, false, 0, true);
            enabled = false;
        }

        public function get direction():String
        {
            return (_direction);
        }

        public function get lineScrollSize():Number
        {
            return (_lineScrollSize);
        }

        override public function setSize(_arg_1:Number, _arg_2:Number):void
        {
            if (_direction == ScrollBarDirection.HORIZONTAL)
            {
                super.setSize(_arg_2, _arg_1);
            }
            else
            {
                super.setSize(_arg_1, _arg_2);
            };
        }

        public function get maxScrollPosition():Number
        {
            return (_maxScrollPosition);
        }

        override public function get width():Number
        {
            return ((_direction == ScrollBarDirection.HORIZONTAL) ? super.height : super.width);
        }

        protected function setStyles():void
        {
            copyStylesToChild(downArrow, DOWN_ARROW_STYLES);
            copyStylesToChild(thumb, THUMB_STYLES);
            copyStylesToChild(track, TRACK_STYLES);
            copyStylesToChild(upArrow, UP_ARROW_STYLES);
        }


    }
}//package fl.controls

