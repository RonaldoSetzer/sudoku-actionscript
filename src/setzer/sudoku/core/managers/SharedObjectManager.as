package setzer.sudoku.core.managers
{
	import flash.net.SharedObject;

	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.models.ExternalData;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.patterns.ColorFactory;
	import setzer.sudoku.utils.SudokuValues;

	public class SharedObjectManager
	{
		[Inject]
		public var externalData:ExternalData;

		[Inject]
		public var colorFactory:ColorFactory;

		[Inject]
		public var gameModel:GameModel;

		[PostConstruct]
		public function postConstruct():void
		{
			getExternal();
		}

		[EventHandler(event="GameEvent.SAVE_SCORES")]
		public function saveScore( e:GameEvent ):void
		{
			var so:SharedObject = SharedObject.getLocal( SudokuValues.SHARED_OBJECT_NAME );
			externalData.updateScore( gameModel );

			var times:Array = externalData.times;

			if ( so.data.times )
			{
				trace( "Times: " + so.data.times.join( "-" ) + " to " + times.join( "-" ) );
			}

			so.data.times = times;
			so.flush();
			so.close();
		}

		[EventHandler(event="GameEvent.UPDATE_CONFIG")]
		public function updateConfig( e:GameEvent ):void
		{
			var so:SharedObject = SharedObject.getLocal( SudokuValues.SHARED_OBJECT_NAME );
			externalData.updateConfig( gameModel );

			var error:int = externalData.error;
			var highlight:int = externalData.highlight;
			var colorId:String = externalData.colorId;


			if ( so.data.error )
			{
				trace( "error: " + so.data.error + " to " + error );
			}

			if ( so.data.highlight )
			{
				trace( "highlight: " + so.data.highlight + " to " + highlight );
			}

			if ( so.data.colorId )
			{
				trace( "colorId: " + so.data.colorId + " to " + colorId );
			}

			so.data.error = error;
			so.data.highlight = highlight;
			so.data.colorId = colorId;
			so.flush();
			so.close();
		}

		public function getExternal():void
		{
			var so:SharedObject = SharedObject.getLocal( SudokuValues.SHARED_OBJECT_NAME );

			if ( so.data.times || so.data.error || so.data.highlight || so.data.colorId )
			{
				externalData.updateByObject( so );
				gameModel.updateConfig( externalData );

				trace( "times: " + externalData.times.join( "-" ) );
				trace( "error: " + externalData.error.toString() );
				trace( "highlight: " + externalData.highlight.toString() );
				trace( "colorId: " + externalData.colorId.toString() );

				CurrentGameColor.updateColors( colorFactory.getGameColorDataByID( so.data.colorId ) );
			}

			so.close();
		}
	}
}