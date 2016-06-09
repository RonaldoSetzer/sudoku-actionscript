package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.models.StateModel;
	import setzer.sudoku.core.views.FinishPopup;
	
	import starling.events.Event;

	public class FinishPopupMediator extends AbstractMediator
	{
		[Inject]
		public var stateModel:StateModel;

		private var view:FinishPopup;

		[ViewAdded]
		public function viewAdded( view:FinishPopup ):void
		{
			stateModel.popup = true;

			_dispatcher.dispatchEvent( new GameEvent( GameEvent.PAUSE ) );

			_dispatcher.dispatchEvent( new GameEvent( GameEvent.SAVE_SCORES ) );

			this.view = view;
			this.view.addBestView();

			eventMap.addMap( view.retryButton, Event.TRIGGERED, onNewGameHandler );
			eventMap.addMap( view.homeButton, Event.TRIGGERED, onQuitHandler );

		}

		private function onQuitHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
		}

		private function onNewGameHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_GAME ) );
			view.destroy();
		}

		[ViewRemoved]
		public function viewRemoved( view:FinishPopup ):void
		{
			stateModel.popup = false;

			view = null;

			eventMap.removeAllMappedEvents();
		}
	}
}