package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.utils.ApplicationViewport;

	public class LevelView extends BasicView
	{
		public var buttons:Vector.<BasicButton>;

		[PostConstruct]
		public function postConstruct():void
		{
			title.text = "Level Select";
			title.alpha = 0;

			buttons = new Vector.<BasicButton>();
			var button:BasicButton;
			var labels:Array = [ "Very Easy", "Easy", "Normal", "Hard" ];

			var buttonWidth:int = 100 + 5;
			var initX:int = ( ApplicationViewport.MAX_WIDTH_SCALED - ( 4 * buttonWidth )) * .5;

			for ( var i:int = 0; i < 4; i++ )
			{
				button = new BasicButton( labels[i] );
				button.x = initX + buttonWidth * i;
				button.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
				addChild( button );
				buttons.push( button )
			}

			var best:BestView = new BestView();
			best.y = 180;
			addChild( best )
		}

		public function animaIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .7 + 10;

			TweenNano.to( title, .3, { alpha:1 } );
			TweenNano.to( buttons[0], .2, { delay:.05, y:finalY, ease:Quart.easeInOut } );
			TweenNano.to( buttons[1], .2, { delay:.1, y:finalY, ease:Quart.easeInOut } );
			TweenNano.to( buttons[2], .2, { delay:.15, y:finalY, ease:Quart.easeInOut } );
			TweenNano.to( buttons[3], .2, { delay:.2, y:finalY, ease:Quart.easeInOut } );
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}