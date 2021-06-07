// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.managers.FocusManager

package fl.managers
{
    import flash.utils.Dictionary;
    import fl.controls.Button;
    import flash.display.DisplayObjectContainer;
    import flash.display.InteractiveObject;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import flash.display.Stage;
    import flash.text.TextField;
    import flash.events.FocusEvent;
    import fl.core.UIComponent;
    import flash.events.MouseEvent;
    import flash.display.SimpleButton;
    import flash.text.TextFieldType;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;

    public class FocusManager implements IFocusManager 
    {

        private var focusableObjects:Dictionary;
        private var defButton:Button;
        private var focusableCandidates:Array;
        private var _form:DisplayObjectContainer;
        private var _defaultButton:Button;
        private var lastFocus:InteractiveObject;
        private var lastAction:String;

        private var activated:Boolean = false;
        private var calculateCandidates:Boolean = true;
        private var _showFocusIndicator:Boolean = true;
        private var _defaultButtonEnabled:Boolean = true;

        public function FocusManager(_arg_1:DisplayObjectContainer)
        {
            focusableObjects = new Dictionary(true);
            if (_arg_1 != null)
            {
                _form = _arg_1;
                addFocusables(DisplayObject(_arg_1));
                _arg_1.addEventListener(Event.ADDED, addedHandler);
                _arg_1.addEventListener(Event.REMOVED, removedHandler);
                activate();
            };
        }

        public function get showFocusIndicator():Boolean
        {
            return (_showFocusIndicator);
        }

        private function getIndexOfNextObject(_arg_1:int, _arg_2:Boolean, _arg_3:Boolean, _arg_4:String):int
        {
            var _local_5:int;
            var _local_6:int;
            var _local_7:DisplayObject;
            var _local_8:IFocusManagerGroup;
            var _local_9:int;
            var _local_10:DisplayObject;
            var _local_11:IFocusManagerGroup;
            _local_5 = focusableCandidates.length;
            _local_6 = _arg_1;
            while (true)
            {
                if (_arg_2)
                {
                    _arg_1--;
                }
                else
                {
                    _arg_1++;
                };
                if (_arg_3)
                {
                    if (((_arg_2) && (_arg_1 < 0))) break;
                    if (((!(_arg_2)) && (_arg_1 == _local_5))) break;
                }
                else
                {
                    _arg_1 = ((_arg_1 + _local_5) % _local_5);
                    if (_local_6 == _arg_1) break;
                };
                if (isValidFocusCandidate(focusableCandidates[_arg_1], _arg_4))
                {
                    _local_7 = DisplayObject(findFocusManagerComponent(focusableCandidates[_arg_1]));
                    if ((_local_7 is IFocusManagerGroup))
                    {
                        _local_8 = IFocusManagerGroup(_local_7);
                        _local_9 = 0;
                        while (_local_9 < focusableCandidates.length)
                        {
                            _local_10 = focusableCandidates[_local_9];
                            if ((_local_10 is IFocusManagerGroup))
                            {
                                _local_11 = IFocusManagerGroup(_local_10);
                                if (((_local_11.groupName == _local_8.groupName) && (_local_11.selected)))
                                {
                                    _arg_1 = _local_9;
                                    break;
                                };
                            };
                            _local_9++;
                        };
                    };
                    return (_arg_1);
                };
            };
            return (_arg_1);
        }

        public function set form(_arg_1:DisplayObjectContainer):void
        {
            _form = _arg_1;
        }

        private function addFocusables(o:DisplayObject, skipTopLevel:Boolean=false):void
        {
            var focusable:IFocusManagerComponent;
            var io:InteractiveObject;
            var doc:DisplayObjectContainer;
            var i:int;
            var child:DisplayObject;
            if (!skipTopLevel)
            {
                if ((o is IFocusManagerComponent))
                {
                    focusable = IFocusManagerComponent(o);
                    if (focusable.focusEnabled)
                    {
                        if (((focusable.tabEnabled) && (isTabVisible(o))))
                        {
                            focusableObjects[o] = true;
                            calculateCandidates = true;
                        };
                        o.addEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                        o.addEventListener(Event.TAB_INDEX_CHANGE, tabIndexChangeHandler);
                    };
                }
                else
                {
                    if ((o is InteractiveObject))
                    {
                        io = (o as InteractiveObject);
                        if ((((io) && (io.tabEnabled)) && (findFocusManagerComponent(io) == io)))
                        {
                            focusableObjects[io] = true;
                            calculateCandidates = true;
                        };
                        io.addEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                        io.addEventListener(Event.TAB_INDEX_CHANGE, tabIndexChangeHandler);
                    };
                };
            };
            if ((o is DisplayObjectContainer))
            {
                doc = DisplayObjectContainer(o);
                o.addEventListener(Event.TAB_CHILDREN_CHANGE, tabChildrenChangeHandler);
                if ((((doc is Stage) || (doc.parent is Stage)) || (doc.tabChildren)))
                {
                    i = 0;
                    while (i < doc.numChildren)
                    {
                        try
                        {
                            child = doc.getChildAt(i);
                            if (child != null)
                            {
                                addFocusables(doc.getChildAt(i));
                            };
                        }
                        catch(error:SecurityError)
                        {
                        };
                        i = (i + 1);
                    };
                };
            };
        }

        private function getChildIndex(_arg_1:DisplayObjectContainer, _arg_2:DisplayObject):int
        {
            return (_arg_1.getChildIndex(_arg_2));
        }

        private function mouseFocusChangeHandler(_arg_1:FocusEvent):void
        {
            if ((_arg_1.relatedObject is TextField))
            {
                return;
            };
            _arg_1.preventDefault();
        }

        private function focusOutHandler(_arg_1:FocusEvent):void
        {
            var _local_2:InteractiveObject;
            _local_2 = (_arg_1.target as InteractiveObject);
        }

        private function isValidFocusCandidate(_arg_1:DisplayObject, _arg_2:String):Boolean
        {
            var _local_3:IFocusManagerGroup;
            if (!isEnabledAndVisible(_arg_1))
            {
                return (false);
            };
            if ((_arg_1 is IFocusManagerGroup))
            {
                _local_3 = IFocusManagerGroup(_arg_1);
                if (_arg_2 == _local_3.groupName)
                {
                    return (false);
                };
            };
            return (true);
        }

        public function findFocusManagerComponent(_arg_1:InteractiveObject):InteractiveObject
        {
            var _local_2:InteractiveObject;
            _local_2 = _arg_1;
            while (_arg_1)
            {
                if (((_arg_1 is IFocusManagerComponent) && (IFocusManagerComponent(_arg_1).focusEnabled)))
                {
                    return (_arg_1);
                };
                _arg_1 = _arg_1.parent;
            };
            return (_local_2);
        }

        private function sortFocusableObjectsTabIndex():void
        {
            var _local_1:Object;
            var _local_2:InteractiveObject;
            focusableCandidates = [];
            for (_local_1 in focusableObjects)
            {
                _local_2 = InteractiveObject(_local_1);
                if (((_local_2.tabIndex) && (!(isNaN(Number(_local_2.tabIndex))))))
                {
                    focusableCandidates.push(_local_2);
                };
            };
            focusableCandidates.sort(sortByTabIndex);
        }

        private function removeFocusables(_arg_1:DisplayObject):void
        {
            var _local_2:Object;
            var _local_3:DisplayObject;
            if ((_arg_1 is DisplayObjectContainer))
            {
                _arg_1.removeEventListener(Event.TAB_CHILDREN_CHANGE, tabChildrenChangeHandler);
                _arg_1.removeEventListener(Event.TAB_INDEX_CHANGE, tabIndexChangeHandler);
                for (_local_2 in focusableObjects)
                {
                    _local_3 = DisplayObject(_local_2);
                    if (DisplayObjectContainer(_arg_1).contains(_local_3))
                    {
                        if (_local_3 == lastFocus)
                        {
                            lastFocus = null;
                        };
                        _local_3.removeEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                        delete focusableObjects[_local_2];
                        calculateCandidates = true;
                    };
                };
            };
        }

        private function addedHandler(_arg_1:Event):void
        {
            var _local_2:DisplayObject;
            _local_2 = DisplayObject(_arg_1.target);
            if (_local_2.stage)
            {
                addFocusables(DisplayObject(_arg_1.target));
            };
        }

        private function getTopLevelFocusTarget(_arg_1:InteractiveObject):InteractiveObject
        {
            while (_arg_1 != InteractiveObject(form))
            {
                if (((((_arg_1 is IFocusManagerComponent) && (IFocusManagerComponent(_arg_1).focusEnabled)) && (IFocusManagerComponent(_arg_1).mouseFocusEnabled)) && (UIComponent(_arg_1).enabled)))
                {
                    return (_arg_1);
                };
                _arg_1 = _arg_1.parent;
                if (_arg_1 == null) break;
            };
            return (null);
        }

        private function tabChildrenChangeHandler(_arg_1:Event):void
        {
            var _local_2:DisplayObjectContainer;
            if (_arg_1.target != _arg_1.currentTarget)
            {
                return;
            };
            calculateCandidates = true;
            _local_2 = DisplayObjectContainer(_arg_1.target);
            if (_local_2.tabChildren)
            {
                addFocusables(_local_2, true);
            }
            else
            {
                removeFocusables(_local_2);
            };
        }

        public function sendDefaultButtonEvent():void
        {
            defButton.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        public function getFocus():InteractiveObject
        {
            var _local_1:InteractiveObject;
            _local_1 = form.stage.focus;
            return (findFocusManagerComponent(_local_1));
        }

        private function isEnabledAndVisible(_arg_1:DisplayObject):Boolean
        {
            var _local_2:DisplayObjectContainer;
            var _local_3:TextField;
            var _local_4:SimpleButton;
            _local_2 = DisplayObject(form).parent;
            while (_arg_1 != _local_2)
            {
                if ((_arg_1 is UIComponent))
                {
                    if (!UIComponent(_arg_1).enabled)
                    {
                        return (false);
                    };
                }
                else
                {
                    if ((_arg_1 is TextField))
                    {
                        _local_3 = TextField(_arg_1);
                        if (((_local_3.type == TextFieldType.DYNAMIC) || (!(_local_3.selectable))))
                        {
                            return (false);
                        };
                    }
                    else
                    {
                        if ((_arg_1 is SimpleButton))
                        {
                            _local_4 = SimpleButton(_arg_1);
                            if (!_local_4.enabled)
                            {
                                return (false);
                            };
                        };
                    };
                };
                if (!_arg_1.visible)
                {
                    return (false);
                };
                _arg_1 = _arg_1.parent;
            };
            return (true);
        }

        public function set defaultButton(_arg_1:Button):void
        {
            var _local_2:Button;
            _local_2 = ((_arg_1) ? Button(_arg_1) : null);
            if (_local_2 != _defaultButton)
            {
                if (_defaultButton)
                {
                    _defaultButton.emphasized = false;
                };
                if (defButton)
                {
                    defButton.emphasized = false;
                };
                _defaultButton = _local_2;
                defButton = _local_2;
                if (_local_2)
                {
                    _local_2.emphasized = true;
                };
            };
        }

        private function deactivateHandler(_arg_1:Event):void
        {
            var _local_2:InteractiveObject;
            _local_2 = InteractiveObject(_arg_1.target);
        }

        public function setFocus(_arg_1:InteractiveObject):void
        {
            if ((_arg_1 is IFocusManagerComponent))
            {
                IFocusManagerComponent(_arg_1).setFocus();
            }
            else
            {
                form.stage.focus = _arg_1;
            };
        }

        private function setFocusToNextObject(_arg_1:FocusEvent):void
        {
            var _local_2:InteractiveObject;
            if (!hasFocusableObjects())
            {
                return;
            };
            _local_2 = getNextFocusManagerComponent(_arg_1.shiftKey);
            if (_local_2)
            {
                setFocus(_local_2);
            };
        }

        private function hasFocusableObjects():Boolean
        {
            var _local_1:Object;
            for (_local_1 in focusableObjects)
            {
                return (true);
            };
            return (false);
        }

        private function tabIndexChangeHandler(_arg_1:Event):void
        {
            calculateCandidates = true;
        }

        private function sortFocusableObjects():void
        {
            var _local_1:Object;
            var _local_2:InteractiveObject;
            focusableCandidates = [];
            for (_local_1 in focusableObjects)
            {
                _local_2 = InteractiveObject(_local_1);
                if ((((_local_2.tabIndex) && (!(isNaN(Number(_local_2.tabIndex))))) && (_local_2.tabIndex > 0)))
                {
                    sortFocusableObjectsTabIndex();
                    return;
                };
                focusableCandidates.push(_local_2);
            };
            focusableCandidates.sort(sortByDepth);
        }

        private function keyFocusChangeHandler(_arg_1:FocusEvent):void
        {
            showFocusIndicator = true;
            if ((((_arg_1.keyCode == Keyboard.TAB) || (_arg_1.keyCode == 0)) && (!(_arg_1.isDefaultPrevented()))))
            {
                setFocusToNextObject(_arg_1);
                _arg_1.preventDefault();
            };
        }

        private function getIndexOfFocusedObject(_arg_1:DisplayObject):int
        {
            var _local_2:int;
            var _local_3:int;
            _local_2 = focusableCandidates.length;
            _local_3 = 0;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (focusableCandidates[_local_3] == _arg_1)
                {
                    return (_local_3);
                };
                _local_3++;
            };
            return (-1);
        }

        public function hideFocus():void
        {
        }

        private function removedHandler(_arg_1:Event):void
        {
            var _local_2:int;
            var _local_3:DisplayObject;
            var _local_4:InteractiveObject;
            _local_3 = DisplayObject(_arg_1.target);
            if (((_local_3 is IFocusManagerComponent) && (focusableObjects[_local_3] == true)))
            {
                if (_local_3 == lastFocus)
                {
                    IFocusManagerComponent(lastFocus).drawFocus(false);
                    lastFocus = null;
                };
                _local_3.removeEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                delete focusableObjects[_local_3];
                calculateCandidates = true;
            }
            else
            {
                if (((_local_3 is InteractiveObject) && (focusableObjects[_local_3] == true)))
                {
                    _local_4 = (_local_3 as InteractiveObject);
                    if (_local_4)
                    {
                        if (_local_4 == lastFocus)
                        {
                            lastFocus = null;
                        };
                        delete focusableObjects[_local_4];
                        calculateCandidates = true;
                    };
                    _local_3.addEventListener(Event.TAB_ENABLED_CHANGE, tabEnabledChangeHandler);
                };
            };
            removeFocusables(_local_3);
        }

        private function sortByDepth(_arg_1:InteractiveObject, _arg_2:InteractiveObject):Number
        {
            var _local_3:String;
            var _local_4:String;
            var _local_5:int;
            var _local_6:String;
            var _local_7:String;
            var _local_8:String;
            var _local_9:DisplayObject;
            var _local_10:DisplayObject;
            _local_3 = "";
            _local_4 = "";
            _local_8 = "0000";
            _local_9 = DisplayObject(_arg_1);
            _local_10 = DisplayObject(_arg_2);
            while (((!(_local_9 == DisplayObject(form))) && (_local_9.parent)))
            {
                _local_5 = getChildIndex(_local_9.parent, _local_9);
                _local_6 = _local_5.toString(16);
                if (_local_6.length < 4)
                {
                    _local_7 = (_local_8.substring(0, (4 - _local_6.length)) + _local_6);
                };
                _local_3 = (_local_7 + _local_3);
                _local_9 = _local_9.parent;
            };
            while (((!(_local_10 == DisplayObject(form))) && (_local_10.parent)))
            {
                _local_5 = getChildIndex(_local_10.parent, _local_10);
                _local_6 = _local_5.toString(16);
                if (_local_6.length < 4)
                {
                    _local_7 = (_local_8.substring(0, (4 - _local_6.length)) + _local_6);
                };
                _local_4 = (_local_7 + _local_4);
                _local_10 = _local_10.parent;
            };
            return ((_local_3 > _local_4) ? 1 : ((_local_3 < _local_4) ? -1 : 0));
        }

        public function get defaultButton():Button
        {
            return (_defaultButton);
        }

        private function activateHandler(_arg_1:Event):void
        {
            var _local_2:InteractiveObject;
            _local_2 = InteractiveObject(_arg_1.target);
            if (lastFocus)
            {
                if ((lastFocus is IFocusManagerComponent))
                {
                    IFocusManagerComponent(lastFocus).setFocus();
                }
                else
                {
                    form.stage.focus = lastFocus;
                };
            };
            lastAction = "ACTIVATE";
        }

        public function showFocus():void
        {
        }

        public function set defaultButtonEnabled(_arg_1:Boolean):void
        {
            _defaultButtonEnabled = _arg_1;
        }

        public function getNextFocusManagerComponent(_arg_1:Boolean=false):InteractiveObject
        {
            var _local_2:DisplayObject;
            var _local_3:String;
            var _local_4:int;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:int;
            var _local_8:IFocusManagerGroup;
            if (!hasFocusableObjects())
            {
                return (null);
            };
            if (calculateCandidates)
            {
                sortFocusableObjects();
                calculateCandidates = false;
            };
            _local_2 = form.stage.focus;
            _local_2 = DisplayObject(findFocusManagerComponent(InteractiveObject(_local_2)));
            _local_3 = "";
            if ((_local_2 is IFocusManagerGroup))
            {
                _local_8 = IFocusManagerGroup(_local_2);
                _local_3 = _local_8.groupName;
            };
            _local_4 = getIndexOfFocusedObject(_local_2);
            _local_5 = false;
            _local_6 = _local_4;
            if (_local_4 == -1)
            {
                if (_arg_1)
                {
                    _local_4 = focusableCandidates.length;
                };
                _local_5 = true;
            };
            _local_7 = getIndexOfNextObject(_local_4, _arg_1, _local_5, _local_3);
            return (findFocusManagerComponent(focusableCandidates[_local_7]));
        }

        private function mouseDownHandler(_arg_1:MouseEvent):void
        {
            var _local_2:InteractiveObject;
            if (_arg_1.isDefaultPrevented())
            {
                return;
            };
            _local_2 = getTopLevelFocusTarget(InteractiveObject(_arg_1.target));
            if (!_local_2)
            {
                return;
            };
            showFocusIndicator = false;
            if ((((!(_local_2 == lastFocus)) || (lastAction == "ACTIVATE")) && (!(_local_2 is TextField))))
            {
                setFocus(_local_2);
            };
            lastAction = "MOUSEDOWN";
        }

        private function isTabVisible(_arg_1:DisplayObject):Boolean
        {
            var _local_2:DisplayObjectContainer;
            _local_2 = _arg_1.parent;
            while ((((_local_2) && (!(_local_2 is Stage))) && (!((_local_2.parent) && (_local_2.parent is Stage)))))
            {
                if (!_local_2.tabChildren)
                {
                    return (false);
                };
                _local_2 = _local_2.parent;
            };
            return (true);
        }

        public function get nextTabIndex():int
        {
            return (0);
        }

        private function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (_arg_1.keyCode == Keyboard.TAB)
            {
                lastAction = "KEY";
                if (calculateCandidates)
                {
                    sortFocusableObjects();
                    calculateCandidates = false;
                };
            };
            if (((((defaultButtonEnabled) && (_arg_1.keyCode == Keyboard.ENTER)) && (defaultButton)) && (defButton.enabled)))
            {
                sendDefaultButtonEvent();
            };
        }

        private function focusInHandler(_arg_1:FocusEvent):void
        {
            var _local_2:InteractiveObject;
            var _local_3:Button;
            _local_2 = InteractiveObject(_arg_1.target);
            if (form.contains(_local_2))
            {
                lastFocus = findFocusManagerComponent(InteractiveObject(_local_2));
                if ((lastFocus is Button))
                {
                    _local_3 = Button(lastFocus);
                    if (defButton)
                    {
                        defButton.emphasized = false;
                        defButton = _local_3;
                        _local_3.emphasized = true;
                    };
                }
                else
                {
                    if (((defButton) && (!(defButton == _defaultButton))))
                    {
                        defButton.emphasized = false;
                        defButton = _defaultButton;
                        _defaultButton.emphasized = true;
                    };
                };
            };
        }

        private function tabEnabledChangeHandler(_arg_1:Event):void
        {
            var _local_2:InteractiveObject;
            var _local_3:Boolean;
            calculateCandidates = true;
            _local_2 = InteractiveObject(_arg_1.target);
            _local_3 = (focusableObjects[_local_2] == true);
            if (_local_2.tabEnabled)
            {
                if (((!(_local_3)) && (isTabVisible(_local_2))))
                {
                    if (!(_local_2 is IFocusManagerComponent))
                    {
                        _local_2.focusRect = false;
                    };
                    focusableObjects[_local_2] = true;
                };
            }
            else
            {
                if (_local_3)
                {
                    delete focusableObjects[_local_2];
                };
            };
        }

        public function set showFocusIndicator(_arg_1:Boolean):void
        {
            _showFocusIndicator = _arg_1;
        }

        public function get form():DisplayObjectContainer
        {
            return (_form);
        }

        private function sortByTabIndex(_arg_1:InteractiveObject, _arg_2:InteractiveObject):int
        {
            return ((_arg_1.tabIndex > _arg_2.tabIndex) ? 1 : ((_arg_1.tabIndex < _arg_2.tabIndex) ? -1 : sortByDepth(_arg_1, _arg_2)));
        }

        public function activate():void
        {
            if (activated)
            {
                return;
            };
            form.stage.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler, false, 0, true);
            form.stage.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler, false, 0, true);
            form.addEventListener(FocusEvent.FOCUS_IN, focusInHandler, true);
            form.addEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, true);
            form.stage.addEventListener(Event.ACTIVATE, activateHandler, false, 0, true);
            form.stage.addEventListener(Event.DEACTIVATE, deactivateHandler, false, 0, true);
            form.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            form.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, true);
            activated = true;
            if (lastFocus)
            {
                setFocus(lastFocus);
            };
        }

        public function deactivate():void
        {
            form.stage.removeEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, mouseFocusChangeHandler);
            form.stage.removeEventListener(FocusEvent.KEY_FOCUS_CHANGE, keyFocusChangeHandler);
            form.removeEventListener(FocusEvent.FOCUS_IN, focusInHandler, true);
            form.removeEventListener(FocusEvent.FOCUS_OUT, focusOutHandler, true);
            form.stage.removeEventListener(Event.ACTIVATE, activateHandler);
            form.stage.removeEventListener(Event.DEACTIVATE, deactivateHandler);
            form.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
            form.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler, true);
            activated = false;
        }

        public function get defaultButtonEnabled():Boolean
        {
            return (_defaultButtonEnabled);
        }


    }
}//package fl.managers

