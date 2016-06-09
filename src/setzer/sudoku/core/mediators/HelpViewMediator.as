package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.models.StateModel;
	import setzer.sudoku.core.views.HelpView;
	
	import starling.events.Event;

	public class HelpViewMediator extends AbstractMediator
	{
		[Inject]
		public var stateModel:StateModel;
		
		private var view:HelpView;
		
		[ViewAdded]
		public function viewAdded( view:HelpView ):void
		{
			stateModel.state = StateModel.STATE_HELP;
			this.view = view;

			eventMap.addMap( view.homeButton, Event.TRIGGERED, backHandler );
		}

		private function backHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
		}
		
		[ViewRemoved]
		public function viewRemoved( view:HelpView ):void
		{
			view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}