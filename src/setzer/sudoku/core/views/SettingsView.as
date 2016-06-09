package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.core.views.components.CheckButton;
	import setzer.sudoku.utils.ApplicationViewport;

	import starling.text.TextField;

	public class SettingsView extends BasicView
	{
		public var errorCheck:CheckButton;
		public var highlightCheck:CheckButton;
		public var homeButton:BasicButton;

		[PostConstruct]
		public function postConstruct():void
		{
			title.text = "Settings";

			var errorText:TextField = new TextField( 300, 55, "Show errors:", AssetsLib.FONT, 30, CurrentGameColor.BUTTON_BACKGROUND );
			errorText.hAlign = "right";
			errorText.y = 240;
			addChild( errorText );

			var highlightText:TextField = new TextField( 300, 55, "Auto Select:", AssetsLib.FONT, 30, CurrentGameColor.BUTTON_BACKGROUND );
			highlightText.hAlign = "right";
			highlightText.y = 350;
			addChild( highlightText );


			errorCheck = new CheckButton();
			errorCheck.x = 310;
			errorCheck.y = 220;
			addChild( errorCheck );

			highlightCheck = new CheckButton();
			highlightCheck.x = 310;
			highlightCheck.y = 330;
			addChild( highlightCheck );

			homeButton = new BasicButton( "", "2" );
			homeButton.setIco( AssetsLib.ICON_HOME );
			homeButton.pivotX = homeButton.width * .5;
			homeButton.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			homeButton.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
			addChild( homeButton );
			animationIn();
		}

		public function animationIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .7 + 10;

			TweenNano.to( title, .3, { alpha: 1 } );
			TweenNano.to( homeButton, .2, { delay: .05, y: finalY, ease: Quart.easeInOut} );

		}

		public function update( gameModel:GameModel ):void
		{
			errorCheck.isSelected = gameModel.error;
			highlightCheck.isSelected = gameModel.highlight;
		}
	}
}