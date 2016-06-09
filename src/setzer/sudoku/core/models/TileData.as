package setzer.sudoku.core.models
{
	import setzer.sudoku.core.views.components.ItemGrid;

	public class TileData
	{

		private var _row:int;

		private var _col:int;

		public var value:String;

		public var result:String;

		public var itemGrid:ItemGrid;

		public var isFixed:Boolean;

		public var error:Boolean;

		public function TileData( value:String, row:int = -1, col:int = -1 )
		{
			this.value = value;
			_col = col;
			_row = row;
		}

		public function validateError():void
		{
			error = !( value == result) && (value != "0");
		}

		public function showError( showError:Boolean ):void
		{
			if ( itemGrid && showError )
				itemGrid.error = error;
		}

		public function get row():int
		{
			return _row;
		}

		public function get col():int
		{
			return _col;
		}
	}
}