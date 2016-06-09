package setzer.sudoku.core.events
{
	import starling.events.Event;
	
	public class FlowEvent extends Event
	{
		public static const SHOW_VIEW_LOGO:String = "0x0";
		public static const SHOW_VIEW_HOME:String = "0x1";
		public static const SHOW_VIEW_GAME:String = "0x2";

		public static const SHOW_VIEW_LEVEL:String = "1x2";
		public static const SHOW_VIEW_HELP:String = "0x4";
		public static const SHOW_VIEW_SETTINGS:String = "0x3";
		public static const SHOW_VIEW_COLOR:String = "1x1";

		public static const SHOW_POPUP_PAUSE:String = "1x3";
		public static const SHOW_POPUP_FINISH:String = "1x4";
		
		public static const REMOVE_ALL_POPUPS:String = "2x0";
		public static const ANIMATION_OUT_COMPLETE:String = "3x1";
		
		public function FlowEvent(type:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
		}
	}
}