// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.TextInput

package fl.controls
{
    import fl.core.UIComponent;
    import fl.managers.IFocusManagerComponent;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import flash.ui.Keyboard;
    import fl.events.ComponentEvent;
    import flash.events.KeyboardEvent;
    import fl.core.InvalidationType;
    import flash.text.TextFieldType;
    import fl.managers.IFocusManager;
    import flash.events.FocusEvent;
    import flash.text.TextLineMetrics;
    import flash.events.TextEvent;
    import flash.events.Event;
    import flash.text.TextFormat;

    public class TextInput extends UIComponent implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "upSkin":"TextInput_upSkin",
            "disabledSkin":"TextInput_disabledSkin",
            "focusRectSkin":null,
            "focusRectPadding":null,
            "textFormat":null,
            "disabledTextFormat":null,
            "textPadding":0,
            "embedFonts":false
        };
        public static var createAccessibilityImplementation:Function;

        protected var _savedHTML:String;
        protected var background:DisplayObject;
        public var textField:TextField;

        protected var _editable:Boolean = true;
        protected var _html:Boolean = false;


        public static function getStyleDefinition():Object
        {
            return (defaultStyles);
        }


        override public function drawFocus(_arg_1:Boolean):void
        {
            if (focusTarget != null)
            {
                focusTarget.drawFocus(_arg_1);
                return;
            };
            super.drawFocus(_arg_1);
        }

        public function set imeMode(_arg_1:String):void
        {
            _imeMode = _arg_1;
        }

        override protected function isOurFocus(_arg_1:DisplayObject):Boolean
        {
            return ((_arg_1 == textField) || (super.isOurFocus(_arg_1)));
        }

        protected function handleKeyDown(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.ENTER)
            {
                dispatchEvent(new ComponentEvent(ComponentEvent.ENTER, true));
            };
        }

        public function set text(_arg_1:String):void
        {
            textField.text = _arg_1;
            _html = false;
            invalidate(InvalidationType.DATA);
            invalidate(InvalidationType.STYLES);
        }

        protected function updateTextFieldType():void
        {
            textField.type = (((enabled) && (editable)) ? TextFieldType.INPUT : TextFieldType.DYNAMIC);
            textField.selectable = enabled;
        }

        public function get selectionEndIndex():int
        {
            return (textField.selectionEndIndex);
        }

        public function get editable():Boolean
        {
            return (_editable);
        }

        override protected function focusInHandler(_arg_1:FocusEvent):void
        {
            var _local_2:IFocusManager;
            if (_arg_1.target == this)
            {
                stage.focus = textField;
            };
            _local_2 = focusManager;
            if (((editable) && (_local_2)))
            {
                _local_2.showFocusIndicator = true;
                if (((textField.selectable) && (textField.selectionBeginIndex == textField.selectionBeginIndex)))
                {
                    setSelection(0, textField.length);
                };
            };
            super.focusInHandler(_arg_1);
            if (editable)
            {
                setIMEMode(true);
            };
        }

        public function get selectionBeginIndex():int
        {
            return (textField.selectionBeginIndex);
        }

        public function set alwaysShowSelection(_arg_1:Boolean):void
        {
            textField.alwaysShowSelection = _arg_1;
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            updateTextFieldType();
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

        public function get horizontalScrollPosition():int
        {
            return (textField.scrollH);
        }

        public function set condenseWhite(_arg_1:Boolean):void
        {
            textField.condenseWhite = _arg_1;
        }

        public function set displayAsPassword(_arg_1:Boolean):void
        {
            textField.displayAsPassword = _arg_1;
        }

        public function set horizontalScrollPosition(_arg_1:int):void
        {
            textField.scrollH = _arg_1;
        }

        public function get restrict():String
        {
            return (textField.restrict);
        }

        public function get textWidth():Number
        {
            return (textField.textWidth);
        }

        public function get textHeight():Number
        {
            return (textField.textHeight);
        }

        public function set editable(_arg_1:Boolean):void
        {
            _editable = _arg_1;
            updateTextFieldType();
        }

        public function get maxChars():int
        {
            return (textField.maxChars);
        }

        public function get length():int
        {
            return (textField.length);
        }

        public function getLineMetrics(_arg_1:int):TextLineMetrics
        {
            return (textField.getLineMetrics(_arg_1));
        }

        public function get imeMode():String
        {
            return (_imeMode);
        }

        override protected function focusOutHandler(_arg_1:FocusEvent):void
        {
            super.focusOutHandler(_arg_1);
            if (editable)
            {
                setIMEMode(false);
            };
        }

        public function set htmlText(_arg_1:String):void
        {
            if (_arg_1 == "")
            {
                text = "";
                return;
            };
            _html = true;
            _savedHTML = _arg_1;
            textField.htmlText = _arg_1;
            invalidate(InvalidationType.DATA);
            invalidate(InvalidationType.STYLES);
        }

        public function get text():String
        {
            return (textField.text);
        }

        override public function get enabled():Boolean
        {
            return (super.enabled);
        }

        public function get condenseWhite():Boolean
        {
            return (textField.condenseWhite);
        }

        public function get alwaysShowSelection():Boolean
        {
            return (textField.alwaysShowSelection);
        }

        override protected function draw():void
        {
            var _local_1:Object;
            if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE))
            {
                drawTextFormat();
                drawBackground();
                _local_1 = getStyleValue("embedFonts");
                if (_local_1 != null)
                {
                    textField.embedFonts = _local_1;
                };
                invalidate(InvalidationType.SIZE, false);
            };
            if (isInvalid(InvalidationType.SIZE))
            {
                drawLayout();
            };
            super.draw();
        }

        protected function handleTextInput(_arg_1:TextEvent):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(new TextEvent(TextEvent.TEXT_INPUT, true, false, _arg_1.text));
        }

        override protected function configUI():void
        {
            super.configUI();
            tabChildren = true;
            textField = new TextField();
            addChild(textField);
            updateTextFieldType();
            textField.addEventListener(TextEvent.TEXT_INPUT, handleTextInput, false, 0, true);
            textField.addEventListener(Event.CHANGE, handleChange, false, 0, true);
            textField.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown, false, 0, true);
        }

        public function setSelection(_arg_1:int, _arg_2:int):void
        {
            textField.setSelection(_arg_1, _arg_2);
        }

        public function get displayAsPassword():Boolean
        {
            return (textField.displayAsPassword);
        }

        public function appendText(_arg_1:String):void
        {
            textField.appendText(_arg_1);
        }

        public function set restrict(_arg_1:String):void
        {
            if (((componentInspectorSetting) && (_arg_1 == "")))
            {
                _arg_1 = null;
            };
            textField.restrict = _arg_1;
        }

        public function get htmlText():String
        {
            return (textField.htmlText);
        }

        protected function drawBackground():void
        {
            var _local_1:DisplayObject;
            var _local_2:String;
            _local_1 = background;
            _local_2 = ((enabled) ? "upSkin" : "disabledSkin");
            background = getDisplayObjectInstance(getStyleValue(_local_2));
            if (background == null)
            {
                return;
            };
            addChildAt(background, 0);
            if ((((!(_local_1 == null)) && (!(_local_1 == background))) && (contains(_local_1))))
            {
                removeChild(_local_1);
            };
        }

        override public function setFocus():void
        {
            stage.focus = textField;
        }

        protected function drawLayout():void
        {
            var _local_1:Number;
            _local_1 = Number(getStyleValue("textPadding"));
            if (background != null)
            {
                background.width = width;
                background.height = height;
            };
            textField.width = (width - (2 * _local_1));
            textField.height = (height - (2 * _local_1));
            textField.x = (textField.y = _local_1);
        }

        public function set maxChars(_arg_1:int):void
        {
            textField.maxChars = _arg_1;
        }

        public function get maxHorizontalScrollPosition():int
        {
            return (textField.maxScrollH);
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
            if (_html)
            {
                textField.htmlText = _savedHTML;
            };
        }

        protected function handleChange(_arg_1:Event):void
        {
            _arg_1.stopPropagation();
            dispatchEvent(new Event(Event.CHANGE, true));
        }


    }
}//package fl.controls

