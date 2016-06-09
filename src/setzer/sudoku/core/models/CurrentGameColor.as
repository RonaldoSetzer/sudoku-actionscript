package setzer.sudoku.core.models
{
	public class CurrentGameColor
	{
		public static var BUTTON_BACKGROUND:int = 0xFFFFFF;
		public static var BUTTON_TEXT:int = 0x003355;

		public static var GAME_BACKGROUND_1:int = 0x003355;
		public static var GAME_BACKGROUND_2:int = 0x0099FF;

		public static var GRID_BACKGROUND_1:int = 0x57A5FF;
		public static var GRID_BACKGROUND_2:int = 0x006AA0;
		public static var GRID_BACKGROUND_SELECTED:int = 0xFFFFFF;
		public static var GRID_TEXT_SELECTED:int = 0x003355;
		public static var GRID_TEXT_ERROR:int = 0xFF0000;
		public static var GRID_TEXT:int = 0xFFFFFF;
		public static var THUMB:int = 0x003355;
		public static var COLOR_ID:String = "blue_01";

		public static function updateColors( color:GameColorData ):void
		{
			COLOR_ID = color.colorId;

			THUMB = color.THUMB;

			BUTTON_BACKGROUND = color.BUTTON_BACKGROUND;
			BUTTON_TEXT = color.BUTTON_TEXT;

			GAME_BACKGROUND_1 = color.GAME_BACKGROUND_1;
			GAME_BACKGROUND_2 = color.GAME_BACKGROUND_2;

			GRID_BACKGROUND_1 = color.GRID_BACKGROUND_1;
			GRID_BACKGROUND_2 = color.GRID_BACKGROUND_2;
			GRID_BACKGROUND_SELECTED = color.GRID_BACKGROUND_SELECTED;
			GRID_TEXT_SELECTED = color.GRID_TEXT_SELECTED;
			GRID_TEXT_ERROR = color.GRID_TEXT_ERROR;
			GRID_TEXT = color.GRID_TEXT;
		}
	}
}
