// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//gameKon

package 
{
    import flash.utils.Timer;
    import flash.display.Stage;
    import flash.events.TimerEvent;

    public class gameKon 
    {

        public static var rallyOn:Boolean;
        public static var playerNow:playerKon;
        private static var incomeTimer:Timer;
        public static var cText2:tipObject;
        public static var selectedBuilding:baseBuilding;
        public static var selectedUnit:Array;
        public static var winningTeam:uint;
        public static var theStage:Stage;
        public static var theRoot:Object;

        public static var displayArray:Array = new Array();
        public static var shiftToggle:Boolean = false;
        public static var tippingWork:Boolean = false;
        public static var desync:Boolean = false;
        public static var buildingArray:Array = new Array();
        private static var newTips:Array = new Array();

        private var incomeTime:Number = 5;
        public var player0:playerKon;
        public var player1:playerKon;
        public var player2:playerKon;
        public var player3:playerKon;
        public var player4:playerKon;

        {
            newTips[0] = new tipObject("Advance", 0, 0, 0, "Move forward and attack normally.");
            newTips[1] = new tipObject("Hold", 0, 0, 0, "Hold position and fire at nearby enemies.");
            newTips[2] = new tipObject("Charge", 0, 0, 0, "Storm towards the enemy base, attacking nothing else.");
            newTips[3] = new tipObject("Fall Back", 0, 0, 0, "Retreat back towards base, but will not return enemy fire.");
        }

        public function gameKon():void
        {
            displayArray = new Array();
            buildingArray = new Array();
            selectedBuilding = null;
            selectedUnit = null;
        }

        public static function unselectBuilding():void
        {
            var i:*;
            selectedBuilding = null;
            for (i in buildingArray)
            {
                buildingArray[i].unselBase();
            };
        }

        public static function doTip(j:Number, action:Boolean):void
        {
            var p:*;
            var d:*;
            if (action)
            {
                if (selectedBuilding != null)
                {
                    p = selectedBuilding.INFO.options[j];
                    if (p != null)
                    {
                        d = optionData.LIST[p];
                        toolTip.tip(d.tip, 0);
                    };
                }
                else
                {
                    toolTip.tip(newTips[j], 0);
                };
            }
            else
            {
                toolTip.unTip();
            };
        }

        public static function doOption(d:Object, j:Boolean, h:Boolean, player:playerKon, tarBuild:baseBuilding, overRide:Boolean=false, autoCom:Boolean=false, vars:Object=null, sendOff:Boolean=false):void
        {
            var vars2:Object;
            var UTR:uint;
            var sampleArray:uint;
            var fgh:*;
            if (tarBuild != null)
            {
                if (j)
                {
                    d = tarBuild.option;
                    if (!((((!(theRoot.singlePlayerMode)) && (!(player.CPUMODE))) && (!(player == playerNow))) && ((!(d.buildMissile == null)) || (!(d.buildUnits == null)))))
                    {
                        player.addRes(0, d[0]);
                        player.addRes(1, d[1]);
                        player.addRes(2, d[2]);
                        player.addRes(3, d[4]);
                    };
                    // trace("CANCEL");
                    tarBuild.cancelWork("[GameKon] Ordered to Cancel.");
                    if (d.buildMissile != null)
                    {
                        player.mcd++;
                    };
                }
                else
                {
                    if (((overRide) || ((((player.r_m >= d[0]) && (player.r_p >= d[1])) && (player.r_e >= d[2])) && (player.r_i >= d[4]))))
                    {
                        if (((overRide) || (checkBuild(player, d.buildReq))))
                        {
                            if (((overRide) || (checkTech(player, d.techReq))))
                            {
                                if (((overRide) || (checkStock(player, d.stockReq))))
                                {
                                    if (((!(theRoot.singlePlayerMode)) && (sendOff == true)))
                                    {
                                        if (h)
                                        {
                                            vars.auto = true;
                                        };
                                        vars2 = {};
                                        vars2.body = vars;
                                        vars2.option = d.id;
                                        vars2.pos = player.POS;
                                        vars2.cmd = 0;
                                        mpKon.sendOpt(vars2);
                                    };
                                    if (((!(sendOff)) || (theRoot.singlePlayerMode)))
                                    {
                                        if (!((((!(theRoot.singlePlayerMode)) && (!(player.CPUMODE))) && (!(player == playerNow))) && ((!(d.buildMissile == null)) || (!(d.buildUnits == null)))))
                                        {
                                            player.addRes(0, -(d[0]));
                                            player.addRes(1, -(d[1]));
                                            player.addRes(2, -(d[2]));
                                            player.addRes(3, -(d[4]));
                                            player.stock[d.stockReq]--;
                                        };
                                        tarBuild.option = d;
                                        sampleArray = 0;
                                        for (fgh in d.buildResource)
                                        {
                                            sampleArray = (sampleArray + d.buildResource[fgh]);
                                        };
                                        UTR = d[3];
                                        if (player.race == 0)
                                        {
                                            if (sampleArray == 0)
                                            {
                                                UTR = (UTR * 0.65);
                                                if (UTR > 4)
                                                {
                                                    UTR = 4;
                                                };
                                                if (UTR < 1)
                                                {
                                                    UTR = 1;
                                                };
                                            };
                                        };
                                        if (player.race == 2)
                                        {
                                            if (sampleArray > 0)
                                            {
                                                UTR = (UTR * 0.85);
                                            };
                                        };
                                        tarBuild.maxTime = (UTR * 30);
                                        tarBuild.beginWork();
                                        if (h)
                                        {
                                            tarBuild.autoBuild = true;
                                        };
                                    };
                                }
                                else
                                {
                                    if (!autoCom)
                                    {
                                        toolTip.giveError("Error", "You don't have enough things in stock to do this.");
                                    };
                                };
                            }
                            else
                            {
                                if (!autoCom)
                                {
                                    toolTip.giveError("Error", "You don't have the required technology to do this.");
                                };
                            };
                        }
                        else
                        {
                            if (!autoCom)
                            {
                                toolTip.giveError("Error", "You don't have the required structure to do this.");
                            };
                        };
                    }
                    else
                    {
                        if (!autoCom)
                        {
                            toolTip.giveError("Error", "You don't have enough resources to do this.");
                        };
                    };
                };
            };
        }

        public static function checkStock(player:playerKon, tar:*):*
        {
            if (((player.stock[tar] > 0) || (tar == null)))
            {
                return (true);
            };
            return (false);
        }

        public static function checkTech(player:playerKon, tar:*):*
        {
            if (((player.tech[tar] > 0) || (tar == null)))
            {
                return (true);
            };
            return (false);
        }

        public static function doUnitOption(id:uint, unitArray:Array=null):void
        {
            var k:*;
            var u:*;
            var scan_i:*;
            var f:*;
            var orderMatrix:Array = new Array();
            if (unitArray == null)
            {
                orderMatrix = selectedUnit;
            }
            else
            {
                for (u in unitArray)
                {
                    for (scan_i in unitKon.masterUnitArray)
                    {
                        if (unitKon.masterUnitArray[scan_i].unitId == unitArray[u])
                        {
                            orderMatrix.push(unitKon.masterUnitArray[scan_i]);
                        };
                    };
                };
            };
            for (k in orderMatrix)
            {
                if (orderMatrix[k] == playerNow.team.all[0])
                {
                    for (f in playerNow.team.all)
                    {
                        if (f != 0)
                        {
                            playerNow.team.all[f].behave = id;
                            if (id == 1)
                            {
                                playerNow.team.all[f].modeChange(0);
                            };
                        };
                    };
                }
                else
                {
                    orderMatrix[k].behave = id;
                    orderMatrix[k].modeChange(0);
                };
            };
        }

        public static function checkBuild(player:playerKon, tar:*):*
        {
            var u:*;
            var c:Boolean;
            for (u in player.builds)
            {
                if (player.builds[u].currentBuilding == tar)
                {
                    c = true;
                };
                if (tar == null)
                {
                    c = true;
                };
            };
            return (c);
        }

        public static function shakeScreen(a:uint):void
        {
            if (a == 0)
            {
                theRoot.startShake(4, 1.3, 0.8);
            };
            if (a == 1)
            {
                theRoot.startShake(13, 1.23, 1.4);
            };
            if (a == 2)
            {
                theRoot.startShake(30, 1.5, 0.9);
            };
        }


        public function assignBase():void
        {
            var i:*;
            unitKon.resetAll(player1, player3);
            buildingArray[5].ownBy = player1;
            buildingArray[6].ownBy = player1;
            buildingArray[7].ownBy = player1;
            buildingArray[8].ownBy = player1;
            buildingArray[0].ownBy = player2;
            buildingArray[1].ownBy = player2;
            buildingArray[2].ownBy = player2;
            buildingArray[3].ownBy = player2;
            buildingArray[14].ownBy = player3;
            buildingArray[15].ownBy = player3;
            buildingArray[16].ownBy = player3;
            buildingArray[17].ownBy = player3;
            buildingArray[9].ownBy = player4;
            buildingArray[10].ownBy = player4;
            buildingArray[11].ownBy = player4;
            buildingArray[12].ownBy = player4;
            for (i in buildingArray)
            {
                buildingArray[i].baseId = i;
                if (((i == 4) || (i == 13)))
                {
                    buildingArray[i].fixColor("White");
                    buildingArray[i].ownBy = player0;
                    buildingArray[i].option = optionData.LIST[1];
                    buildingArray[i].maxTime = (buildingArray[i].option[3] * 30);
                    buildingArray[i].beginWork();
                }
                else
                {
                    buildingArray[i].pushBuild();
                    buildingArray[i].fixColor(theRoot.colorStrings[buildingArray[i].ownBy.cityColor]);
                };
            };
        }

        public function setData(importStage:Stage, importRoot:Object):void
        {
            theStage = importStage;
            theRoot = importRoot;
            rallyOn = false;
            player0 = new playerKon();
            player1 = new playerKon();
            player2 = new playerKon();
            player3 = new playerKon();
            player4 = new playerKon();
            playerNow = new playerKon();
        }

        public function runData():void
        {
            incomeTimer = new Timer(5000);
            incomeTimer.start();
            incomeTimer.addEventListener(TimerEvent.TIMER, Run, false, 0, true);
        }

        public function stopData():void
        {
            incomeTimer.stop();
            incomeTimer.removeEventListener(TimerEvent.TIMER, Run);
            incomeTimer = null;
        }

        public function Run(event:TimerEvent):void
        {
            theStage.dispatchEvent(new incomeEv("income"));
        }

        public function killAll():void
        {
            var i:*;
            for (i in unitKon.masterUnitArray)
            {
                unitKon.removeUnit(unitKon.masterUnitArray[i]);
            };
            for (i in displayArray)
            {
                if (displayArray[i] != null)
                {
                    displayArray[i].killEvents();
                };
            };
        }


    }
}//package 

