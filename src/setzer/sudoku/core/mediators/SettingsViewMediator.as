package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.models.StateModel;
	import setzer.sudoku.core.views.SettingsView;

	import starling.events.Event;

	public class SettingsViewMediator extends AbstractMediator
	{
		[Inject]
		public var stateModel:StateModel;

		[Inject]
		public var gameModel:GameModel;

		private var view:SettingsView;

		[ViewAdded]
		public function viewAdded( view:SettingsView ):void
		{
			stateModel.state = StateModel.STATE_SETTINGS;
			this.view = view;

			view.update( gameModel );

			eventMap.addMap( view.errorCheck, Event.TRIGGERED, swapError );
			eventMap.addMap( view.highlightCheck, Event.TRIGGERED, swapHighlight );
			eventMap.addMap( view.homeButton, Event.TRIGGERED, backHandler );
		}

		private function backHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
		}

		private function swapError( e:Event ):void
		{
			e.stopImmediatePropagation();
			view.errorCheck.isSelected = !view.errorCheck.isSelected;
			gameModel.error = view.errorCheck.isSelected;
			_dispatcher.dispatchEvent( new GameEvent( GameEvent.UPDATE_CONFIG ) );
		}

		private function swapHighlight( e:Event ):void
		{
			e.stopImmediatePropagation();
			view.highlightCheck.isSelected = !view.highlightCheck.isSelected;
			gameModel.highlight = view.highlightCheck.isSelected;
			_dispatcher.dispatchEvent( new GameEvent( GameEvent.UPDATE_CONFIG ) );
		}

		[ViewRemoved]
		public function viewRemoved( view:SettingsView ):void
		{
			view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}