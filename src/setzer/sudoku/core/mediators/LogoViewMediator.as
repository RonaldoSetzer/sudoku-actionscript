package setzer.sudoku.core.mediators
{
	import flash.utils.setTimeout;

	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.views.LogoView;

	import starling.events.Event;

	public class LogoViewMediator extends AbstractMediator
	{
		public var _view:LogoView;

		[ViewAdded]
		public function viewAdded( view:LogoView ):void
		{
			_view = view;
			_view.starCountToNextView();
			eventMap.addMap(_view,Event.COMPLETE,timeCallView);
		}

		private function timeCallView( e:Event = null):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
		}

		[ViewRemoved]
		public function viewRemoved( view:LogoView ):void
		{
			_view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}