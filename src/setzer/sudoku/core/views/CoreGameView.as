package setzer.sudoku.core.views
{
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.models.GridData;
	import setzer.sudoku.core.models.TileData;
	import setzer.sudoku.core.views.components.ItemGrid;

	import starling.display.Quad;
	import starling.display.Sprite;

	public class CoreGameView extends Sprite
	{

		[PostConstruct]
		public function postConstruct():void
		{
			x = 20;
			y = 200;

			var bg:Quad = new Quad( 9 * 49 + 5, 9 * 49 + 5, 0x000000 );
			bg.x = -5;
			bg.y = -5;
			bg.alpha = .4;
			addChild( bg );

		}

		public function create( gridData:GridData ):void
		{
			var itemGrid:ItemGrid;
			var tile:TileData;

			var colors:Array = [ CurrentGameColor.GRID_BACKGROUND_1, CurrentGameColor.GRID_BACKGROUND_2 ];
			var colorIndex:int;

			for ( var row:int = 0; row < gridData.maxRows; row++ )
			{
				for ( var col:int = 0; col < gridData.maxCols; col++ )
				{
					tile = gridData.data[row][col];
					colorIndex = (Math.floor( row / 3 ) + Math.floor( col / 3 )) % 2;

					itemGrid = new ItemGrid();
					itemGrid.currentBackgroundColor = colors[colorIndex];
					itemGrid.y = row * 49;
					itemGrid.x = col * 49;
					itemGrid.selected = false;
					itemGrid.value = "0";
					addChild( itemGrid );

					gridData.data[row][col].itemGrid = itemGrid;

					if ( tile.isFixed ) gridData.setValue( tile.result, tile );
				}
			}
		}

		public function destroy():void
		{
			removeChildren();
		}
	}
}