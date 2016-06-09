package setzer.sudoku.core.models
{
	public class StateModel
	{
		public static const STATE_HOME:String = "home";
		public static const STATE_GAME:String = "game";
		public static const STATE_SETTINGS:String = "settings";
		public static const STATE_HELP:String = "help";
		public static const STATE_LEVEL:String = "level";
		public static const STATE_COLOR:String = "color";

		public var state:String;

		public var popup:Boolean;

		public function hasPopupOpened():Boolean
		{
			return popup;
		}
	}
}