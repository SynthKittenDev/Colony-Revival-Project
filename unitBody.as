// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//unitBody

package 
{
    import flash.filters.ColorMatrixFilter;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class unitBody extends displayBody 
    {

        public static var armorCrossCheck:Array;

        public var airUnit:Boolean = false;
        public var maxLife:Number = 100;
        public var life:Number = maxLife;
        public var speed:Number = 5;
        private var g_wep:weapon;
        private var a_wep:weapon;
        private var wep:weapon;
        private var healer:Boolean = false;
        private var selfHeal:Number = 0;
        public var aiOverride:Boolean = false;
        public var aiKite:Boolean = false;
        public var aiPosition:Boolean = false;
        public var rallyMode:Boolean = false;
        public var aiPoint:Number = 0;
        private var aiOverrideCounter:uint = 0;
        public var kiteNow:Boolean = false;
        public var addResGo:Boolean = false;
        public var addResGoI:uint = 0;
        public var unitId:String;
        public var maxX:Number;
        public var minX:Number;
        public var normalDir:Number = 1;
        private var targetBy:Array;
        public var INFO:Object;
        public var ID:uint;
        private var killTime:uint;
        public var prefire:uint;
        private var armor:uint;
        public var assocBase:baseBuilding = null;
        private var targetList:Array;
        public var team:Team;
        public var moveDir:Number = 1;
        public var eteam:Team;
        public var belong:Array;
        public var behave:uint = 0;
        public var player:playerKon;
        private var speedArray:Array = [0, 0.5, 0.8, 1, 1.4, 1.6, 1.9];
        public var mainTarget:unitBody;
        private var getClose:Number;
        private var maxClose:Number = 40;
        private var mat:Array = [2.6, 0, 0, 0, 2.40000000000001, 0, 2.6, 0, 0, 2.40000000000001, 0, 0, 2.6, 0, 2.40000000000001, 0, 0, 0, 1, 0];
        private var colorMat:ColorMatrixFilter = new ColorMatrixFilter(mat);
        public var exDie:uint;
        public var setFireX:Number;
        public var setFireY:Number;
        public var unitValue:Number;
        private var deathSound:uint;
        private var task:uint;
        private var tarX:Number = 800;

        public function unitBody(id:uint, p:playerKon, rand:Number=-1):void
        {
            doubleClickEnabled = true;
            gameKon.displayArray.push(this);
            INFO = unitData.LIST[id];
            life = (maxLife = INFO.Life);
            unitValue = INFO.Value;
            armor = INFO.Armor;
            airUnit = INFO.Air;
            healer = INFO.Healer;
            selfHeal = INFO.selfHeal;
            setFireX = INFO.setX;
            exDie = INFO.exDie;
            setFireY = INFO.setY;
            deathSound = INFO.deathSound;
            ID = id;
            if (rand == -1)
            {
                getClose = Math.random();
            }
            else
            {
                getClose = rand;
            };
            player = p;
            createDisplay(renderMachine.units[player.cityColor][INFO.Graphic]);
            killTime = renderMachine.units[player.cityColor][INFO.Graphic].killTime;
            prefire = renderMachine.units[player.cityColor][INFO.Graphic].prefire;
            if (INFO.Weapon_G != null)
            {
                g_wep = new weapon(this, INFO.Weapon_G);
            }
            else
            {
                g_wep = null;
            };
            if (INFO.Weapon_A != null)
            {
                a_wep = new weapon(this, INFO.Weapon_A);
            }
            else
            {
                a_wep = null;
            };
            addEventListener(Event.ENTER_FRAME, go, false, 0, true);
            addEventListener(MouseEvent.MOUSE_DOWN, displayStatsTrigger, false, 0, true);
            addEventListener(MouseEvent.DOUBLE_CLICK, selectAllType, false, 0, true);
            addEventListener(MouseEvent.MOUSE_WHEEL, selectAllType, false, 0, true);
        }

        private function selectAllType(me:MouseEvent):void
        {
            var i:*;
            var selectPool:Array = new Array();
            for (i in team.all)
            {
                if (team.all[i].player == gameKon.playerNow)
                {
                    if (team.all[i].ID == ID)
                    {
                        selectPool.push(team.all[i]);
                        displayKon.updateUnit(selectPool);
                    };
                };
            };
        }

        public function fil():void
        {
            filters = [colorMat];
        }

        public function unfil():void
        {
            filters = [];
        }

        public function makeOption(id:uint):void
        {
            var selU:Array;
            var vars:*;
            if (id != behave)
            {
                if (gameKon.theRoot.singlePlayerMode)
                {
                    selU = new Array();
                    selU.push(unitId);
                    gameKon.doUnitOption(id, selU);
                }
                else
                {
                    vars = new Object();
                    vars.id = id;
                    vars.orderArray = new Array();
                    vars.orderArray.push(unitId);
                    mpKon.sendOff(vars, true, "orderUnit");
                };
            };
        }

        private function go(event:Event):void
        {
            if ((((aiPosition) && (!(kiteNow))) && (!(aiOverride))))
            {
                if ((((x < (aiPoint - 25)) && (normalDir == 1)) || ((x > (aiPoint + 25)) && (normalDir == -1))))
                {
                    makeOption(0);
                }
                else
                {
                    if ((((x > (aiPoint + 25)) && (normalDir == 1)) || ((x < (aiPoint - 25)) && (normalDir == -1))))
                    {
                        makeOption(3);
                    }
                    else
                    {
                        makeOption(1);
                        if (rallyMode)
                        {
                            rallyMode = false;
                            aiPosition = false;
                        };
                    };
                };
            }
            else
            {
                if (aiOverride)
                {
                    makeOption(0);
                    aiOverrideCounter--;
                    if (aiOverrideCounter == 0)
                    {
                        aiOverride = false;
                    };
                };
            };
            if (life > 0)
            {
                getTarget();
                if (selfHeal > 0)
                {
                    life = (life + selfHeal);
                };
                if (life > maxLife)
                {
                    life = maxLife;
                };
                if (behave == 3)
                {
                    if (wep != null)
                    {
                        wep.disengage();
                    };
                    if ((((x > minX) && (normalDir == 1)) || ((x < minX) && (normalDir == -1))))
                    {
                        moveDir = -(normalDir);
                        moveUnit();
                    };
                }
                else
                {
                    if (mainTarget != null)
                    {
                        if (checkRange())
                        {
                            wep.engage(healer);
                            scaleX = moveDir;
                            if (behave != 1)
                            {
                                if (checkRange((getClose * maxClose)) == false)
                                {
                                    moveUnit();
                                };
                            };
                        }
                        else
                        {
                            if (behave != 1)
                            {
                                moveUnit();
                            };
                        };
                    }
                    else
                    {
                        if (behave != 1)
                        {
                            if ((((x < maxX) && (normalDir == 1)) || ((x > maxX) && (normalDir == -1))))
                            {
                                moveDir = normalDir;
                                moveUnit();
                            };
                        };
                    };
                };
            };
        }

        private function moveUnit():void
        {
            x = (x + (moveDir * (speedArray[INFO.Speed] * _t.theFactor)));
            scaleX = moveDir;
            modeChange(1);
        }

        private function checkRange(getC:Number=0):*
        {
            if (mainTarget.x >= x)
            {
                moveDir = 1;
            }
            else
            {
                moveDir = -1;
            };
            if (getRange(mainTarget, wep, getC) == 0)
            {
                return (true);
            };
            disWeps();
            return (false);
        }

        public function getTarget():void
        {
            var cteam:*;
            var w:*;
            var theUnit:*;
            if (behave != 2)
            {
                targetList = new Array();
                if (healer)
                {
                    cteam = team;
                }
                else
                {
                    cteam = eteam;
                };
                if (g_wep != null)
                {
                    for (w in cteam.ground)
                    {
                        if (((!(w == 0)) || (!(healer))))
                        {
                            theUnit = cteam.ground[w];
                            if (theUnit != this)
                            {
                                if (((!(healer)) || (theUnit.life < theUnit.maxLife)))
                                {
                                    targetList.push({
                                        "u":theUnit,
                                        "r":getRange(theUnit, g_wep),
                                        "t":getTime(theUnit),
                                        "theWep":g_wep
                                    });
                                };
                            };
                        };
                    };
                };
                if (a_wep != null)
                {
                    for (w in cteam.air)
                    {
                        theUnit = cteam.air[w];
                        if (theUnit != this)
                        {
                            if (((!(healer)) || (theUnit.life < theUnit.maxLife)))
                            {
                                targetList.push({
                                    "u":theUnit,
                                    "r":getRange(theUnit, a_wep),
                                    "t":getTime(theUnit),
                                    "theWep":a_wep
                                });
                            };
                        };
                    };
                };
                if (healer)
                {
                    targetList.sortOn(["r", "t"], [Array.NUMERIC, Array.NUMERIC]);
                }
                else
                {
                    targetList.sortOn(["r", "t"], [Array.NUMERIC, Array.NUMERIC]);
                };
                if (targetList.length > 0)
                {
                    disWeps();
                    mainTarget = targetList[0].u;
                    wep = targetList[0].theWep;
                }
                else
                {
                    mainTarget = null;
                    disWeps();
                };
                targetList = null;
            };
            if (behave == 2)
            {
                if ((((eteam.all.length > 0) && (!(healer))) && (!(g_wep == null))))
                {
                    mainTarget = eteam.all[0];
                }
                else
                {
                    mainTarget = null;
                    disWeps();
                };
            };
        }

        private function disWeps():void
        {
            if (wep != null)
            {
                wep.disengage();
            };
            if (g_wep != null)
            {
                g_wep.disengage();
            };
            if (a_wep != null)
            {
                a_wep.disengage();
            };
        }

        private function getRange(m:unitBody, n:weapon, getC:Number=0, retVal:Boolean=false):*
        {
            var theHyp:Number = Math.sqrt((Math.pow((m.x - x), 2) + Math.pow((m.y - y), 2)));
            var theDist:Number = ((theHyp - n.weaponRange) + getC);
            if (((m.ID == 0) || (ID == 0)))
            {
                theDist = (theDist - 100);
            };
            if (((m.airUnit) || (airUnit)))
            {
                theDist = (theDist - 50);
            };
            if (retVal)
            {
                return (Math.round((Math.floor(theDist) + (20 / speedArray[INFO.Speed]))));
            };
            if (theDist < 0)
            {
                theDist = 0;
            };
            return (theDist);
        }

        private function getTime(m:unitBody):*
        {
            if (!healer)
            {
                return (Math.round((Math.random() * 10)));
            };
            return (m.life / m.maxLife);
        }

        private function displayStatsTrigger(event:Event):void
        {
            displayStats();
        }

        public function displayStats():void
        {
            displayKon.updateUnit([this]);
        }

        public function killEvents():void
        {
            unitKon.removeUnit(this);
        }

        private function killEventsSoft():void
        {
            removeEventListener(Event.ENTER_FRAME, go);
            removeEventListener(MouseEvent.MOUSE_DOWN, displayStatsTrigger);
            removeEventListener(MouseEvent.MOUSE_OVER, fil);
            removeEventListener(MouseEvent.MOUSE_OUT, unfil);
            if (wep != null)
            {
                wep.disengage();
                wep = null;
            };
            if (a_wep != null)
            {
                a_wep.disengage();
                a_wep = null;
            };
            if (g_wep != null)
            {
                g_wep.disengage();
                g_wep = null;
            };
        }

        public function terminateEvents():void
        {
            killEventsSoft();
            end();
        }

        public function killThis(event:Event):void
        {
            killTime = (killTime - 1);
            if (killTime == 0)
            {
                if (exDie > 0)
                {
                    unitKon.addEx(exDie, x, y);
                    if (addResGo)
                    {
                        unitKon.addEx(addResGoI, x, y, false);
                    };
                };
                unitKon.removeUnit(this);
                removeEventListener(Event.ENTER_FRAME, killThis);
            };
        }

        public function takeHit(dam:Number, wepType:uint, shooter:unitBody=null, p:playerKon=null):void
        {
            var realDam:*;
            var vars:Object;
            if (this != null)
            {
                realDam = Math.round((armorCrossCheck[armor][wepType] * dam));
                if (life > 0)
                {
                    if (aiPosition)
                    {
                        if (shooter != null)
                        {
                            if ((((shooter.airUnit) && (!(a_wep == null))) || ((!(shooter.airUnit)) && (!(g_wep == null)))))
                            {
                                aiOverrideCounter = 90;
                                aiOverride = true;
                            };
                        };
                    };
                    life = (life - realDam);
                    if (life > maxLife)
                    {
                        life = maxLife;
                    };
                    if (life <= 0)
                    {
                        life = 0;
                        if (gameKon.theRoot.singlePlayerMode)
                        {
                            unitKon.killOffUnit(unitId, p, Math.round((Math.random() * 3)));
                        }
                        else
                        {
                            if ((player.desync == false))
                            {
                                vars = new Object();
                                vars.id = unitId;
                                vars.ran = Math.round((Math.random() * 3));
                                if (p != null)
                                {
                                    vars.p = p.POS;
                                }
                                else
                                {
                                    vars.p = 0;
                                };
                                mpKon.sendOff(vars, true, "killUnit");
                            }
                            else
                            {
                                unitKon.killOffUnit(unitId, p, Math.round((Math.random() * 3)));
                            };
                        };
                    };
                };
            };
        }

        public function endUnitBegin():void
        {
            if (x > 800)
            {
                soundKon.playSound(1, deathSound, true);
            }
            else
            {
                soundKon.playSound(1, deathSound, false);
            };
            killEventsSoft();
            if (assocBase != null)
            {
                team.baseAlive = false;
                assocBase.destroy();
            };
            if (killTime == 0)
            {
                unitKon.removeUnit(this);
            }
            else
            {
                modeChange(3);
                addEventListener(Event.ENTER_FRAME, killThis);
            };
        }


    }
}//package 

