package setzer.sudoku.core.models
{
	public class GameColorData
	{
		public var BUTTON_BACKGROUND:int;
		public var BUTTON_TEXT:int;

		public var GAME_BACKGROUND_1:int;
		public var GAME_BACKGROUND_2:int;

		public var GRID_BACKGROUND_1:int;
		public var GRID_BACKGROUND_2:int;
		public var GRID_BACKGROUND_SELECTED:int;
		public var GRID_TEXT_SELECTED:int;
		public var GRID_TEXT_ERROR:int;
		public var GRID_TEXT:int;

		public var THUMB:int;

		public var colorId:String;

		public function GameColorData( id:String ,colotThumb:int, btnBg:int, btnTxt:int, gBg1:int, gBg2:int, grBg1:int, grBg2:int, grBgS:int, grTxtS:int, grTxtErr:int, grTxt:int )
		{
			colorId = id;
			THUMB = colotThumb;
			BUTTON_BACKGROUND = btnBg;
			BUTTON_TEXT = btnTxt;
			GAME_BACKGROUND_1 = gBg1;
			GAME_BACKGROUND_2 = gBg2;
			GRID_BACKGROUND_1 = grBg1;
			GRID_BACKGROUND_2 = grBg2;
			GRID_BACKGROUND_SELECTED = grBgS;
			GRID_TEXT_SELECTED = grTxtS;
			GRID_TEXT_ERROR = grTxtErr;
			GRID_TEXT = grTxt;
		}
	}
}
