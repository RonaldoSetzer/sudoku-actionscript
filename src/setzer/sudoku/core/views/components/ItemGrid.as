package setzer.sudoku.core.views.components
{
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.utils.StarlingFactory;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class ItemGrid extends Sprite
	{

		private var label:TextField;

		private var _value:String;

		private var _currentBackgroundColor:int;

		private var background:Image;

		private var _selected:Boolean;

		private var _err:Boolean;

		public function ItemGrid()
		{
			_currentBackgroundColor = CurrentGameColor.GRID_BACKGROUND_1;

			background = StarlingFactory.getImage( AssetsLib.GRID_BACKGROUND_ITEM );
			background.color = _currentBackgroundColor;
			addChild( background );

			label = StarlingFactory.getTextField( 49, "0" );
			label.y = 5;
			label.fontName = AssetsLib.FONT;
			label.hAlign = "center";
			addChild( label );
		}

		public function set value( value:String ):void
		{
			_value = value;
			label.text = (value != "0") ? value : "";
			label.color = CurrentGameColor.GRID_TEXT;
		}

		public function get value():String
		{
			return _value;
		}

		public function reset():void
		{
			label.text = "0";
			selected = false;
		}

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected( value:Boolean ):void
		{
			_selected = value;
			if ( _selected )
			{
				background.color = CurrentGameColor.GRID_BACKGROUND_SELECTED;
			} else
			{
				background.color = _currentBackgroundColor;
			}
			validateTextColor();
		}

		public function set error( err:Boolean ):void
		{
			_err = err;
			validateTextColor();
		}

		private function validateTextColor():void
		{
			if ( _err ) label.color = CurrentGameColor.GRID_TEXT_ERROR; else if ( _selected ) label.color = CurrentGameColor.GRID_TEXT_SELECTED; else label.color = CurrentGameColor.GRID_TEXT;
		}

		public function set currentBackgroundColor( value:int ):void
		{
			_currentBackgroundColor = value;
			background.color = value;
		}
	}
}