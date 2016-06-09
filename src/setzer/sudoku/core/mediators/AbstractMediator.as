package setzer.sudoku.core.mediators
{
	import com.creativebottle.starlingmvc.events.EventMap;
	
	import starling.events.EventDispatcher;

	public class AbstractMediator
	{
		protected var _dispatcher:EventDispatcher;
		protected var eventMap:EventMap = new EventMap();
		
		[Dispatcher]
		public function set eventDispatcher(valueParam:EventDispatcher):void
		{
			_dispatcher = valueParam;
		}
	}
}