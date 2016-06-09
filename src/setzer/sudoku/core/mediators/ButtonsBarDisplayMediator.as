package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.managers.GameManager;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.models.GridData;
	import setzer.sudoku.core.views.ButtonsBarDisplay;
	import setzer.sudoku.core.views.components.NumericButton;

	import starling.events.Event;

	public class ButtonsBarDisplayMediator extends AbstractMediator
	{
		public var view:ButtonsBarDisplay;

		[Inject]
		public var gridData:GridData;

		[Inject]
		public var gameManager:GameManager;

		[Inject]
		public var gameModel:GameModel;

		[ViewAdded]
		public function viewAdded( view:ButtonsBarDisplay ):void
		{
			this.view = view;

			for ( var i:int = 0; i < view.buttons.length; i++ )
			{
				eventMap.addMap( view.buttons[i], Event.TRIGGERED, onClick );
			}

			/*setupVisibility();*/
		}

		[EventHandler(event="GameEvent.UPDATE_MODEL")]
		public function setupVisibility( e:GameEvent = null ):void
		{
			if ( view == null ) return;
			for ( var i:int = 1; i <= 9; i++ )
			{
				view.buttons[i - 1].visible = (gridData.numTotalEachNumber[i.toString()] != 9);
			}

			if ( gridData.won ) finishGame();
		}

		private function onClick( e:Event ):void
		{
			var numButton:NumericButton = NumericButton( e.currentTarget );

			gameManager.selectValue( numButton.value );
		}

		private function finishGame():void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_POPUP_FINISH ) );
		}

		[ViewRemoved]
		public function viewRemoved( view:ButtonsBarDisplay ):void
		{
			view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}