package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.managers.GameManager;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.models.GridData;
	import setzer.sudoku.core.views.CoreGameView;
	import setzer.sudoku.core.views.GameView;
	import setzer.sudoku.utils.ApplicationViewport;

	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class CoreGameViewMediator extends AbstractMediator
	{
		private var _view:CoreGameView;

		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var gridData:GridData;

		[Inject]
		[Inject]
		public var gameManager:GameManager;

		[ViewAdded]
		public function viewAdded( view:CoreGameView ):void
		{
			gameManager.createGame();
			_view = view;
			_view.create( gridData );
			gridData.update();

			eventMap.addMap( _view, TouchEvent.TOUCH, onSelectItem );
		}

		private function onSelectItem( e:TouchEvent ):void
		{
			var touch:Touch = e.getTouch( _view );

			if ( touch != null )
			{
				if ( touch.phase == TouchPhase.BEGAN && e.touches.length > 0 )
				{
					var tileHeight:Number = 49 * ApplicationViewport.SCALE;
					var col:int = Math.floor( (e.touches[0].globalX - _view.x * ApplicationViewport.SCALE) / tileHeight );
					var row:int = Math.floor( (e.touches[0].globalY - _view.y * ApplicationViewport.SCALE) / tileHeight );

					gameManager.selectItemGrid( row, col );
				}
			}
		}

		[ViewRemoved]
		public function viewRemoved( view:GameView ):void
		{
			_view.destroy();
			_view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}