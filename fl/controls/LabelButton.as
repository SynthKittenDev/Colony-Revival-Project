// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.LabelButton

package fl.controls
{
    import fl.managers.IFocusManagerComponent;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.core.InvalidationType;
    import flash.text.TextFieldType;
    import fl.events.ComponentEvent;
    import flash.text.TextFormat;
    import fl.core.UIComponent;

    public class LabelButton extends BaseButton implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "icon":null,
            "upIcon":null,
            "downIcon":null,
            "overIcon":null,
            "disabledIcon":null,
            "selectedDisabledIcon":null,
            "selectedUpIcon":null,
            "selectedDownIcon":null,
            "selectedOverIcon":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "textPadding":5,
            "embedFonts":false
        };
        public static var createAccessibilityImplementation:Function;

        protected var icon:DisplayObject;
        protected var oldMouseState:String;
        public var textField:TextField;

        protected var _labelPlacement:String = ButtonLabelPlacement.RIGHT;//"right"
        protected var _toggle:Boolean = false;
        protected var _label:String = "Label";
        protected var mode:String = "center";


        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, BaseButton.getStyleDefinition()));
        }


        protected function toggleSelected(_arg_1:MouseEvent):void
        {
            selected = (!(selected));
            dispatchEvent(new Event(Event.CHANGE, true));
        }

        public function get labelPlacement():String
        {
            return (_labelPlacement);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (!enabled)
            {
                return;
            };
            if (_arg_1.keyCode == Keyboard.SPACE)
            {
                if (oldMouseState == null)
                {
                    oldMouseState = mouseState;
                };
                setMouseState("down");
                startPress();
            };
        }

        protected function setEmbedFont():*
        {
            var _local_1:Object;
            _local_1 = getStyleValue("embedFonts");
            if (_local_1 != null)
            {
                textField.embedFonts = _local_1;
            };
        }

        override protected function keyUpHandler(_arg_1:KeyboardEvent):void
        {
            if (!enabled)
            {
                return;
            };
            if (_arg_1.keyCode == Keyboard.SPACE)
            {
                setMouseState(oldMouseState);
                oldMouseState = null;
                endPress();
                dispatchEvent(new MouseEvent(MouseEvent.CLICK));
            };
        }

        override public function get selected():Boolean
        {
            return ((_toggle) ? _selected : false);
        }

        public function set labelPlacement(_arg_1:String):void
        {
            _labelPlacement = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function set toggle(_arg_1:Boolean):void
        {
            if (((!(_arg_1)) && (super.selected)))
            {
                selected = false;
            };
            _toggle = _arg_1;
            if (_toggle)
            {
                addEventListener(MouseEvent.CLICK, toggleSelected, false, 0, true);
            }
            else
            {
                removeEventListener(MouseEvent.CLICK, toggleSelected);
            };
            invalidate(InvalidationType.STATE);
        }

        public function get label():String
        {
            return (_label);
        }

        override public function set selected(_arg_1:Boolean):void
        {
            _selected = _arg_1;
            if (_toggle)
            {
                invalidate(InvalidationType.STATE);
            };
        }

        override protected function draw():void
        {
            if (textField.text != _label)
            {
                label = _label;
            };
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                drawBackground();
                drawIcon();
                drawTextFormat();
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE))
            {
                drawLayout();
            };
            if (isInvalid(InvalidationType.SIZE, InvalidationType.STYLES))
            {
                if (((isFocused) && (focusManager.showFocusIndicator)))
                {
                    drawFocus(true);
                };
            };
            validate();
        }

        public function get toggle():Boolean
        {
            return (_toggle);
        }

        override protected function configUI():void
        {
            super.configUI();
            textField = new TextField();
            textField.type = TextFieldType.DYNAMIC;
            textField.selectable = false;
            addChild(textField);
        }

        override protected function drawLayout():void
        {
            var _local_1:Number;
            var _local_2:String;
            var _local_3:Number;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Number;
            var _local_7:Number;
            var _local_8:Number;
            _local_1 = Number(getStyleValue("textPadding"));
            _local_2 = (((icon == null) && (mode == "center")) ? ButtonLabelPlacement.TOP : _labelPlacement);
            textField.height = (textField.textHeight + 4);
            _local_3 = (textField.textWidth + 4);
            _local_4 = (textField.textHeight + 4);
            _local_5 = ((icon == null) ? 0 : (icon.width + _local_1));
            _local_6 = ((icon == null) ? 0 : (icon.height + _local_1));
            textField.visible = (label.length > 0);
            if (icon != null)
            {
                icon.x = Math.round(((width - icon.width) / 2));
                icon.y = Math.round(((height - icon.height) / 2));
            };
            if (textField.visible == false)
            {
                textField.width = 0;
                textField.height = 0;
            }
            else
            {
                if (((_local_2 == ButtonLabelPlacement.BOTTOM) || (_local_2 == ButtonLabelPlacement.TOP)))
                {
                    _local_7 = Math.max(0, Math.min(_local_3, (width - (2 * _local_1))));
                    if ((height - 2) > _local_4)
                    {
                        _local_8 = _local_4;
                    }
                    else
                    {
                        _local_8 = (height - 2);
                    };
                    textField.width = (_local_3 = _local_7);
                    textField.height = (_local_4 = _local_8);
                    textField.x = Math.round(((width - _local_3) / 2));
                    textField.y = Math.round(((((height - textField.height) - _local_6) / 2) + ((_local_2 == ButtonLabelPlacement.BOTTOM) ? _local_6 : 0)));
                    if (icon != null)
                    {
                        icon.y = Math.round(((_local_2 == ButtonLabelPlacement.BOTTOM) ? (textField.y - _local_6) : ((textField.y + textField.height) + _local_1)));
                    };
                }
                else
                {
                    _local_7 = Math.max(0, Math.min(_local_3, ((width - _local_5) - (2 * _local_1))));
                    textField.width = (_local_3 = _local_7);
                    textField.x = Math.round(((((width - _local_3) - _local_5) / 2) + ((_local_2 != ButtonLabelPlacement.LEFT) ? _local_5 : 0)));
                    textField.y = Math.round(((height - textField.height) / 2));
                    if (icon != null)
                    {
                        icon.x = Math.round(((_local_2 != ButtonLabelPlacement.LEFT) ? (textField.x - _local_5) : ((textField.x + _local_3) + _local_1)));
                    };
                };
            };
            super.drawLayout();
        }

        override protected function initializeAccessibility():void
        {
            if (LabelButton.createAccessibilityImplementation != null)
            {
                LabelButton.createAccessibilityImplementation(this);
            };
        }

        protected function drawIcon():void
        {
            var _local_1:DisplayObject;
            var _local_2:String;
            var _local_3:Object;
            _local_1 = icon;
            _local_2 = ((enabled) ? mouseState : "disabled");
            if (selected)
            {
                _local_2 = (("selected" + _local_2.substr(0, 1).toUpperCase()) + _local_2.substr(1));
            };
            _local_2 = (_local_2 + "Icon");
            _local_3 = getStyleValue(_local_2);
            if (_local_3 == null)
            {
                _local_3 = getStyleValue("icon");
            };
            if (_local_3 != null)
            {
                icon = getDisplayObjectInstance(_local_3);
            };
            if (icon != null)
            {
                addChildAt(icon, 1);
            };
            if (((!(_local_1 == null)) && (!(_local_1 == icon))))
            {
                removeChild(_local_1);
            };
        }

        public function set label(_arg_1:String):void
        {
            _label = _arg_1;
            if (textField.text != _label)
            {
                textField.text = _label;
                dispatchEvent(new ComponentEvent(ComponentEvent.LABEL_CHANGE));
            };
            invalidate(InvalidationType.SIZE);
            invalidate(InvalidationType.STYLES);
        }

        protected function drawTextFormat():void
        {
            var _local_1:Object;
            var _local_2:TextFormat;
            var _local_3:TextFormat;
            _local_1 = UIComponent.getStyleDefinition();
            _local_2 = ((enabled) ? (_local_1.defaultTextFormat as TextFormat) : (_local_1.defaultDisabledTextFormat as TextFormat));
            textField.setTextFormat(_local_2);
            _local_3 = (getStyleValue(((enabled) ? "textFormat" : "disabledTextFormat")) as TextFormat);
            if (_local_3 != null)
            {
                textField.setTextFormat(_local_3);
            }
            else
            {
                _local_3 = _local_2;
            };
            textField.defaultTextFormat = _local_3;
            setEmbedFont();
        }


    }
}//package fl.controls

