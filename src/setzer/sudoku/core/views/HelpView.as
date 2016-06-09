package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.utils.ApplicationViewport;
	import setzer.sudoku.utils.TextLib;

	import starling.text.TextField;

	public class HelpView extends BasicView
	{

		public var homeButton:BasicButton;

		[PostConstruct]
		public function postConstruct():void
		{
			title.text = "How to Play";

			var howtoplay:TextField = new TextField( 460, 460, TextLib.HOW_TO_PLAY, AssetsLib.FONT, 22, CurrentGameColor.BUTTON_BACKGROUND );
			howtoplay.hAlign = "center";
			howtoplay.y = 100;
			howtoplay.x = 10;
			addChild( howtoplay );

			homeButton = new BasicButton( "", "2" );
			homeButton.setIco( AssetsLib.ICON_HOME );
			homeButton.pivotX = homeButton.width * .5;
			homeButton.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			homeButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			addChild( homeButton );
			animeIn();
		}

		public function animeIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .7 + 10;
			TweenNano.to( title, .3, { alpha: 1 } );
			TweenNano.to( homeButton, .2, { delay: .05, y: finalY, ease: Quart.easeInOut} );
		}
	}
}