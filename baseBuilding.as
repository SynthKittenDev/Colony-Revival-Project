// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//baseBuilding

package 
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import flash.events.MouseEvent;
    import flash.events.Event;
    import flash.utils.getDefinitionByName;

    public class baseBuilding extends Sprite 
    {

        public var aiCheck:aiOrder;
        public var unitLink:unitBody = null;
        private var hitter:_hitter = new _hitter();
        private var base:_base = new _base();
        private var bitmap:Bitmap = null;
        public var baseId:uint = new uint();
        public var ownBy:playerKon;
        public var currentBuilding:uint = 0;
        public var maxTime:Number = 0;
        public var autoBuild:Boolean = false;
        private var currentTime:Number = 0;
        private var aniTime:uint = 0;
        public var percentTime:Number = 0;
        public var INFO:Array = new Array();
        public var option:Object;
        public var working:Boolean = false;
        public var buildSide:Boolean = false;
        private var buildCommand:uint = 0;
        private var aniTimeLimit:uint = 0;
        private var buildPhase:uint = 0;
        public var techSend:aiStrategy;

        public function baseBuilding():void
        {
            techSend = null;
            addChild(base);
            addChildAt(hitter, 0);
            INFO = buildingData.LIST[currentBuilding];
            render(INFO[1]);
            gameKon.theStage.addEventListener(MouseEvent.MOUSE_DOWN, selectBase);
            gameKon.displayArray.push(this);
            gameKon.buildingArray.push(this);
            aiCheck = null;
        }

        public function pushBuild():void
        {
            ownBy.builds.push(this);
        }

        public function beginWork():void
        {
            currentTime = 0;
            working = true;
            if (gameKon.selectedBuilding == this)
            {
                gameKon.theRoot.buildBar.visible = true;
                gameKon.cText2 = option.tip;
                if (gameKon.tippingWork)
                {
                    toolTip.tip(gameKon.cText2, 1);
                };
                displayKon.updateOptions();
            }
            else
            {
                base.innerFrame.gotoAndStop("working");
            };
            addEventListener(Event.ENTER_FRAME, work, false, 0, true);
        }

        public function destroy():void
        {
            option = optionData.LIST[0];
            INFO = buildingData.LIST[0];
            buildSwap();
        }

        private function buildSwap():void
        {
            buildPhase = 0;
            if (currentBuilding != 0)
            {
                if (option.buildOrder == 0)
                {
                    buildCommand = 0;
                }
                else
                {
                    buildCommand = 2;
                };
                aniTimeLimit = 18;
                base.bgh.gotoAndPlay("Down");
                soundKon.playSound(3, 2, buildSide);
            }
            else
            {
                soundKon.playSound(3, 1, buildSide);
                buildCommand = 1;
                aniTimeLimit = 15;
                base.bc.play();
            };
            aniTime = 0;
            addEventListener(Event.ENTER_FRAME, animateBuilding, false, 0, true);
        }

        private function animateBuilding(event:Event):void
        {
            if (buildCommand == 3)
            {
                removeEventListener(Event.ENTER_FRAME, animateBuilding);
            };
            if (aniTime < aniTimeLimit)
            {
                aniTime++;
            }
            else
            {
                aniTime = 0;
                buildPhase++;
                if (buildCommand == 0)
                {
                    base.bc.play();
                    buildCommand = 3;
                };
                if (buildCommand == 1)
                {
                    base.bgh.visible = true;
                    render(INFO[1]);
                    base.bgh.gotoAndPlay("Up");
                    buildCommand = 3;
                };
                if (buildCommand == 2)
                {
                    if (buildPhase == 1)
                    {
                        aniTimeLimit = 20;
                        base.bc.play();
                    };
                    if (buildPhase == 2)
                    {
                        aniTimeLimit = 15;
                        base.bc.play();
                    };
                    if (buildPhase == 3)
                    {
                        render(INFO[1]);
                        base.bgh.gotoAndPlay("Up");
                        buildCommand = 3;
                    };
                };
            };
        }

        public function cancelWork(reas:String="Not Given."):void
        {
            var canCancelGo:Boolean;
            var i:*;
            if ((((gameKon.theRoot.singlePlayerMode) || (ownBy == gameKon.playerNow)) || (ownBy.CPUMODE)))
            {
                cancelWork2();
            }
            else
            {
                canCancelGo = true;
                for (i in option.buildResource)
                {
                    if (option.buildResource[i] > 0)
                    {
                        canCancelGo = false;
                    };
                };
                if (canCancelGo)
                {
                    cancelWork2();
                };
            };
        }

        private function cancelWork2():void
        {
            working = false;
            autoBuild = false;
            if (gameKon.selectedBuilding == this)
            {
                displayKon.updateOptions();
            };
            gameKon.theRoot.buildBar.visible = false;
            removeEventListener(Event.ENTER_FRAME, work);
            if (gameKon.selectedBuilding == this)
            {
                base.innerFrame.gotoAndStop("selected");
            }
            else
            {
                base.innerFrame.gotoAndStop("basic");
            };
        }

        private function work(event:Event):void
        {
            var usePos:uint;
            var copyArray:Array;
            var scan_b:*;
            var missileTarget:String;
            var vars:Object;
            var q:*;
            var wi:uint;
            var ranTot:String;
            var ranMan:Number;
            var d:*;
            var ovrR:Boolean;
            var canCancelGo2:Boolean;
            var ir4:*;
            var canCancelGo:Boolean;
            var i:*;
            if (currentTime < maxTime)
            {
                currentTime = (currentTime + _t.theFactor);
                percentTime = (Math.round(currentTime) / maxTime);
                if (gameKon.selectedBuilding == this)
                {
                    gameKon.theRoot.buildBar.width = (percentTime * 150.5);
                };
            }
            else
            {
                if (((gameKon.theRoot.gameRunning) && (((gameKon.theRoot.singlePlayerMode) || (ownBy == gameKon.playerNow)) || ((ownBy.aiOn) && (gameKon.theRoot.roomMaster)))))
                {
                    if (aiCheck != null)
                    {
                        aiCheck.onHold = false;
                        if (techSend != null)
                        {
                            techSend.techLevel++;
                            techSend.techingNow = false;
                            techSend = null;
                        };
                        usePos = ownBy.POS;
                    }
                    else
                    {
                        usePos = gameKon.theRoot.clientPlayer[1];
                    };
                    if (option.buildMissile != null)
                    {
                        copyArray = new Array();
                        for (scan_b in ownBy.eteam.all)
                        {
                            copyArray.push({
                                "ID":ownBy.eteam.all[scan_b].unitId,
                                "xPOS":ownBy.eteam.all[scan_b].x
                            });
                        };
                        if (ownBy.eteam == unitKon.Team2)
                        {
                            copyArray.sortOn("xPOS", Array.NUMERIC);
                        }
                        else
                        {
                            copyArray.sortOn("xPOS", (Array.DESCENDING | Array.NUMERIC));
                        };
                        missileTarget = copyArray[0].ID;
                        copyArray = null;
                        if (gameKon.theRoot.singlePlayerMode)
                        {
                            unitKon.addMissile(missileTarget, parent.x, parent.y);
                        }
                        else
                        {
                            vars = {};
                            vars.option = option.id;
                            vars.pos = usePos;
                            vars.cmd = 2;
                            vars.body = {};
                            vars.body.tar = missileTarget;
                            vars.body.px = parent.x;
                            vars.body.py = parent.y;
                            mpKon.sendOpt(vars);
                        };
                    };
                    if (option.buildUnits != null)
                    {
                        if (gameKon.theRoot.singlePlayerMode)
                        {
                            for (q in option.buildUnits)
                            {
                                unitKon.addUnit(ownBy, option.buildUnits[q]);
                            };
                        }
                        else
                        {
                            vars = {};
                            vars.option = option.id;
                            vars.pos = usePos;
                            vars.cmd = 1;
                            vars.body = {};
                            vars.body.setId = unitKon.setGetId(gameKon.playerNow);
                            vars.body.random = [];
                            for (q in option.buildUnits)
                            {
                                wi = 3;
                                ranTot = "";
                                while (wi > 0)
                                {
                                    wi--;
                                    ranMan = Math.round((Math.random() * 1000));
                                    if (ranTot == "")
                                    {
                                        ranTot = String(ranMan);
                                    }
                                    else
                                    {
                                        ranTot = (ranTot + ("A" + ranMan));
                                    };
                                };
                                vars.body.random.push(ranTot);
                            };
                            mpKon.sendOpt(vars);
                        };
                    };
                };
                if (option.buildOrder != null)
                {
                    if (((ownBy == gameKon.playerNow) && (gameKon.theRoot.singlePlayerMode)))
                    {
                        if (chatBody.needBuild == option.buildOrder)
                        {
                            chatBody.gotBuild = true;
                            chatBody.sendEv("B_RIGHT");
                        }
                        else
                        {
                            chatBody.sendEv("B_WRONG");
                        };
                    };
                    buildSwap();
                    INFO = buildingData.LIST[option.buildOrder];
                    currentBuilding = option.buildOrder;
                };
                ownBy.addRes(0, option.buildResource[0]);
                ownBy.addRes(1, option.buildResource[1]);
                ownBy.addRes(2, option.buildResource[2]);
                ownBy.addRes(3, option.buildResource[3]);
                if (option.buildStock != null)
                {
                    ownBy.stock[option.buildStock] = (ownBy.stock[option.buildStock] + 1);
                };
                if (option.buildTech != null)
                {
                    ownBy.tech[option.buildTech] = (ownBy.tech[option.buildTech] + 1);
                };
                if (option.buildOrder != null)
                {
                    if (((INFO.autoBuild == null) || (ownBy.aiOn)))
                    {
                        autoBuild = false;
                    }
                    else
                    {
                        d = optionData.LIST[INFO.options[INFO.autoBuild]];
                        autoBuild = true;
                        option = d;
                        maxTime = (d[3] * 30);
                    };
                };
                working = false;
                removeEventListener(Event.ENTER_FRAME, work);
                if (gameKon.selectedBuilding == this)
                {
                    displayKon.updateOptions();
                };
                if (gameKon.selectedBuilding == this)
                {
                    gameKon.theRoot.buildBar.visible = false;
                }
                else
                {
                    base.innerFrame.gotoAndStop("basic");
                };
                if (autoBuild)
                {
                    ovrR = false;
                    if ((((!(gameKon.theRoot.singlePlayerMode)) && (!(ownBy == gameKon.playerNow))) && (!(ownBy.CPUMODE))))
                    {
                        canCancelGo2 = false;
                        for (ir4 in option.buildResource)
                        {
                            if (option.buildResource[ir4] > 0)
                            {
                                canCancelGo2 = true;
                            };
                        };
                        if (canCancelGo2)
                        {
                            ovrR = true;
                        };
                    };
                    gameKon.doOption(option, false, true, ownBy, this, ovrR, true);
                }
                else
                {
                    if (!gameKon.theRoot.singlePlayerMode)
                    {
                        if (((!(ownBy == gameKon.playerNow)) && (!(ownBy.CPUMODE))))
                        {
                            canCancelGo = false;
                            for (i in option.buildResource)
                            {
                                if (option.buildResource[i] > 0)
                                {
                                    canCancelGo = true;
                                };
                            };
                            if (canCancelGo)
                            {
                                autoBuild = true;
                                gameKon.doOption(option, false, false, ownBy, this, false, true);
                            };
                        };
                    };
                };
            };
        }

        public function killEvents():void
        {
            gameKon.theStage.removeEventListener(MouseEvent.MOUSE_DOWN, selectBase);
            removeEventListener(Event.ENTER_FRAME, animateBuilding);
            removeEventListener(Event.ENTER_FRAME, work);
        }

        private function selectBase(event:MouseEvent):void
        {
            if (hitter.hitTestPoint((((parent.parent.x + parent.x) + this.x) + mouseX), (((parent.parent.y + parent.y) + this.y) + mouseY), false))
            {
                if (unitLink != null)
                {
                    if (unitLink.life > 0)
                    {
                        displayKon.updateUnit([unitLink]);
                        base.innerFrame.gotoAndStop("selected");
                    };
                }
                else
                {
                    gameKon.unselectBuilding();
                    gameKon.selectedBuilding = this;
                    base.innerFrame.gotoAndStop("selected");
                    displayKon.updateOptions();
                    if (working == true)
                    {
                        gameKon.cText2 = option.tip;
                        gameKon.theRoot.buildBar.width = (percentTime * 150.5);
                        gameKon.theRoot.buildBar.visible = true;
                    }
                    else
                    {
                        gameKon.theRoot.buildBar.visible = false;
                    };
                };
            };
        }

        private function render(r:uint):void
        {
            if (bitmap != null)
            {
                base.bgh.bgi.removeChildAt(0);
            };
            bitmap = new Bitmap(renderMachine.buildings[r]);
            base.bgh.bgi.addChild(bitmap);
            bitmap.scaleX = renderMachine.poly;
            bitmap.scaleY = renderMachine.poly;
        }

        public function unselBase():void
        {
            if (working == false)
            {
                base.innerFrame.gotoAndStop("basic");
            }
            else
            {
                base.innerFrame.gotoAndStop("working");
            };
        }

        public function fixColor(col:String):void
        {
            var addColor:Object = (getDefinitionByName(("baseRim_" + col)) as Class);
            var colorRim:* = new (addColor)();
            base.innerFrame.addChildAt(colorRim, 0);
        }


    }
}//package 

