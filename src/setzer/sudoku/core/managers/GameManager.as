package setzer.sudoku.core.managers
{
	import setzer.sudoku.core.algorithm.GridGenerator;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.models.GridData;
	import setzer.sudoku.core.models.TileData;
	import setzer.sudoku.core.views.components.ItemGrid;

	public class GameManager
	{
		[Inject]
		public var gridGenerator:GridGenerator;

		[Inject]
		public var gameModel:GameModel;

		[Inject]
		public var gridData:GridData;

		public function selectValue( value:String ):void
		{
			var selectedTileData:TileData = gameModel.selectedTileData;

			if ( selectedTileData == null || selectedTileData.isFixed ) return;

			clearHightlightAll( selectedTileData.value );

			gridData.setValue( value, selectedTileData, true );
			selectedTileData.showError( gameModel.error );
			highlightAll( value );
		}

		private function clearHightlightAll( value:String ):void
		{
			highlightAll( value, false );
		}

		private function highlightAll( value:String, selected:Boolean = true ):void
		{
			if ( value == "0" || gameModel.highlight == false ) return;

			var highlight:Vector.<TileData> = gridData.getHighlightTiles( value );

			for ( var i:int = 0; i < highlight.length; i++ )
			{
				highlight[i].itemGrid.selected = selected;
			}
		}

		public function selectItemGrid( row:int, col:int ):void
		{
			if (row==-1 || col == -1 ) return;
			
			var tile:TileData = gridData.data[row][col];

			if ( gameModel.selectedTileData )
			{
				var selectedItemGrid:ItemGrid = gameModel.selectedTileData.itemGrid;
				selectedItemGrid.selected = false;

				highlightAll( selectedItemGrid.value, false );
			}

			gameModel.selectedTileData = tile;

			highlightAll( tile.value );

			tile.itemGrid.selected = true;
		}

		public function createGame():void
		{
			gameModel.clear();
			gridData.clear();
			gridData.attachSudoku( gridGenerator.createSudoku(), gridGenerator.getEmptyIndex( gameModel.level ) );
		}
	}
}