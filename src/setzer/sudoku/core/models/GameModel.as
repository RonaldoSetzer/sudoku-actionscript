package setzer.sudoku.core.models
{
	public class GameModel
	{
		public var selectedTileData:TileData;

		public var highlight:Boolean;
		public var error:Boolean;

		public var level:int;
		public var currentTime:int;
		public var colorId:String;
		
		public function GameModel() 
		{
			highlight = true;
			error = true;
			colorId = CurrentGameColor.COLOR_ID;
		}
		
		public function clear():void
		{
			selectedTileData = null;
		}
		
		public function updateTime( milliseconds:int ):void
		{
			currentTime = milliseconds;
		}
		
		public function updateConfig( external:ExternalData):void
		{
			highlight = Boolean( external.highlight );
			error = Boolean( external.error );
			colorId = external.colorId;
		}
	}
}