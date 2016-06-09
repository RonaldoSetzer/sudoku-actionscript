package setzer.sudoku.core.mediators
{
	import flash.globalization.DateTimeFormatter;
	
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.models.StateModel;
	import setzer.sudoku.core.views.PausePopup;
	
	import starling.events.Event;

	public class PausePopupMediator extends AbstractMediator
	{
		[Inject]
		public var stateModel:StateModel;

		[Inject]
		public var gameModel:GameModel;

		private var view:PausePopup;

		[ViewAdded]
		public function viewAdded( view:PausePopup ):void
		{
			this.view = view;
			this.view.setLevel( gameModel.level );
			var dtf:DateTimeFormatter;

			dtf = new DateTimeFormatter( "en-US" );
			dtf.setDateTimePattern( "mm:ss" );

			this.view.update( dtf.format( new Date( gameModel.currentTime ) ) );

			stateModel.popup = true;

			_dispatcher.dispatchEvent( new GameEvent( GameEvent.PAUSE ) );

			eventMap.addMap( view.retryButton, Event.TRIGGERED, onRetryHandler );
			eventMap.addMap( view.resumeButton, Event.TRIGGERED, onResumeHandler );
			eventMap.addMap( view.homeButton, Event.TRIGGERED, onQuitHandler );
		}

		private function onRetryHandler( e:Event ):void
		{
			view.destroy();
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_GAME ) );
		}

		private function onQuitHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
		}

		private function onResumeHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new GameEvent( GameEvent.RESUME ) );
			view.destroy();
		}

		[ViewRemoved]
		public function viewRemoved( view:PausePopup ):void
		{
			stateModel.popup = false;

			view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}