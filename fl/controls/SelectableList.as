// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.controls.SelectableList

package fl.controls
{
    import fl.containers.BaseScrollPane;
    import fl.managers.IFocusManagerComponent;
    import fl.controls.listClasses.CellRenderer;
    import flash.utils.Dictionary;
    import flash.display.Sprite;
    import fl.data.DataProvider;
    import fl.data.SimpleCollectionItem;
    import fl.core.InvalidationType;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import fl.controls.listClasses.ICellRenderer;
    import fl.events.DataChangeType;
    import fl.events.DataChangeEvent;
    import flash.display.DisplayObject;
    import flash.events.Event;
    import fl.events.ScrollEvent;
    import fl.events.ListEvent;
    import flash.events.MouseEvent;

    public class SelectableList extends BaseScrollPane implements IFocusManagerComponent 
    {

        private static var defaultStyles:Object = {
            "skin":"List_skin",
            "cellRenderer":CellRenderer,
            "contentPadding":null,
            "disabledAlpha":null
        };
        public static var createAccessibilityImplementation:Function;

        protected var invalidItems:Dictionary;
        protected var renderedItems:Dictionary;
        protected var listHolder:Sprite;
        protected var _selectedIndices:Array;
        protected var availableCellRenderers:Array;
        protected var list:Sprite;
        protected var updatedRendererStyles:Object;
        protected var preChangeItems:Array;
        protected var activeCellRenderers:Array;
        protected var rendererStyles:Object;
        protected var _verticalScrollPosition:Number;
        protected var _dataProvider:DataProvider;
        protected var _horizontalScrollPosition:Number;
        private var collectionItemImport:SimpleCollectionItem;

        protected var _allowMultipleSelection:Boolean = false;
        protected var _selectable:Boolean = true;
        protected var caretIndex:int = -1;
        protected var lastCaretIndex:int = -1;

        public function SelectableList()
        {
            activeCellRenderers = [];
            availableCellRenderers = [];
            invalidItems = new Dictionary(true);
            renderedItems = new Dictionary(true);
            _selectedIndices = [];
            if (dataProvider == null)
            {
                dataProvider = new DataProvider();
            };
            verticalScrollPolicy = ScrollPolicy.AUTO;
            rendererStyles = {};
            updatedRendererStyles = {};
        }

        public static function getStyleDefinition():Object
        {
            return (mergeStyles(defaultStyles, BaseScrollPane.getStyleDefinition()));
        }


        protected function drawList():void
        {
        }

        public function set allowMultipleSelection(_arg_1:Boolean):void
        {
            if (_arg_1 == _allowMultipleSelection)
            {
                return;
            };
            _allowMultipleSelection = _arg_1;
            if (((!(_arg_1)) && (_selectedIndices.length > 1)))
            {
                _selectedIndices = [_selectedIndices.pop()];
                invalidate(InvalidationType.DATA);
            };
        }

        public function sortItemsOn(_arg_1:String, _arg_2:Object=null):*
        {
            return (_dataProvider.sortOn(_arg_1, _arg_2));
        }

        public function removeItemAt(_arg_1:uint):Object
        {
            return (_dataProvider.removeItemAt(_arg_1));
        }

        public function get selectedItem():Object
        {
            return ((_selectedIndices.length == 0) ? null : _dataProvider.getItemAt(selectedIndex));
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (!selectable)
            {
                return;
            };
            switch (_arg_1.keyCode)
            {
                case Keyboard.UP:
                case Keyboard.DOWN:
                case Keyboard.END:
                case Keyboard.HOME:
                case Keyboard.PAGE_UP:
                case Keyboard.PAGE_DOWN:
                    moveSelectionVertically(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    _arg_1.stopPropagation();
                    return;
                case Keyboard.LEFT:
                case Keyboard.RIGHT:
                    moveSelectionHorizontally(_arg_1.keyCode, ((_arg_1.shiftKey) && (_allowMultipleSelection)), ((_arg_1.ctrlKey) && (_allowMultipleSelection)));
                    _arg_1.stopPropagation();
                    return;
            };
        }

        public function get selectable():Boolean
        {
            return (_selectable);
        }

        public function itemToCellRenderer(_arg_1:Object):ICellRenderer
        {
            var _local_2:*;
            var _local_3:ICellRenderer;
            if (_arg_1 != null)
            {
                for (_local_2 in activeCellRenderers)
                {
                    _local_3 = (activeCellRenderers[_local_2] as ICellRenderer);
                    if (_local_3.data == _arg_1)
                    {
                        return (_local_3);
                    };
                };
            };
            return (null);
        }

        public function getNextIndexAtLetter(_arg_1:String, _arg_2:int=-1):int
        {
            var _local_3:int;
            var _local_4:Number;
            var _local_5:Number;
            var _local_6:Object;
            var _local_7:String;
            if (length == 0)
            {
                return (-1);
            };
            _arg_1 = _arg_1.toUpperCase();
            _local_3 = (length - 1);
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_5 = ((_arg_2 + 1) + _local_4);
                if (_local_5 > (length - 1))
                {
                    _local_5 = (_local_5 - length);
                };
                _local_6 = getItemAt(_local_5);
                if (_local_6 == null) break;
                _local_7 = itemToLabel(_local_6);
                if (_local_7 != null)
                {
                    if (_local_7.charAt(0).toUpperCase() == _arg_1)
                    {
                        return (_local_5);
                    };
                };
                _local_4++;
            };
            return (-1);
        }

        public function invalidateList():void
        {
            _invalidateList();
            invalidate(InvalidationType.DATA);
        }

        override public function set enabled(_arg_1:Boolean):void
        {
            super.enabled = _arg_1;
            list.mouseChildren = _enabled;
        }

        public function get selectedIndices():Array
        {
            return (_selectedIndices.concat());
        }

        public function set selectable(_arg_1:Boolean):void
        {
            if (_arg_1 == _selectable)
            {
                return;
            };
            if (!_arg_1)
            {
                selectedIndices = [];
            };
            _selectable = _arg_1;
        }

        public function itemToLabel(_arg_1:Object):String
        {
            return (_arg_1["label"]);
        }

        public function addItemAt(_arg_1:Object, _arg_2:uint):void
        {
            _dataProvider.addItemAt(_arg_1, _arg_2);
            invalidateList();
        }

        public function replaceItemAt(_arg_1:Object, _arg_2:uint):Object
        {
            return (_dataProvider.replaceItemAt(_arg_1, _arg_2));
        }

        protected function handleDataChange(_arg_1:DataChangeEvent):void
        {
            var _local_2:int;
            var _local_3:int;
            var _local_4:String;
            var _local_5:uint;
            _local_2 = _arg_1.startIndex;
            _local_3 = _arg_1.endIndex;
            _local_4 = _arg_1.changeType;
            if (_local_4 == DataChangeType.INVALIDATE_ALL)
            {
                clearSelection();
                invalidateList();
            }
            else
            {
                if (_local_4 == DataChangeType.INVALIDATE)
                {
                    _local_5 = 0;
                    while (_local_5 < _arg_1.items.length)
                    {
                        invalidateItem(_arg_1.items[_local_5]);
                        _local_5++;
                    };
                }
                else
                {
                    if (_local_4 == DataChangeType.ADD)
                    {
                        _local_5 = 0;
                        while (_local_5 < _selectedIndices.length)
                        {
                            if (_selectedIndices[_local_5] >= _local_2)
                            {
                                _selectedIndices[_local_5] = (_selectedIndices[_local_5] + (_local_2 - _local_3));
                            };
                            _local_5++;
                        };
                    }
                    else
                    {
                        if (_local_4 == DataChangeType.REMOVE)
                        {
                            _local_5 = 0;
                            while (_local_5 < _selectedIndices.length)
                            {
                                if (_selectedIndices[_local_5] >= _local_2)
                                {
                                    if (_selectedIndices[_local_5] <= _local_3)
                                    {
                                        delete _selectedIndices[_local_5];
                                    }
                                    else
                                    {
                                        _selectedIndices[_local_5] = (_selectedIndices[_local_5] - ((_local_2 - _local_3) + 1));
                                    };
                                };
                                _local_5++;
                            };
                        }
                        else
                        {
                            if (_local_4 == DataChangeType.REMOVE_ALL)
                            {
                                clearSelection();
                            }
                            else
                            {
                                if (_local_4 != DataChangeType.REPLACE)
                                {
                                    selectedItems = preChangeItems;
                                    preChangeItems = null;
                                };
                            };
                        };
                    };
                };
            };
            invalidate(InvalidationType.DATA);
        }

        protected function _invalidateList():void
        {
            availableCellRenderers = [];
            while (activeCellRenderers.length > 0)
            {
                list.removeChild((activeCellRenderers.pop() as DisplayObject));
            };
        }

        protected function updateRendererStyles():void
        {
            var _local_1:Array;
            var _local_2:uint;
            var _local_3:uint;
            var _local_4:String;
            _local_1 = availableCellRenderers.concat(activeCellRenderers);
            _local_2 = _local_1.length;
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                if (_local_1[_local_3].setStyle != null)
                {
                    for (_local_4 in updatedRendererStyles)
                    {
                        _local_1[_local_3].setStyle(_local_4, updatedRendererStyles[_local_4]);
                    };
                    _local_1[_local_3].drawNow();
                };
                _local_3++;
            };
            updatedRendererStyles = {};
        }

        public function set selectedItem(_arg_1:Object):void
        {
            var _local_2:int;
            _local_2 = _dataProvider.getItemIndex(_arg_1);
            selectedIndex = _local_2;
        }

        public function sortItems(... _args):*
        {
            return (_dataProvider.sort.apply(_dataProvider, _args));
        }

        public function removeAll():void
        {
            _dataProvider.removeAll();
        }

        protected function handleCellRendererChange(_arg_1:Event):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            _local_2 = (_arg_1.currentTarget as ICellRenderer);
            _local_3 = _local_2.listData.index;
            _dataProvider.invalidateItemAt(_local_3);
        }

        protected function moveSelectionVertically(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
        }

        override protected function setHorizontalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:Number;
            if (_arg_1 == _horizontalScrollPosition)
            {
                return;
            };
            _local_3 = (_arg_1 - _horizontalScrollPosition);
            _horizontalScrollPosition = _arg_1;
            if (_arg_2)
            {
                dispatchEvent(new ScrollEvent(ScrollBarDirection.HORIZONTAL, _local_3, _arg_1));
            };
        }

        public function scrollToSelected():void
        {
            scrollToIndex(selectedIndex);
        }

        public function invalidateItem(_arg_1:Object):void
        {
            if (renderedItems[_arg_1] == null)
            {
                return;
            };
            invalidItems[_arg_1] = true;
            invalidate(InvalidationType.DATA);
        }

        protected function handleCellRendererClick(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            var _local_4:int;
            var _local_5:int;
            var _local_6:uint;
            if (!_enabled)
            {
                return;
            };
            _local_2 = (_arg_1.currentTarget as ICellRenderer);
            _local_3 = _local_2.listData.index;
            if (((!(dispatchEvent(new ListEvent(ListEvent.ITEM_CLICK, false, true, _local_2.listData.column, _local_2.listData.row, _local_3, _local_2.data)))) || (!(_selectable))))
            {
                return;
            };
            _local_4 = selectedIndices.indexOf(_local_3);
            if (!_allowMultipleSelection)
            {
                if (_local_4 != -1)
                {
                    return;
                };
                _local_2.selected = true;
                _selectedIndices = [_local_3];
                lastCaretIndex = (caretIndex = _local_3);
            }
            else
            {
                if (_arg_1.shiftKey)
                {
                    _local_6 = ((_selectedIndices.length > 0) ? _selectedIndices[0] : _local_3);
                    _selectedIndices = [];
                    if (_local_6 > _local_3)
                    {
                        _local_5 = _local_6;
                        while (_local_5 >= _local_3)
                        {
                            _selectedIndices.push(_local_5);
                            _local_5--;
                        };
                    }
                    else
                    {
                        _local_5 = _local_6;
                        while (_local_5 <= _local_3)
                        {
                            _selectedIndices.push(_local_5);
                            _local_5++;
                        };
                    };
                    caretIndex = _local_3;
                }
                else
                {
                    if (_arg_1.ctrlKey)
                    {
                        if (_local_4 != -1)
                        {
                            _local_2.selected = false;
                            _selectedIndices.splice(_local_4, 1);
                        }
                        else
                        {
                            _local_2.selected = true;
                            _selectedIndices.push(_local_3);
                        };
                        caretIndex = _local_3;
                    }
                    else
                    {
                        _selectedIndices = [_local_3];
                        lastCaretIndex = (caretIndex = _local_3);
                    };
                };
            };
            dispatchEvent(new Event(Event.CHANGE));
            invalidate(InvalidationType.DATA);
        }

        public function get length():uint
        {
            return (_dataProvider.length);
        }

        public function get allowMultipleSelection():Boolean
        {
            return (_allowMultipleSelection);
        }

        protected function onPreChange(_arg_1:DataChangeEvent):void
        {
            switch (_arg_1.changeType)
            {
                case DataChangeType.REMOVE:
                case DataChangeType.ADD:
                case DataChangeType.INVALIDATE:
                case DataChangeType.REMOVE_ALL:
                case DataChangeType.REPLACE:
                case DataChangeType.INVALIDATE_ALL:
                    return;
                default:
                    preChangeItems = selectedItems;
            };
        }

        public function getRendererStyle(_arg_1:String, _arg_2:int=-1):Object
        {
            return (rendererStyles[_arg_1]);
        }

        override protected function setVerticalScrollPosition(_arg_1:Number, _arg_2:Boolean=false):void
        {
            var _local_3:Number;
            if (_arg_1 == _verticalScrollPosition)
            {
                return;
            };
            _local_3 = (_arg_1 - _verticalScrollPosition);
            _verticalScrollPosition = _arg_1;
            if (_arg_2)
            {
                dispatchEvent(new ScrollEvent(ScrollBarDirection.VERTICAL, _local_3, _arg_1));
            };
        }

        protected function moveSelectionHorizontally(_arg_1:uint, _arg_2:Boolean, _arg_3:Boolean):void
        {
        }

        public function set selectedIndices(_arg_1:Array):void
        {
            if (!_selectable)
            {
                return;
            };
            _selectedIndices = ((_arg_1 == null) ? [] : _arg_1.concat());
            invalidate(InvalidationType.SELECTED);
        }

        public function get selectedIndex():int
        {
            return ((_selectedIndices.length == 0) ? -1 : _selectedIndices[(_selectedIndices.length - 1)]);
        }

        override protected function draw():void
        {
            super.draw();
        }

        override protected function configUI():void
        {
            super.configUI();
            listHolder = new Sprite();
            addChild(listHolder);
            listHolder.scrollRect = contentScrollRect;
            list = new Sprite();
            listHolder.addChild(list);
        }

        public function addItem(_arg_1:Object):void
        {
            _dataProvider.addItem(_arg_1);
            invalidateList();
        }

        protected function handleCellRendererMouseEvent(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:String;
            _local_2 = (_arg_1.target as ICellRenderer);
            _local_3 = ((_arg_1.type == MouseEvent.ROLL_OVER) ? ListEvent.ITEM_ROLL_OVER : ListEvent.ITEM_ROLL_OUT);
            dispatchEvent(new ListEvent(_local_3, false, false, _local_2.listData.column, _local_2.listData.row, _local_2.listData.index, _local_2.data));
        }

        public function clearRendererStyle(_arg_1:String, _arg_2:int=-1):void
        {
            delete rendererStyles[_arg_1];
            updatedRendererStyles[_arg_1] = null;
            invalidate(InvalidationType.RENDERER_STYLES);
        }

        protected function handleCellRendererDoubleClick(_arg_1:MouseEvent):void
        {
            var _local_2:ICellRenderer;
            var _local_3:uint;
            if (!_enabled)
            {
                return;
            };
            _local_2 = (_arg_1.currentTarget as ICellRenderer);
            _local_3 = _local_2.listData.index;
            dispatchEvent(new ListEvent(ListEvent.ITEM_DOUBLE_CLICK, false, true, _local_2.listData.column, _local_2.listData.row, _local_3, _local_2.data));
        }

        public function get rowCount():uint
        {
            return (0);
        }

        public function isItemSelected(_arg_1:Object):Boolean
        {
            return (selectedItems.indexOf(_arg_1) > -1);
        }

        public function set dataProvider(_arg_1:DataProvider):void
        {
            if (_dataProvider != null)
            {
                _dataProvider.removeEventListener(DataChangeEvent.DATA_CHANGE, handleDataChange);
                _dataProvider.removeEventListener(DataChangeEvent.PRE_DATA_CHANGE, onPreChange);
            };
            _dataProvider = _arg_1;
            _dataProvider.addEventListener(DataChangeEvent.DATA_CHANGE, handleDataChange, false, 0, true);
            _dataProvider.addEventListener(DataChangeEvent.PRE_DATA_CHANGE, onPreChange, false, 0, true);
            clearSelection();
            invalidateList();
        }

        override protected function drawLayout():void
        {
            super.drawLayout();
            contentScrollRect = listHolder.scrollRect;
            contentScrollRect.width = availableWidth;
            contentScrollRect.height = availableHeight;
            listHolder.scrollRect = contentScrollRect;
        }

        public function getItemAt(_arg_1:uint):Object
        {
            return (_dataProvider.getItemAt(_arg_1));
        }

        override protected function initializeAccessibility():void
        {
            if (SelectableList.createAccessibilityImplementation != null)
            {
                SelectableList.createAccessibilityImplementation(this);
            };
        }

        public function scrollToIndex(_arg_1:int):void
        {
        }

        public function removeItem(_arg_1:Object):Object
        {
            return (_dataProvider.removeItem(_arg_1));
        }

        public function get dataProvider():DataProvider
        {
            return (_dataProvider);
        }

        public function set maxHorizontalScrollPosition(_arg_1:Number):void
        {
            _maxHorizontalScrollPosition = _arg_1;
            invalidate(InvalidationType.SIZE);
        }

        public function setRendererStyle(_arg_1:String, _arg_2:Object, _arg_3:uint=0):void
        {
            if (rendererStyles[_arg_1] == _arg_2)
            {
                return;
            };
            updatedRendererStyles[_arg_1] = _arg_2;
            rendererStyles[_arg_1] = _arg_2;
            invalidate(InvalidationType.RENDERER_STYLES);
        }

        public function invalidateItemAt(_arg_1:uint):void
        {
            var _local_2:Object;
            _local_2 = _dataProvider.getItemAt(_arg_1);
            if (_local_2 != null)
            {
                invalidateItem(_local_2);
            };
        }

        public function set selectedItems(_arg_1:Array):void
        {
            var _local_2:Array;
            var _local_3:uint;
            var _local_4:int;
            if (_arg_1 == null)
            {
                selectedIndices = null;
                return;
            };
            _local_2 = [];
            _local_3 = 0;
            while (_local_3 < _arg_1.length)
            {
                _local_4 = _dataProvider.getItemIndex(_arg_1[_local_3]);
                if (_local_4 != -1)
                {
                    _local_2.push(_local_4);
                };
                _local_3++;
            };
            selectedIndices = _local_2;
        }

        public function clearSelection():void
        {
            selectedIndex = -1;
        }

        override public function get maxHorizontalScrollPosition():Number
        {
            return (_maxHorizontalScrollPosition);
        }

        public function get selectedItems():Array
        {
            var _local_1:Array;
            var _local_2:uint;
            _local_1 = [];
            _local_2 = 0;
            while (_local_2 < _selectedIndices.length)
            {
                _local_1.push(_dataProvider.getItemAt(_selectedIndices[_local_2]));
                _local_2++;
            };
            return (_local_1);
        }

        public function set selectedIndex(_arg_1:int):void
        {
            selectedIndices = ((_arg_1 == -1) ? null : [_arg_1]);
        }


    }
}//package fl.controls

