// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.managers.StyleManager

package fl.managers
{
    import flash.utils.Dictionary;
    import fl.core.UIComponent;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;
    import flash.utils.getQualifiedSuperclassName;
    import flash.text.TextFormat;

    public class StyleManager 
    {

        private static var _instance:StyleManager;

        private var globalStyles:Object;
        private var classToDefaultStylesDict:Dictionary;
        private var styleToClassesHash:Object;
        private var classToStylesDict:Dictionary;
        private var classToInstancesDict:Dictionary;

        public function StyleManager()
        {
            styleToClassesHash = {};
            classToInstancesDict = new Dictionary(true);
            classToStylesDict = new Dictionary(true);
            classToDefaultStylesDict = new Dictionary(true);
            globalStyles = UIComponent.getStyleDefinition();
        }

        public static function clearComponentStyle(_arg_1:Object, _arg_2:String):void
        {
            var _local_3:Class;
            var _local_4:Object;
            _local_3 = getClassDef(_arg_1);
            _local_4 = getInstance().classToStylesDict[_local_3];
            if (((!(_local_4 == null)) && (!(_local_4[_arg_2] == null))))
            {
                delete _local_4[_arg_2];
                invalidateComponentStyle(_local_3, _arg_2);
            };
        }

        private static function getClassDef(component:Object):Class
        {
            if ((component is Class))
            {
                return (component as Class);
            };
            try
            {
                return (getDefinitionByName(getQualifiedClassName(component)) as Class);
            }
            catch(e:Error)
            {
                if ((component is UIComponent))
                {
                    try
                    {
                        return (component.loaderInfo.applicationDomain.getDefinition(getQualifiedClassName(component)) as Class);
                    }
                    catch(e:Error)
                    {
                    };
                };
            };
            return (null);
        }

        public static function clearStyle(_arg_1:String):void
        {
            setStyle(_arg_1, null);
        }

        public static function setComponentStyle(_arg_1:Object, _arg_2:String, _arg_3:Object):void
        {
            var _local_4:Class;
            var _local_5:Object;
            _local_4 = getClassDef(_arg_1);
            _local_5 = getInstance().classToStylesDict[_local_4];
            if (_local_5 == null)
            {
                _local_5 = (getInstance().classToStylesDict[_local_4] = {});
            };
            if (_local_5 == _arg_3)
            {
                return;
            };
            _local_5[_arg_2] = _arg_3;
            invalidateComponentStyle(_local_4, _arg_2);
        }

        private static function setSharedStyles(_arg_1:UIComponent):void
        {
            var _local_2:StyleManager;
            var _local_3:Class;
            var _local_4:Object;
            var _local_5:String;
            _local_2 = getInstance();
            _local_3 = getClassDef(_arg_1);
            _local_4 = _local_2.classToDefaultStylesDict[_local_3];
            for (_local_5 in _local_4)
            {
                _arg_1.setSharedStyle(_local_5, getSharedStyle(_arg_1, _local_5));
            };
        }

        public static function getComponentStyle(_arg_1:Object, _arg_2:String):Object
        {
            var _local_3:Class;
            var _local_4:Object;
            _local_3 = getClassDef(_arg_1);
            _local_4 = getInstance().classToStylesDict[_local_3];
            return ((_local_4 == null) ? null : _local_4[_arg_2]);
        }

        private static function getInstance():*
        {
            if (_instance == null)
            {
                _instance = new (StyleManager)();
            };
            return (_instance);
        }

        private static function invalidateComponentStyle(_arg_1:Class, _arg_2:String):void
        {
            var _local_3:Dictionary;
            var _local_4:Object;
            var _local_5:UIComponent;
            _local_3 = getInstance().classToInstancesDict[_arg_1];
            if (_local_3 == null)
            {
                return;
            };
            for (_local_4 in _local_3)
            {
                _local_5 = (_local_4 as UIComponent);
                if (_local_5 != null)
                {
                    _local_5.setSharedStyle(_arg_2, getSharedStyle(_local_5, _arg_2));
                };
            };
        }

        private static function invalidateStyle(_arg_1:String):void
        {
            var _local_2:Dictionary;
            var _local_3:Object;
            _local_2 = getInstance().styleToClassesHash[_arg_1];
            if (_local_2 == null)
            {
                return;
            };
            for (_local_3 in _local_2)
            {
                invalidateComponentStyle(Class(_local_3), _arg_1);
            };
        }

        public static function registerInstance(instance:UIComponent):void
        {
            var inst:StyleManager;
            var classDef:Class;
            var target:Class;
            var defaultStyles:Object;
            var styleToClasses:Object;
            var n:String;
            inst = getInstance();
            classDef = getClassDef(instance);
            if (classDef == null)
            {
                return;
            };
            if (inst.classToInstancesDict[classDef] == null)
            {
                inst.classToInstancesDict[classDef] = new Dictionary(true);
                target = classDef;
                while (defaultStyles == null)
                {
                    if (target["getStyleDefinition"] != null)
                    {
                        defaultStyles = target["getStyleDefinition"]();
                        break;
                    };
                    try
                    {
                        target = (instance.loaderInfo.applicationDomain.getDefinition(getQualifiedSuperclassName(target)) as Class);
                    }
                    catch(err:Error)
                    {
                        try
                        {
                            target = (getDefinitionByName(getQualifiedSuperclassName(target)) as Class);
                        }
                        catch(e:Error)
                        {
                            defaultStyles = UIComponent.getStyleDefinition();
                            break;
                        };
                    };
                };
                styleToClasses = inst.styleToClassesHash;
                for (n in defaultStyles)
                {
                    if (styleToClasses[n] == null)
                    {
                        styleToClasses[n] = new Dictionary(true);
                    };
                    styleToClasses[n][classDef] = true;
                };
                inst.classToDefaultStylesDict[classDef] = defaultStyles;
                inst.classToStylesDict[classDef] = {};
            };
            inst.classToInstancesDict[classDef][instance] = true;
            setSharedStyles(instance);
        }

        public static function getStyle(_arg_1:String):Object
        {
            return (getInstance().globalStyles[_arg_1]);
        }

        private static function getSharedStyle(_arg_1:UIComponent, _arg_2:String):Object
        {
            var _local_3:Class;
            var _local_4:StyleManager;
            var _local_5:Object;
            _local_3 = getClassDef(_arg_1);
            _local_4 = getInstance();
            _local_5 = _local_4.classToStylesDict[_local_3][_arg_2];
            if (_local_5 != null)
            {
                return (_local_5);
            };
            _local_5 = _local_4.globalStyles[_arg_2];
            if (_local_5 != null)
            {
                return (_local_5);
            };
            return (_local_4.classToDefaultStylesDict[_local_3][_arg_2]);
        }

        public static function setStyle(_arg_1:String, _arg_2:Object):void
        {
            var _local_3:Object;
            _local_3 = getInstance().globalStyles;
            if (((_local_3[_arg_1] === _arg_2) && (!(_arg_2 is TextFormat))))
            {
                return;
            };
            _local_3[_arg_1] = _arg_2;
            invalidateStyle(_arg_1);
        }


    }
}//package fl.managers

