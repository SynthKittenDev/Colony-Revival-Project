// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//playerKon

package 
{
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import flash.events.Event;

    public class playerKon 
    {

        public var AI:aiBody;
        public var idTag:String;
        public var idCounter:uint;
        public var aiOn:Boolean;
        public var CPUMODE:Boolean = false;
        public var playerName:String;
        public var team:Team;
        public var createGap:uint = 0;
        private var T:Timer = new Timer(1000);
        public var eteam:Team;
        public var cityColor:uint = 0;
        public var theBase:unitBody;
        public var POS:uint;
        public var desync:Boolean = false;
        public var hackSend:Boolean = true;
        public var race:uint;
        public var mcd:Number = 5;
        public var mce:Number = 0;
        public var stock:Array = new Array();
        public var tech:Array = new Array();
        private var r2_p:int = 50;
        private var r2_m:int = 50;
        private var r2_e:int = 50;
        private var r2_i:int = 0;
        private var aiGainArray:Array = new Array(0.7, 1, 1.6, 2.45);
        public var aiDifficulty:uint = 1;
        private var coEff:Number = 1;
        private var dataSection:Array = new Array(4);
        private var dataZone:Array = new Array(4);
        private var dataRegion:Array = new Array(4);
        private var dataPair:Array = new Array(2);
        public var p_gain:int;
        public var m_gain:int;
        public var e_gain:int;
        public var i_gain:int;
        private var incomeData:Array = new Array();
        public var builds:Array = new Array();

        public function playerKon(incomeSet:int=0):void
        {
            var th:*;
            super();
            mcd = 5;
            mce = 0;
            CPUMODE = false;
            desync = false;
            if (!gameKon.theRoot.singlePlayerMode)
            {
                T.start();
                T.addEventListener(TimerEvent.TIMER, fresh, false, 0, true);
            };
            var ju:* = 0;
            while (ju < 4)
            {
                dataZone[ju] = new Array();
                dataRegion[ju] = new Array();
                dataSection[ju] = new Array();
                th = 0;
                while (th < 5)
                {
                    dataZone[ju][th] = Math.round(((Math.random() * 100) + 1));
                    dataRegion[ju][th] = Math.round(((Math.random() * 100) - 50));
                    dataSection[ju][th] = (-(dataRegion[ju][th]) * dataZone[ju][th]);
                    th++;
                };
                ju++;
            };
            dataPair = new Array(GRP(), GRP());
            setRes(0, 50);
            setRes(1, 50);
            setRes(2, 50);
            setRes(3, 0);
            idCounter = 0;
            aiOn = false;
            AI = null;
            coEff = 1;
            race = incomeSet;
            incomeData = new Array();
            incomeData[0] = new Array(2, 4, 4, 0);
            incomeData[1] = new Array(4, 4, 2, 0);
            incomeData[2] = new Array(3, 5, 2, 0);
            incomeData[3] = new Array(2, 3, 3, 3);
            builds = new Array();
            gameKon.displayArray.push(this);
            setIncome(incomeSet);
            stock = [0, 0, 0, 0, 0, 0, 0, 0];
            tech = [0, 0, 0, 0, 0, 0, 0, 0];
        }

        public function getData(a:int):*
        {
            var data_A:int = int(((dataSection[a][dataPair[0]] / dataZone[a][dataPair[0]]) + dataRegion[a][dataPair[0]]));
            var data_B:int = int(((dataSection[a][dataPair[1]] / dataZone[a][dataPair[1]]) + dataRegion[a][dataPair[1]]));
            if (data_A == data_B)
            {
                return (data_B);
            };
            return (0);
        }

        public function get r_m():int
        {
            return (getData(0));
        }

        public function get r_p():int
        {
            return (getData(1));
        }

        public function get r_e():int
        {
            return (getData(2));
        }

        public function get r_i():int
        {
            return (getData(3));
        }

        public function setRes(res:int, val:int):void
        {
            var th:* = 0;
            while (th < 5)
            {
                dataSection[res][th] = ((val - dataRegion[res][th]) * dataZone[res][th]);
                th++;
            };
        }

        public function addRes(res:int, val:int):void
        {
            var th:* = 0;
            while (th < 5)
            {
                dataSection[res][th] = (dataSection[res][th] + (val * dataZone[res][th]));
                th++;
            };
            if (res == 3)
            {
                if (getData(3) > 200)
                {
                    setRes(3, 200);
                };
                if (getData(3) < 1)
                {
                    setRes(3, 0);
                };
            };
            if (res == 2)
            {
                if (getData(2) < 1)
                {
                    setRes(2, 0);
                };
            };
            if (res == 1)
            {
                if (getData(1) < 1)
                {
                    setRes(1, 0);
                };
            };
            if (res == 0)
            {
                if (getData(0) < 1)
                {
                    setRes(0, 0);
                };
            };
        }

        private function GRP():uint
        {
            return (Math.round((Math.random() * 4)));
        }

        private function fresh(te:TimerEvent):void
        {
            createGap = 0;
            hackSend = false;
        }

        public function killEvents():void
        {
            if (AI != null)
            {
                AI.killAi();
                AI = null;
            };
            gameKon.theStage.removeEventListener("income", income);
        }

        public function startAi(pos:uint, dif:uint, be:uint=99):void
        {
            POS = pos;
            gameKon.theStage.removeEventListener("income", income);
            AI = new aiBody(this, be);
            setRes(0, 50);
            setRes(1, 50);
            setRes(2, 50);
            setRes(3, 0);
            aiOn = true;
            switch (dif)
            {
                case 1:
                    aiDifficulty = 0;
                    break;
                case 2:
                    aiDifficulty = 1;
                    break;
                case 3:
                    aiDifficulty = 2;
                    break;
                case 4:
                    aiDifficulty = 3;
                    break;
                default:
                    aiDifficulty = 1;
            };
            coEff = aiGainArray[aiDifficulty];
        }

        public function setIncome(incomeSet:int=0):void
        {
            gameKon.theStage.addEventListener("income", income);
            race = incomeSet;
            p_gain = incomeData[incomeSet][0];
            m_gain = incomeData[incomeSet][1];
            e_gain = incomeData[incomeSet][2];
            i_gain = incomeData[incomeSet][3];
        }

        public function income(event:Event):void
        {
            if (team != null)
            {
                if (team.baseAlive)
                {
                    team.setGain();
                    addRes(3, team.gainFactor);
                    if (getData(3) > 200)
                    {
                        setRes(3, 200);
                    };
                    if (getData(3) < 1)
                    {
                        setRes(3, 0);
                    };
                    if (getData(2) < 1)
                    {
                        setRes(2, 0);
                    };
                    if (getData(1) < 1)
                    {
                        setRes(1, 0);
                    };
                    if (getData(0) < 1)
                    {
                        setRes(0, 0);
                    };
                    addRes(0, (m_gain * coEff));
                    addRes(1, (p_gain * coEff));
                    addRes(2, (e_gain * coEff));
                    addRes(3, (i_gain * coEff));
                };
            };
        }


    }
}//package 

