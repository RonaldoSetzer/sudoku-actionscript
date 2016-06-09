package setzer.sudoku.core.mediators
{
	import flash.globalization.DateTimeFormatter;
	import flash.utils.getTimer;

	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.views.GameDisplay;

	import starling.events.Event;

	public class GameDisplayMediator extends AbstractMediator
	{
		[Inject]
		public var gameModel:GameModel;

		public var _view:GameDisplay;

		private var currentTime:int;
		private var milliseconds:int;
		private var dtf:DateTimeFormatter;

		[ViewAdded]
		public function viewAdded( view:GameDisplay ):void
		{
			_view = view;
			_view.setLevel( gameModel.level );
			dtf = new DateTimeFormatter( "en-US" );
			dtf.setDateTimePattern( "mm:ss" );

			milliseconds = 0;
			currentTime = getTimer();
			eventMap.addMap( _view.pauseButton, Event.TRIGGERED, onPauseButtonHandler );
			eventMap.addMap( _view, Event.ENTER_FRAME, onEnterFrameHandler );
		}

		private function onEnterFrameHandler( e:Event ):void
		{
			milliseconds += getTimer() - currentTime;
			currentTime = getTimer();

			gameModel.updateTime( milliseconds );

			_view.update( dtf.format( new Date( milliseconds ) ) );
		}

		private function onPauseButtonHandler( e:Event ):void
		{
			eventMap.removeMap( _view, Event.ENTER_FRAME, onEnterFrameHandler );
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_POPUP_PAUSE ) );
		}

		[EventHandler(event="GameEvent.RESUME")]
		public function resume( e:GameEvent ):void
		{
			currentTime = getTimer();
			eventMap.addMap( _view, Event.ENTER_FRAME, onEnterFrameHandler );
		}

		[EventHandler(event="GameEvent.PAUSE")]
		public function pause( e:GameEvent ):void
		{
			eventMap.removeMap( _view, Event.ENTER_FRAME, onEnterFrameHandler );
		}

		[ViewRemoved]
		public function viewRemoved( view:GameDisplay ):void
		{
			_view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}