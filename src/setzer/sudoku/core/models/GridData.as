package setzer.sudoku.core.models
{
	import flash.utils.Dictionary;

	import setzer.sudoku.core.events.GameEvent;

	import starling.events.EventDispatcher;

	public class GridData
	{
		private var _dispatcher:EventDispatcher;

		private var _maxCols:int;
		private var _maxRows:int;

		private var _data:Vector.<Vector.<TileData>>;

		private var _allTileDataEachNumber:Dictionary;
		public var numTotalEachNumber:Dictionary;

		public var hasError:Boolean;
		public var won:Boolean;

		public function GridData()
		{
			_maxRows = 9;
			_maxCols = 9;
			_allTileDataEachNumber = new Dictionary();
			won = false;

			_data = new Vector.<Vector.<TileData>>();
			var gridLine:Vector.<TileData>;

			for ( var row:int = 0; row < maxRows; row++ )
			{
				gridLine = new Vector.<TileData>();

				for ( var col:int = 0; col < maxCols; col++ )
				{
					gridLine.push( new TileData( "0", row, col ) );
				}
				_data.push( gridLine );
			}

		}

		public function attachSudoku( sudoku:Array, listEmpty:Array ):void
		{
			var row:int;
			var col:int;
			var tile:TileData;

			for ( var i:int = 0; i < sudoku.length; i++ )
			{
				row = Math.floor( i / 9 );
				col = Math.floor( i % 9 );

				tile = _data[row][col];
				tile.isFixed = true;
				tile.result = sudoku[i].toString();

				if ( listEmpty.indexOf( i ) != -1 )
				{
					tile.isFixed = false;
				}
			}
		}

		public function setValue( value:String, selectedTile:TileData, updateGrid:Boolean = false ):void
		{
			var col:int = selectedTile.col;
			var row:int = selectedTile.row;

			var currentTile:TileData = _data[row][col];

			currentTile.value = value;
			currentTile.itemGrid.value = value;

			if ( updateGrid ) update();
		}

		public function clear():void
		{
			for ( var row:int = 0; row < maxRows; row++ )
			{
				for ( var col:int = 0; col < maxCols; col++ )
				{
					_data[row][col].value = "0";
				}
			}
			_allTileDataEachNumber = new Dictionary();
			won = false;
		}

		public function getHighlightTiles( value:String ):Vector.<TileData>
		{
			return _allTileDataEachNumber[ value ];
		}

		public function update():void
		{
			numTotalEachNumber = new Dictionary();

			hasError = false;
			won = false;

			var total:int = 9;
			var key:String;
			var tileData:TileData;

			for ( var i:int = 0; i <= total; i++ )
			{
				key = i.toString();
				_allTileDataEachNumber[ key ] = new Vector.<TileData>();
			}

			numTotalEachNumber[ "0" ] = 0;

			for ( var row:int = 0; row < maxRows; row++ )
			{
				for ( var col:int = 0; col < maxCols; col++ )
				{
					tileData = _data[row][col];
					tileData.validateError();
					hasError ||= tileData.error;
					_allTileDataEachNumber[ tileData.value ].push( tileData );
					numTotalEachNumber[ tileData.value ] = _allTileDataEachNumber[ tileData.value ].length;
				}
			}
			won = (!hasError) && (numTotalEachNumber[ "0" ] == 0);
			trace( "END LAST UPDATE: Error:[", hasError.toString(), "]; Winner[", won.toString(), "]" );

			_dispatcher.dispatchEvent( new GameEvent( GameEvent.UPDATE_MODEL ) );
		}

		public function get maxCols():int
		{
			return _maxCols;
		}

		public function get maxRows():int
		{
			return _maxRows;
		}

		public function get data():Vector.<Vector.<TileData>>
		{
			return _data;
		}

		[Dispatcher]
		public function set eventDispatcher( valueParam:EventDispatcher ):void
		{
			_dispatcher = valueParam;
		}
	}
}