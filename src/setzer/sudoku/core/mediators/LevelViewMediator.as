package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.views.LevelView;
	import setzer.sudoku.core.views.components.BasicButton;

	import starling.events.Event;

	public class LevelViewMediator extends AbstractMediator
	{
		[Inject]
		public var gameModel:GameModel;

		private var view:LevelView;

		[ViewAdded]
		public function viewAdded( view:LevelView ):void
		{
			this.view = view;

			for ( var i:int = 0; i < view.buttons.length; i++ )
			{
				eventMap.addMap( view.buttons[i], Event.TRIGGERED, onStartHandler );
			}
			view.animaIn();
		}

		private function onStartHandler( e:Event ):void
		{
			var index:int = Math.max( view.buttons.indexOf( BasicButton( e.currentTarget ) ), 0 );

			gameModel.level = index;

			view.destroy();
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_GAME ) );
		}

		[ViewRemoved]
		public function viewRemoved( view:LevelView ):void
		{
			view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}