package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.utils.ApplicationViewport;

	import starling.text.TextField;

	public class PausePopup extends BasicView
	{
		public var resumeButton:BasicButton;
		public var homeButton:BasicButton;
		public var retryButton:BasicButton;
		public var level:TextField;
		public var stopWatch:TextField;

		[PostConstruct]
		public function postConstruct():void
		{

			level = new TextField( 400, 50, "Very Easy" );
			level.y = 20;
			level.x = 20;
			level.fontName = AssetsLib.FONT;
			level.color = CurrentGameColor.BUTTON_BACKGROUND;
			level.fontSize = 45;
			level.hAlign = "left";
			addChild( level );

			stopWatch = new TextField( 200, 65, "0:00" );
			stopWatch.y = 70;
			stopWatch.x = 20;
			stopWatch.color = CurrentGameColor.BUTTON_BACKGROUND;
			stopWatch.fontName = AssetsLib.FONT;
			stopWatch.fontSize = 50;
			stopWatch.hAlign = "left";
			addChild( stopWatch );

			resumeButton = new BasicButton( "", "2" );
			resumeButton.setIco( AssetsLib.ICON_RESUME );
			resumeButton.pivotX = resumeButton.width * .5;
			resumeButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			resumeButton.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			addChild( resumeButton );

			retryButton = new BasicButton();
			retryButton.setIco( AssetsLib.ICON_RETRY );
			retryButton.pivotX = retryButton.width * .5;
			retryButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			retryButton.x = resumeButton.x - (resumeButton.width * .5 + retryButton.width * .5 + 3);
			addChild( retryButton );

			homeButton = new BasicButton( "QUIT" );
			homeButton.setIco( AssetsLib.ICON_HOME );
			homeButton.pivotX = homeButton.width * .5;
			homeButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			homeButton.x = resumeButton.x + (resumeButton.width * .5 + homeButton.width * .5 + 3);
			addChild( homeButton );


			var best:BestView = new BestView();
			best.y = 180;
			addChild( best );

			animationIn();
		}

		public function animationIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .7 + 10;

			TweenNano.to( retryButton, .2, { delay: .05, y: finalY, ease: Quart.easeInOut} );
			TweenNano.to( resumeButton, .2, { delay: .1, y: finalY, ease: Quart.easeInOut} );
			TweenNano.to( homeButton, .2, { delay: .15, y: finalY, ease: Quart.easeInOut} );

		}

		public function destroy():void
		{
			removeFromParent();
		}

		public function setLevel( value:int ):void
		{
			var labels:Array = [ "Very Easy", "Easy", "Normal", "Hard"];
			level.text = labels[value];
		}

		public function update( mmss:String ):void
		{
			stopWatch.text = mmss;
		}
	}
}