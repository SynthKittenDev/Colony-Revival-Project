// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//displayKon

package 
{
    import flash.display.Bitmap;
    import flash.events.Event;
    import flash.display.MovieClip;

    public class displayKon 
    {

        public static var d_bitmap:Bitmap;
        public static var restricted:Boolean = false;
        public static var restrictArray:Array;

        public function displayKon():void
        {
            gameKon.displayArray.push(this);
            clearAllOptions(true);
            render(0, 1, gameKon.theRoot.b8, null);
        }

        public static function liftRestri():void
        {
            restrictArray = new Array();
            restricted = false;
        }

        public static function updateOptions():void
        {
            var g:*;
            var p:*;
            var i:*;
            var w:*;
            var restri:Boolean;
            var jj:*;
            var d:*;
            for (g in unitKon.Team1.all)
            {
                unitKon.Team1.all[g].unfil();
            };
            for (g in unitKon.Team2.all)
            {
                unitKon.Team2.all[g].unfil();
            };
            gameKon.theStage.removeEventListener(Event.ENTER_FRAME, updateBar);
            gameKon.theRoot.ui_hp.text = "";
            gameKon.theRoot.buildBar.gotoAndStop("YELLOW");
            p = gameKon.selectedBuilding.INFO.options;
            gameKon.theRoot.uiName.text = gameKon.selectedBuilding.INFO[0];
            gameKon.theRoot.uiDesc.text = gameKon.selectedBuilding.INFO[2];
            if (((gameKon.selectedBuilding.working) && (gameKon.selectedBuilding.ownBy == gameKon.playerNow)))
            {
                i = 0;
                while (i < 8)
                {
                    gameKon.theRoot[("b" + i)].visible = false;
                    i++;
                };
                gameKon.theRoot.oi.visible = true;
                gameKon.theRoot.b8.visible = true;
                w = gameKon.selectedBuilding.option;
                if (gameKon.theRoot.oi.numChildren > 0)
                {
                    gameKon.theRoot.oi.removeChildAt(0);
                };
                render(w.iconGraphic[0], w.iconGraphic[1], gameKon.theRoot.oi, w);
            }
            else
            {
                gameKon.theRoot.oi.visible = false;
                gameKon.theRoot.b8.visible = false;
                i = 0;
                while (i < 8)
                {
                    gameKon.theRoot[("b" + i)].visible = true;
                    if (gameKon.theRoot[("b" + i)].gfx.numChildren > 0)
                    {
                        gameKon.theRoot[("b" + i)].gfx.removeChildAt(0);
                    };
                    restri = false;
                    if (restricted)
                    {
                        for (jj in restrictArray)
                        {
                            if (p[i] == restrictArray[jj])
                            {
                                restri = true;
                            };
                        };
                    };
                    if ((((restri) || (p[i] == null)) || (!(gameKon.selectedBuilding.ownBy == gameKon.playerNow))))
                    {
                        gameKon.theRoot[("b" + i)].btn.visible = false;
                    }
                    else
                    {
                        d = optionData.LIST[p[i]];
                        gameKon.theRoot[("b" + i)].btn.visible = true;
                        render(d.iconGraphic[0], d.iconGraphic[1], gameKon.theRoot[("b" + i)].gfx, d);
                    };
                    i++;
                };
            };
        }

        public static function updateUnit(u:Array):void
        {
            var g:*;
            var i:*;
            gameKon.unselectBuilding();
            clearAllOptions();
            gameKon.theRoot.buildBar.gotoAndStop("GREEN");
            gameKon.selectedBuilding = null;
            if (u.length == 1)
            {
                gameKon.theRoot.buildBar.visible = true;
                gameKon.selectedUnit = [u[0]];
                gameKon.theRoot.uiName.text = u[0].INFO.Name;
                gameKon.theRoot.uiDesc.text = u[0].INFO.Desc;
                gameKon.theStage.addEventListener(Event.ENTER_FRAME, updateBar);
            }
            else
            {
                gameKon.selectedUnit = u;
                gameKon.theRoot.buildBar.visible = false;
                gameKon.theRoot.ui_hp.text = "";
                gameKon.theRoot.uiName.text = "Group Selection";
                gameKon.theRoot.uiDesc.text = "Multiple units have been selected.";
            };
            for (g in gameKon.selectedUnit)
            {
                gameKon.selectedUnit[g].fil();
            };
            if (u[0].assocBase == null)
            {
                if (((u[0].player == gameKon.playerNow) || (u.length > 1)))
                {
                    i = 0;
                    while (i < 4)
                    {
                        gameKon.theRoot[("b" + i)].btn.visible = true;
                        render(0, (i + 2), gameKon.theRoot[("b" + i)].gfx);
                        i++;
                    };
                };
            };
        }

        public static function updateBar(event:Event):void
        {
            try
            {
                if (gameKon.selectedUnit.length == 1)
                {
                    gameKon.theRoot.buildBar.width = (150.5 * (gameKon.selectedUnit[0].life / gameKon.selectedUnit[0].maxLife));
                    gameKon.theRoot.ui_hp.text = Math.round(gameKon.selectedUnit[0].life);
                }
                else
                {
                    gameKon.theRoot.ui_hp.text = "";
                    if (gameKon.selectedBuilding == null)
                    {
                        gameKon.theRoot.buildBar.visible = false;
                    };
                };
            }
            catch(e:Error)
            {
            };
        }

        public static function clearAllOptions(startClear:Boolean=false):void
        {
            var g:*;
            gameKon.theStage.removeEventListener(Event.ENTER_FRAME, updateBar);
            if (!startClear)
            {
                for (g in unitKon.Team1.all)
                {
                    unitKon.Team1.all[g].unfil();
                };
                for (g in unitKon.Team2.all)
                {
                    unitKon.Team2.all[g].unfil();
                };
            };
            gameKon.theStage.removeEventListener(Event.ENTER_FRAME, updateBar);
            gameKon.unselectBuilding();
            gameKon.theRoot.buildBar.visible = false;
            gameKon.selectedBuilding = null;
            gameKon.selectedUnit = new Array();
            gameKon.theRoot.uiName.text = "Control Panel";
            gameKon.theRoot.ui_hp.text = "";
            gameKon.theRoot.uiDesc.text = "Nothing selected. Click on a unit or a base to select it.";
            var i:* = 0;
            while (i < 8)
            {
                gameKon.theRoot[("b" + i)].visible = true;
                gameKon.theRoot.oi.visible = false;
                gameKon.theRoot.b8.visible = false;
                if (gameKon.theRoot[("b" + i)].gfx.numChildren > 0)
                {
                    gameKon.theRoot[("b" + i)].gfx.removeChildAt(0);
                };
                gameKon.theRoot[("b" + i)].btn.visible = false;
                i++;
            };
        }

        public static function render(a:uint, b:uint, c:MovieClip, d:Object=null):void
        {
            if (a == 0)
            {
                d_bitmap = new Bitmap(renderMachine.originalButtons[b]);
            }
            else
            {
                if (a == 1)
                {
                    d_bitmap = new Bitmap(renderMachine.copyBase[buildingData.LIST[d.buildOrder][1]]);
                };
            };
            d_bitmap.scaleX = renderMachine.poly;
            d_bitmap.scaleY = renderMachine.poly;
            c.addChild(d_bitmap);
        }


        public function killEvents():void
        {
            gameKon.theStage.removeEventListener(Event.ENTER_FRAME, updateBar);
        }


    }
}//package 

