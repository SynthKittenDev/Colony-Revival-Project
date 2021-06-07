// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fl.managers.IFocusManager

package fl.managers
{
    import flash.display.InteractiveObject;
    import fl.controls.Button;

    public interface IFocusManager 
    {

        function getFocus():InteractiveObject;
        function deactivate():void;
        function set defaultButton(_arg_1:Button):void;
        function set showFocusIndicator(_arg_1:Boolean):void;
        function get defaultButtonEnabled():Boolean;
        function get nextTabIndex():int;
        function get defaultButton():Button;
        function get showFocusIndicator():Boolean;
        function setFocus(_arg_1:InteractiveObject):void;
        function activate():void;
        function showFocus():void;
        function set defaultButtonEnabled(_arg_1:Boolean):void;
        function hideFocus():void;
        function findFocusManagerComponent(_arg_1:InteractiveObject):InteractiveObject;
        function getNextFocusManagerComponent(_arg_1:Boolean=false):InteractiveObject;

    }
}//package fl.managers

