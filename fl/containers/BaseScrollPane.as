// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.containers.BaseScrollPane

package fl.containers
{
    import fl.core.UIComponent;
    import flash.display.Shape;
    import fl.controls.ScrollBar;
    import flash.display.DisplayObject;
    import flash.geom.Rectangle;
    import fl.events.ScrollEvent;
    import fl.controls.ScrollBarDirection;
    import flash.events.MouseEvent;
    import fl.core.InvalidationType;
    import fl.controls.ScrollPolicy;
    import flash.display.Graphics;

    public class BaseScrollPane extends UIComponent 
    {

        private static var defaultStyles:Object = {
            "repeatDelay":500,
            "repeatInterval":35,
            "skin":"ScrollPane_upSkin",
            "contentPadding":0,
            "disabledAlpha":0.5
        };
        protected static const SCROLL_BAR_STYLES:Object = {
            "upArrowDisabledSkin":"upArrowDisabledSkin",
            "upArrowDownSkin":"upArrowDownSkin",
            "upArrowOverSkin":"upArrowOverSkin",
            "upArrowUpSkin":"upArrowUpSkin",
            "downArrowDisabledSkin":"downArrowDisabledSkin",
            "downArrowDownSkin":"downArrowDownSkin",
            "downArrowOverSkin":"downArrowOverSkin",
            "downArrowUpSkin":"downArrowUpSkin",
            "thumbDisabledSkin":"thumbDisabledSkin",
            "thumbDownSkin":"thumbDownSkin",
            "thumbOverSkin":"thumbOverSkin",
            "thumbUpSkin":"thumbUpSkin",
            "thumbIcon":"thumbIcon",
            "trackDisabledSkin":"trackDisabledSkin",
            "trackDownSkin":"trackDownSkin",
            "trackOverSkin":"trackOverSkin",
            "trackUpSkin":"trackUpSkin",
            "repeatDelay":"repeatDelay",
            "repeatInterval":"repeatInterval"
        };

        protected var vScrollBar:Boolean;
        protected var disabledOverlay:Shape;
        protected var hScrollBar:Boolean;
        protected var availableWidth:Number;
        protected var _verticalScrollBar:ScrollBar;
        protected var background:DisplayObject;
        protected var availableHeight:Number;
        protected var _horizontalScrollBar:ScrollBar;
        protected var contentScrollRect:Rectangle;
        protected var _horizontalScrollPolicy:String;
        protected var _verticalScrollPolicy:String;

        protected var contentWidth:Number = 0;
        protected var contentHeight:Number = 0;
        protected var contentPadding:Number = 0;
        protected var vOffset:Number = 0;
        protected var _maxHorizontalScrollPosition:Number = 0;
        protected var _horizontalPageScrollSize:Number = 0;
        protected var _verticalPageScrollSize:Number = 0;
        protected var defaultLineScrollSize:Number = 4;
        protected var useFixedHorizontalScrolling:Boolean = false;
        protected var _useBitmpScrolling:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, ScrollBar.getStyleDefinition()));
        }


        protected function handleWheel(_arg_1:MouseEvent):void
        {
            if ((((!(enabled)) || (!(_verticalScrollBar.visible))) || (contentHeight <= availableHeight)))
            {
                return;
            };
            _verticalScrollBar.scrollPosition = (_verticalScrollBar.scrollPosition - (_arg_1.delta * verticalLineScrollSize));
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition);
            dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL, _arg_1.delta, horizontalScrollPosition));
        }

        public function get verticalScrollPosition():Number
        {
            return (_verticalScrollBar.scrollPosition);
        }

        protected function drawDisabledOverlay():void
        {
            if (enabled)
            {
                if (contains(disabledOverlay))
                {
                    removeChild(disabledOverlay);
                };
            }
            else
            {
                disabledOverlay.x = (disabledOverlay.y = contentPadding);
                disabledOverlay.width = availableWidth;
                disabledOverlay.height = availableHeight;
                disabledOverlay.alpha = (getStyleValue("disabledAlpha") as Number);
                addChild(disabledOverlay);
            };
        }

        public function set verticalScrollPosition(_arg_1:Number):void
        {
            drawNow();
            _verticalScrollBar.scrollPosition = _arg_1;
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition, false);
        }

        protected function setContentSize(_arg_1:Number, _arg_2:Number):void
        {
            if ((((contentWidth == _arg_1) || (useFixedHorizontalScrolling)) && (contentHeight == _arg_2)))
            {
                return;
            };
            contentWidth = _arg_1;
            contentHeight = _arg_2;
            invalidate(InvalidationType.SIZE);
        }

        public function get horizontalScrollPosition():Number
        {
            return (_horizontalScrollBar.scrollPosition);
        }

        public function get horizontalScrollBar():ScrollBar
        {
            return (_horizontalScrollBar);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            if (enabled == _arg_1)
            {
                return;
            };
            _verticalScrollBar.enabled = _arg_1;
            _horizontalScrollBar.enabled = _arg_1;
            super.enabled = _arg_1;
        }

        public function get verticalLineScrollSize():Number
        {
            return (_verticalScrollBar.lineScrollSize);
        }

        public function get horizontalScrollPolicy():String
        {
            return (_horizontalScrollPolicy);
        }

        protected function calculateAvailableSize():void
        {
            var _local_1:Number;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            _local_1 = ScrollBar.WIDTH;
            _local_2 = (contentPadding = Number(getStyleValue("contentPadding")));
            _local_3 = ((height - (2 * _local_2)) - vOffset);
            vScrollBar = ((_verticalScrollPolicy == ScrollPolicy.ON) || ((_verticalScrollPolicy == ScrollPolicy.AUTO) && (contentHeight > _local_3)));
            _local_4 = ((width - ((vScrollBar) ? _local_1 : 0)) - (2 * _local_2));
            _local_5 = ((useFixedHorizontalScrolling) ? _maxHorizontalScrollPosition : (contentWidth - _local_4));
            hScrollBar = ((_horizontalScrollPolicy == ScrollPolicy.ON) || ((_horizontalScrollPolicy == ScrollPolicy.AUTO) && (_local_5 > 0)));
            if (hScrollBar)
            {
                _local_3 = (_local_3 - _local_1);
            };
            if (((((hScrollBar) && (!(vScrollBar))) && (_verticalScrollPolicy == ScrollPolicy.AUTO)) && (contentHeight > _local_3)))
            {
                vScrollBar = true;
                _local_4 = (_local_4 - _local_1);
            };
            availableHeight = (_local_3 + vOffset);
            availableWidth = _local_4;
        }

        public function get maxVerticalScrollPosition():Number
        {
            drawNow();
            return (Math.max(0, (contentHeight - availableHeight)));
        }

        public function set horizontalScrollPosition(_arg_1:Number):void
        {
            drawNow();
            _horizontalScrollBar.scrollPosition = _arg_1;
            setHorizontalScrollPosition(_horizontalScrollBar.scrollPosition, false);
        }

        public function get horizontalLineScrollSize():Number
        {
            return (_horizontalScrollBar.lineScrollSize);
        }

        public function set verticalPageScrollSize(_arg_1:Number):void
        {
            _verticalPageScrollSize = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function get verticalScrollPolicy():String
        {
            return (_verticalScrollPolicy);
        }

        protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
        }

        public function get useBitmapScrolling():Boolean
        {
            return (_useBitmpScrolling);
        }

        protected function handleScroll(_arg_1:ScrollEvent):void
        {
            if (_arg_1.target == _verticalScrollBar)
            {
                setVerticalScrollPosition(_arg_1.position);
            }
            else
            {
                setHorizontalScrollPosition(_arg_1.position);
            };
        }

        public function set verticalLineScrollSize(_arg_1:Number):void
        {
            _verticalScrollBar.lineScrollSize = _arg_1;
        }

        public function get verticalScrollBar():ScrollBar
        {
            return (_verticalScrollBar);
        }

        protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
        }

        public function set horizontalPageScrollSize(_arg_1:Number):void
        {
            _horizontalPageScrollSize = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        override protected function draw():void
        {
            if (isInvalid(InvalidationType.STYLES))
            {
                setStyles();
                drawBackground();
                if (contentPadding != getStyleValue("contentPadding"))
                {
                    invalidate(InvalidationType.SIZE, false);
                };
            };
            if (isInvalid(InvalidationType.SIZE, InvalidationType.STATE))
            {
                drawLayout();
            };
            updateChildren();
            super.draw();
        }

        public function set horizontalScrollPolicy(_arg_1:String):void
        {
            _horizontalScrollPolicy = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        override protected function configUI():void
        {
            var _local_1:Graphics;
            super.configUI();
            contentScrollRect = new Rectangle(0, 0, 85, 85);
            _verticalScrollBar = new ScrollBar();
            _verticalScrollBar.addEventListener(ScrollEvent.SCROLL, handleScroll, false, 0, true);
            _verticalScrollBar.visible = false;
            _verticalScrollBar.lineScrollSize = defaultLineScrollSize;
            addChild(_verticalScrollBar);
            copyStylesToChild(_verticalScrollBar, SCROLL_BAR_STYLES);
            _horizontalScrollBar = new ScrollBar();
            _horizontalScrollBar.direction = ScrollBarDirection.HORIZONTAL;
            _horizontalScrollBar.addEventListener(ScrollEvent.SCROLL, handleScroll, false, 0, true);
            _horizontalScrollBar.visible = false;
            _horizontalScrollBar.lineScrollSize = defaultLineScrollSize;
            addChild(_horizontalScrollBar);
            copyStylesToChild(_horizontalScrollBar, SCROLL_BAR_STYLES);
            disabledOverlay = new Shape();
            _local_1 = disabledOverlay.graphics;
            _local_1.beginFill(0xFFFFFF);
            _local_1.drawRect(0, 0, width, height);
            _local_1.endFill();
            addEventListener(MouseEvent.MOUSE_WHEEL, handleWheel, false, 0, true);
        }

        protected function calculateContentWidth():void
        {
        }

        public function get verticalPageScrollSize():Number
        {
            if (isNaN(availableHeight))
            {
                drawNow();
            };
            return (((_verticalPageScrollSize == 0) && (!(isNaN(availableHeight)))) ? availableHeight : _verticalPageScrollSize);
        }

        protected function drawLayout():void
        {
            calculateAvailableSize();
            calculateContentWidth();
            background.width = width;
            background.height = height;
            if (vScrollBar)
            {
                _verticalScrollBar.visible = true;
                _verticalScrollBar.x = ((width - ScrollBar.WIDTH) - contentPadding);
                _verticalScrollBar.y = contentPadding;
                _verticalScrollBar.height = availableHeight;
            }
            else
            {
                _verticalScrollBar.visible = false;
            };
            _verticalScrollBar.setScrollProperties(availableHeight, 0, (contentHeight - availableHeight), verticalPageScrollSize);
            setVerticalScrollPosition(_verticalScrollBar.scrollPosition, false);
            if (hScrollBar)
            {
                _horizontalScrollBar.visible = true;
                _horizontalScrollBar.x = contentPadding;
                _horizontalScrollBar.y = ((height - ScrollBar.WIDTH) - contentPadding);
                _horizontalScrollBar.width = availableWidth;
            }
            else
            {
                _horizontalScrollBar.visible = false;
            };
            _horizontalScrollBar.setScrollProperties(availableWidth, 0, ((useFixedHorizontalScrolling) ? _maxHorizontalScrollPosition : (contentWidth - availableWidth)), horizontalPageScrollSize);
            setHorizontalScrollPosition(_horizontalScrollBar.scrollPosition, false);
            drawDisabledOverlay();
        }

        protected function drawBackground():void
        {
            var _local_1:DisplayObject;
            _local_1 = background;
            background = getDisplayObjectInstance(getStyleValue("skin"));
            background.width = width;
            background.height = height;
            addChildAt(background, 0);
            if (((!(_local_1 == null)) && (!(_local_1 == background))))
            {
                removeChild(_local_1);
            };
        }

        public function set horizontalLineScrollSize(_arg_1:Number):void
        {
            _horizontalScrollBar.lineScrollSize = _arg_1;
        }

        public function get horizontalPageScrollSize():Number
        {
            if (isNaN(availableWidth))
            {
                drawNow();
            };
            return (((_horizontalPageScrollSize == 0) && (!(isNaN(availableWidth)))) ? availableWidth : _horizontalPageScrollSize);
        }

        public function get maxHorizontalScrollPosition():Number
        {
            drawNow();
            return (Math.max(0, (contentWidth - availableWidth)));
        }

        protected function setStyles():void
        {
            copyStylesToChild(_verticalScrollBar, SCROLL_BAR_STYLES);
            copyStylesToChild(_horizontalScrollBar, SCROLL_BAR_STYLES);
        }

        protected function updateChildren():void
        {
            _verticalScrollBar.enabled = (_horizontalScrollBar.enabled = enabled);
            _verticalScrollBar.drawNow();
            _horizontalScrollBar.drawNow();
        }

        public function set verticalScrollPolicy(_arg_1:String):void
        {
            _verticalScrollPolicy = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function set useBitmapScrolling(_arg_1:Boolean):void
        {
            _useBitmpScrolling = _arg_1;
            invalidate(InvalidationType.STATE);
        }


    }
}//package fl.containers

