package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.utils.ApplicationViewport;

	public class FinishPopup extends BasicView
	{
		public var retryButton:BasicButton;
		public var homeButton:BasicButton;

		[PostConstruct]
		public function postConstruct():void
		{
			title.text = "Complete";

			retryButton = new BasicButton();
			retryButton.setIco( AssetsLib.ICON_RETRY );
			retryButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			retryButton.x = ApplicationViewport.MAX_WIDTH_SCALED * .5 - retryButton.width - 3;
			addChild( retryButton );

			homeButton = new BasicButton( "QUIT" );
			homeButton.setIco( AssetsLib.ICON_HOME );
			homeButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			homeButton.x = ApplicationViewport.MAX_WIDTH_SCALED * .5 + 3;
			addChild( homeButton );

			animeIn();
		}

		public function animeIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .7 + 10;

			TweenNano.to( title, .3, { alpha:1 } );
			TweenNano.to( retryButton, .2, { delay:.05, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( homeButton, .2, { delay:.1, y:finalY, ease:Quart.easeInOut} );
		}


		public function destroy():void
		{
			removeFromParent();
		}

		public function addBestView():void
		{
			var best:BestView = new BestView();
			best.y = 180;
			addChild( best );
		}
	}
}