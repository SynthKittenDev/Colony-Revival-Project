// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//unitKon

package 
{
    public class unitKon 
    {

        public static var Team1:Team;
        public static var Team2:Team;
        public static var grid:*;
        public static var grid2:*;
        public static var theTeam:Team;
        public static var masterUnitArray:Array;
        private static var displayArray:Array = new Array();
        private static var trailCount:uint;


        public static function resetAll(p1:playerKon, p3:playerKon):void
        {
            displayArray = new Array();
            Team1 = new Team();
            Team2 = new Team();
            masterUnitArray = new Array();
            trailCount = 0;
            unitBody.armorCrossCheck = new Array();
            unitBody.armorCrossCheck[0] = new Array(1.25, 1, 1.1, 2, 0.3);
            unitBody.armorCrossCheck[1] = new Array(1, 0.75, 0.75, 2, 1);
            unitBody.armorCrossCheck[2] = new Array(0.25, 0.5, 1, 2, 1);
            unitBody.armorCrossCheck[3] = new Array(0.9, 0.69, 0.67, 0.68, 0.3);
            unitBody.armorCrossCheck[4] = new Array(0.25, 0.75, 0.75, 0.2, 2);
            unitBody.armorCrossCheck[5] = new Array(1.4, 0.26, 0.12, 0.5, 0.5);
            Team1.startY = (Team2.startY = 140);
            Team1.startX = 400;
            Team2.startX = (1600 - Team1.startX);
            Team1.baseStartX = 199;
            Team2.baseStartX = (1600 - Team1.baseStartX);
            Team1.baseStartY = (Team2.baseStartY = 130);
            Team1.rallyPoint = 480;
            Team2.rallyPoint = (1600 - Team1.rallyPoint);
            Team1.midPoint = (Team2.midPoint = 800);
            grid = gameKon.theRoot.unitDisplay;
            grid2 = gameKon.theRoot.effectsDisplay;
        }

        public static function createBase(p1:*, p3:*):void
        {
            addUnit(p1, 0, true, getNewId(p1));
            addUnit(p3, 0, true, getNewId(p3));
            gameKon.buildingArray[4].unitLink = Team1.all[0];
            gameKon.buildingArray[13].unitLink = Team2.all[0];
            Team1.all[0].behave = 1;
            Team2.all[0].behave = 1;
            Team1.all[0].assocBase = gameKon.buildingArray[4];
            Team2.all[0].assocBase = gameKon.buildingArray[13];
        }

        private static function sortDisplay(u:unitBody):*
        {
            var retter:uint;
            var h:*;
            if (displayArray.length == 0)
            {
                displayArray.push({
                    "unit":u,
                    "posY":(u.y + (u.height / 2))
                });
                return (0);
            };
            displayArray.sortOn("posY", (Array.DESCENDING | Array.NUMERIC));
            retter = 0;
            for (h in displayArray)
            {
                if ((displayArray[h].posY <= u.y))
                {
                    retter = (retter + 1);
                    displayArray.push({
                        "unit":u,
                        "posY":u.y
                    });
                    retter = (displayArray.length - (1 + h));
                    return (retter);
                };
            };
            displayArray.push({
                "unit":u,
                "posY":u.y
            });
            return (-1);
        }

        public static function setGetId(p:playerKon):uint
        {
            p.idCounter = (p.idCounter + 50);
            return (p.idCounter);
        }

        public static function setThisId(p:playerKon, id:uint):void
        {
            p.idCounter = id;
        }

        public static function getNewId(p:playerKon):String
        {
            p.idCounter = (p.idCounter + 1);
            return (p.idTag + p.idCounter);
        }

        public static function addUnit(p:playerKon, id:uint, isBase:Boolean=false, uID:String=null, rand1:Number=0, rand2:Number=0, rand3:Number=0):void
        {
            var u:unitBody;
            theTeam = p.team;
            if (gameKon.theRoot.singlePlayerMode)
            {
                rand1 = Math.random();
                rand2 = Math.random();
                rand3 = Math.random();
            };
            u = new unitBody(id, p, rand3);
            if (gameKon.theRoot.singlePlayerMode)
            {
                u.unitId = getNewId(p);
            }
            else
            {
                u.unitId = uID;
            };
            masterUnitArray.push(u);
            u.team = theTeam;
            if (u.team == Team1)
            {
                u.eteam = Team2;
            }
            else
            {
                u.eteam = Team1;
            };
            theTeam.all.push(u);
            if (u.airUnit)
            {
                theTeam.air.push(u);
                u.belong = theTeam.air;
            }
            else
            {
                theTeam.ground.push(u);
                u.belong = theTeam.ground;
            };
            if (isBase)
            {
                u.x = u.team.baseStartX;
                u.y = u.team.baseStartY;
                u.visible = false;
            }
            else
            {
                u.maxX = u.eteam.startX;
                u.x = (u.minX = ((u.team.startX - 10) + Math.round((rand1 * 20))));
                if (u.minX > u.maxX)
                {
                    u.normalDir = (u.moveDir = (u.scaleX = -1));
                };
                if (u.airUnit)
                {
                    u.y = ((u.team.startY - 220) + Math.round((rand2 * 40)));
                }
                else
                {
                    u.y = ((u.team.startY - 25) + Math.round((rand2 * 75)));
                };
            };
            if (((gameKon.rallyOn) && (p)) == gameKon.playerNow)
            {
                u.rallyMode = true;
                u.aiPosition = true;
                u.aiPoint = (u.team.rallyPoint + (30 - (Math.random() * 60)));
            };
            if (p.aiOn)
            {
                if (p.AI.AiStrategy.grouping)
                {
                    p.AI.AiStrategy.aiGroup.push(u);
                    u.aiPosition = true;
                    u.aiPoint = (u.team.rallyPoint + (30 - (Math.random() * 60)));
                };
                if ((u.ID == 9))
                {
                    u.aiPosition = true;
                    u.aiPoint = (u.team.midPoint - (u.normalDir * (Math.random() * 60)));
                };
                if ((((u.ID == 4) || (u.ID == 1)) || (u.ID == 5)))
                {
                    if (Math.random() < 0.15)
                    {
                        u.aiPosition = true;
                        u.aiPoint = (u.team.midPoint - (u.normalDir * (100 + (Math.random() * 200))));
                    };
                };
            };
            var getD:* = sortDisplay(u);
            if (getD == -1)
            {
                grid.addChild(u);
            }
            else
            {
                grid.addChildAt(u, getD);
            };
        }

        public static function addMissile(t:String, zx:Number, zy:Number):void
        {
            var scan_i:*;
            var b:wep_missile;
            var u:unitBody;
            for (scan_i in masterUnitArray)
            {
                if (masterUnitArray[scan_i].unitId == t)
                {
                    u = masterUnitArray[scan_i];
                };
            };
            if (u != null)
            {
                b = new wep_missile(8, u, 388, 20, 3, 105, 3);
                grid2.addChild(b);
                b.x = zx;
                b.y = zy;
                b.init();
            };
        }

        public static function addBullet(b:wep_projectile, z:unitBody):void
        {
            grid2.addChild(b);
            b.x = (z.x + (z.moveDir * (z.setFireX - (z.width / 2))));
            b.y = ((z.y + z.setFireY) - (z.height / 2));
            b.init(z);
        }

        public static function addTrail(t:uint, tx:Number, ty:Number):void
        {
            var tr:trailBody;
            var i:uint = trailBody.intensity[t];
            while (i > 0)
            {
                if (trailCount < 120)
                {
                    tr = new trailBody(t, trailBody.hl[t], trailBody.decay[t]);
                    grid2.addChild(tr);
                    tr.x = ((tx - (trailBody.xGap[t] / 2)) + (Math.random() * trailBody.xGap[t]));
                    tr.y = ((ty - (trailBody.yGap[t] / 2)) + (Math.random() * trailBody.yGap[t]));
                    trailCount++;
                };
                i--;
            };
        }

        public static function addEx(id:uint, ax:Number, ay:Number, fi:Boolean=true):void
        {
            var e:exBody = new exBody(id, fi);
            grid2.addChild(e);
            e.x = ax;
            e.y = ay;
        }

        public static function killOffUnit(uID:String, theKiller:playerKon=null, randNummer:uint=0):void
        {
            var scan_i:*;
            var h:*;
            var del:*;
            var u:*;
            var useVal:Number;
            var randAdd:Number;
            var playerExGo:uint;
            chatBody.sendEv("UNIT_DIED");
            for (scan_i in masterUnitArray)
            {
                if (masterUnitArray[scan_i].unitId == uID)
                {
                    u = masterUnitArray[scan_i];
                    masterUnitArray.splice(scan_i, 1);
                };
            };
            u.endUnitBegin();
            if (theKiller != null)
            {
                if (theKiller.race == 1)
                {
                    if (u.unitValue < 1)
                    {
                        useVal = 1;
                    }
                    else
                    {
                        useVal = u.unitValue;
                    };
                    if (useVal > 0)
                    {
                        randAdd = randNummer;
                        switch (randAdd)
                        {
                            case 0:
                                theKiller.addRes(0, useVal);
                                playerExGo = 0;
                                break;
                            case 1:
                                theKiller.addRes(0, useVal);
                                playerExGo = 0;
                                break;
                            case 2:
                                theKiller.addRes(3, useVal);
                                playerExGo = 3;
                                break;
                            case 3:
                                theKiller.addRes(3, useVal);
                                playerExGo = 3;
                                break;
                        };
                        if (theKiller.getData(3) > 200)
                        {
                            theKiller.setRes(3, 200);
                        };
                        gameKon.theRoot.upUIHand();
                        if (theKiller.team == gameKon.playerNow.team)
                        {
                            if (theKiller == gameKon.playerNow)
                            {
                                if (u.exDie > 0)
                                {
                                    u.addResGo = true;
                                    u.addResGoI = (11 + playerExGo);
                                }
                                else
                                {
                                    addEx((11 + playerExGo), u.x, u.y, false);
                                };
                            };
                        };
                    };
                };
            };
            for (h in displayArray)
            {
                if (displayArray[h].unit == u)
                {
                    displayArray.splice(h, 1);
                };
            };
            if (gameKon.selectedUnit != null)
            {
                if (((gameKon.selectedUnit.length == 1) && (gameKon.selectedUnit[0] == u)))
                {
                    if (gameKon.selectedBuilding == null)
                    {
                        displayKon.clearAllOptions();
                    };
                };
            };
            for (del in u.belong)
            {
                if (u.belong[del] == u)
                {
                    u.belong.splice(del, 1);
                };
            };
            for (del in u.team.all)
            {
                if (u.team.all[del] == u)
                {
                    u.team.all.splice(del, 1);
                };
            };
            if (u.team.all.length == 0)
            {
                gameKon.theRoot.teamWin = u.eteam;
                if (gameKon.playerNow.team == gameKon.theRoot.teamWin)
                {
                    gameKon.theRoot.iWon = true;
                };
                gameKon.theRoot.endTheGame();
            };
        }

        public static function removeUnit(u:unitBody):void
        {
            u.terminateEvents();
            if (grid.contains(u))
            {
                grid.removeChild(u);
            };
            u = null;
        }

        public static function killEx(bul:exBody):*
        {
            if (grid2.contains(bul))
            {
                grid2.removeChild(bul);
            };
            bul = null;
        }

        public static function killTrail(bul:trailBody):*
        {
            bul.terminateEvents();
            if (grid2.contains(bul))
            {
                grid2.removeChild(bul);
                trailCount--;
            };
            bul = null;
        }

        public static function killMissile(bul:wep_missile):*
        {
            bul.terminateEvents();
            if (grid2.contains(bul))
            {
                grid2.removeChild(bul);
            };
            bul = null;
        }

        public static function killBullet(bul:wep_projectile):*
        {
            bul.terminateEvents();
            if (grid2.contains(bul))
            {
                grid2.removeChild(bul);
            };
            bul = null;
        }


    }
}//package 

