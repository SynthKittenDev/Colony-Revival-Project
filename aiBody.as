// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//aiBody

package 
{
    import flash.display.Sprite;
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class aiBody extends Sprite 
    {

        public var buildList:Array;
        private var timerObject:Timer;
        private var stratTimer:Timer;
        private var canDoBuild:Array;
        private var orderDone:Boolean = false;
        public var AiStrategy:aiStrategy;
        public var p:playerKon;
        private var be:uint;

        public function aiBody(player:playerKon, be:uint)
        {
            p = player;
            this.be = be;
            buildList = new Array();
            if (gameKon.theRoot.singlePlayerMode)
            {
                startAiFunctions();
            }
            else
            {
                timerObject = new Timer(6000);
                timerObject.addEventListener(TimerEvent.TIMER, beginAiMover, false, 0, true);
                timerObject.start();
            };
        }

        private function startAiFunctions():void
        {
            var vars2:Object;
            timerObject = new Timer(2000);
            timerObject.addEventListener(TimerEvent.TIMER, executeAi, false, 0, true);
            timerObject.start();
            stratTimer = new Timer(5000);
            stratTimer.addEventListener(TimerEvent.TIMER, executeStrategy, false, 0, true);
            stratTimer.start();
            AiStrategy = new aiStrategy(buildList, this.be, p);
            p.setIncome(aiTactic.income[AiStrategy.randomNum]);
            if (!gameKon.theRoot.singlePlayerMode)
            {
                vars2 = new Object();
                vars2.race = aiTactic.income[AiStrategy.randomNum];
                vars2.pos = p.POS;
                mpKon.sendOff(vars2, false, "updateIncome");
            };
        }

        private function beginAiMover(e:TimerEvent):void
        {
            timerObject.removeEventListener(TimerEvent.TIMER, beginAiMover);
            startAiFunctions();
        }

        private function executeStrategy(event:TimerEvent):void
        {
            buildList = new Array();
            AiStrategy.work(p.eteam.all, buildList, p);
        }

        public function killAi():void
        {
            if (timerObject != null)
            {
                timerObject.removeEventListener(TimerEvent.TIMER, executeAi);
            };
            if (stratTimer != null)
            {
                stratTimer.removeEventListener(TimerEvent.TIMER, executeStrategy);
            };
            AiStrategy = null;
        }

        internal function executeAi(event:TimerEvent):void
        {
            var i2:*;
            var notDone:*;
            var j2:*;
            var oB:Object;
            var vars:Object;
            var sen:Boolean;
            for (i2 in buildList)
            {
                if (buildList[i2] != null)
                {
                    if (buildList[i2].onHold == false)
                    {
                        orderDone = false;
                        while (orderDone == false)
                        {
                            checkAval(buildList[i2].array[0]);
                            if (canDoBuild.length > 0)
                            {
                                orderDone = true;
                                notDone = true;
                                for (j2 in canDoBuild)
                                {
                                    if (notDone)
                                    {
                                        if (checkBuild(canDoBuild[j2]))
                                        {
                                            notDone = false;
                                            if (checkResource(buildList[i2].array[0]))
                                            {
                                                oB = optionData.LIST[buildList[i2].array[0]];
                                                canDoBuild[j2].aiCheck = buildList[i2];
                                                if (((!(oB.buildOrder == null)) && (!(gameKon.theRoot.singlePlayerMode))))
                                                {
                                                    vars = new Object();
                                                    vars.auto = false;
                                                    vars.cancelOrder = false;
                                                    vars.pos = p.POS;
                                                    vars.buildId = buildList[i2].array[0];
                                                    vars.building = canDoBuild[j2].baseId;
                                                    sen = true;
                                                }
                                                else
                                                {
                                                    vars = new Object();
                                                    sen = false;
                                                };
                                                if (buildList[i2].tech)
                                                {
                                                    canDoBuild[j2].techSend = AiStrategy;
                                                };
                                                gameKon.doOption(oB, false, false, p, canDoBuild[j2], false, false, vars, sen);
                                                buildList[i2].onHold = true;
                                                if (buildList[i2].array.length == 1)
                                                {
                                                    buildList[i2].limit--;
                                                    if (buildList[i2].limit == 0)
                                                    {
                                                        buildList.splice(i2, 1);
                                                    };
                                                }
                                                else
                                                {
                                                    buildList[i2].array.splice(0, 1);
                                                };
                                            };
                                        };
                                    };
                                };
                            }
                            else
                            {
                                buildList.splice(i2, 1);
                                orderDone = true;
                            };
                        };
                    };
                };
            };
        }

        internal function findPath(A:aiOrder, spliceNum:uint):*
        {
            var i:*;
            var j:*;
            var k:*;
            var a:* = A.array[0];
            var goSearch:Boolean = true;
            for (i in buildingData.LIST)
            {
                if (goSearch)
                {
                    for (j in buildingData.LIST[i].options)
                    {
                        if (buildingData.LIST[i].options[j] == a)
                        {
                            if (i == 0)
                            {
                                goSearch = false;
                            }
                            else
                            {
                                for (k in optionData.LIST)
                                {
                                    if (optionData.LIST[k].buildOrder == i)
                                    {
                                        goSearch = false;
                                        A.array.reverse();
                                        A.array.push(k);
                                        A.array.reverse();
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

        internal function checkAval(a:uint):*
        {
            var i:*;
            var j:*;
            canDoBuild = new Array();
            for (i in p.builds)
            {
                for (j in p.builds[i].INFO.options)
                {
                    if (p.builds[i].INFO.options[j] == a)
                    {
                        canDoBuild.push(p.builds[i]);
                    };
                };
            };
        }

        internal function checkBuild(b:baseBuilding):*
        {
            if (b.working == false)
            {
                return (true);
            };
        }

        internal function checkResource(a:uint):*
        {
            if ((((optionData.LIST[a][0] <= p.r_m) && (optionData.LIST[a][1] <= p.r_p)) && (optionData.LIST[a][2] <= p.r_e)))
            {
                if (optionData.LIST[a][4] <= p.r_i)
                {
                    return (true);
                };
            };
        }


    }
}//package 

