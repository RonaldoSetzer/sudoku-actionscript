package setzer.sudoku.core.events
{
	import starling.events.Event;
	
	public class GameEvent extends Event
	{
		public static const PAUSE:String = "0x00";
		public static const RESUME:String = "0x01";

		public static const UPDATE_MODEL:String = "2x00";

		public static const UPDATE_CONFIG:String = "1x00";
		public static const SAVE_SCORES:String = "1x01";

		public function GameEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}