package setzer.sudoku.core.models
{
	import flash.net.SharedObject;

	public class ExternalData
	{
		public var times:Array;
		public var error:int;
		public var highlight:int;
		public var colorId:String;

		public function ExternalData()
		{
			times = [ 0, 0, 0, 0 ];
		}

		public function updateByObject( so:SharedObject ):void
		{
			times = so.data["times"] || [ 0, 0, 0, 0];
			error = solveBoolean( so.data["error"] );
			highlight = solveBoolean( so.data["highlight"] );
			colorId = so.data["colorId"] || CurrentGameColor.COLOR_ID;
		}
		
		private function solveBoolean( n:* ):int
		{
			if ( n == null ) return 1;
			return n;
		}
		
		public function updateConfig( gameModel:GameModel ):void
		{
			error = int( gameModel.error );
			highlight = int( gameModel.highlight );
			colorId = gameModel.colorId;
		}

		public function updateScore( gameModel:GameModel ):void
		{
			if ( times[ gameModel.level ] == 0 ) times[ gameModel.level ] = gameModel.currentTime;

			times[ gameModel.level ] = Math.min( gameModel.currentTime, times[gameModel.level] );
		}
	}
}