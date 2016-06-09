package setzer.sudoku.core.views
{
	import setzer.sudoku.utils.ApplicationViewport;

	public class GameView extends BasicView
	{
		private var _gameDisplay:GameDisplay;

		private var _numbersDisplay:ButtonsBarDisplay
		
		private var _coreGameView:CoreGameView;
		
		[PostConstruct]
		public function postConstruct():void
		{
			ApplicationViewport.applyScale( this );


			_coreGameView = new CoreGameView();
			_gameDisplay = new GameDisplay();
			_numbersDisplay = new ButtonsBarDisplay();

			super.addChild( _coreGameView );
			super.addChild( _gameDisplay );
			super.addChild( _numbersDisplay );
		}
		
		public function destroy():void
		{
			_coreGameView.removeChildren();
		}

		public function get coreGameView():CoreGameView
		{
			return _coreGameView;
		}
	}
}