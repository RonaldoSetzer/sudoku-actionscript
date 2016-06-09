package setzer.sudoku.core.views
{
	import setzer.sudoku.core.views.components.NumericButton;

	import starling.display.Sprite;

	public class ButtonsBarDisplay extends Sprite
	{

		public var buttons:Vector.<NumericButton>;

		[PostConstruct]
		public function postConstruct():void
		{
			x = 20;
			buttons = new Vector.<NumericButton>();
			var button:NumericButton;
			var order:Array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

			for ( var i:int = 0; i <= 9; i++ )
			{
				button = new NumericButton( order[i] );
				button.x = 44 * i + 22;
				addChild( button );
				buttons.push( button );
			}
			y = 160;
		}
	}
}