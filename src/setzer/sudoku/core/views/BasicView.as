package setzer.sudoku.core.views
{
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.infos.TextInfo;
	import setzer.sudoku.utils.ApplicationViewport;
	import setzer.sudoku.utils.StarlingFactory;

	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.Color;

	public class BasicView extends Sprite
	{
		protected var title:TextField;

		private var backgroundQ:Quad;

		public function BasicView()
		{
			ApplicationViewport.applyScale( this );

			backgroundQ = StarlingFactory.getQuad( ApplicationViewport.MAX_WIDTH_SCALED, ApplicationViewport.MAX_HEIGHT_SCALED, CurrentGameColor.GAME_BACKGROUND_1 );
			backgroundQ.color = CurrentGameColor.GAME_BACKGROUND_1;
			backgroundQ.setVertexColor( 0, CurrentGameColor.GAME_BACKGROUND_2 );
			backgroundQ.setVertexColor( 1, CurrentGameColor.GAME_BACKGROUND_1 );
			backgroundQ.setVertexColor( 3, Color.BLACK );

			addChild( backgroundQ );

			var backgroundImg:Image = StarlingFactory.getImage( AssetsLib.BACKGROUND );
			backgroundImg.alpha = .1;
			addChild( backgroundImg );

			title = StarlingFactory.getTextField( 400,"",TextInfo.SIZE_TITLE );
			title.alignPivot();
			title.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			title.y = 120;
			title.color = CurrentGameColor.BUTTON_BACKGROUND;
			title.alpha = 0;
			addChild( title )
		}

		public function updateColors():void
		{
			backgroundQ.color = CurrentGameColor.GAME_BACKGROUND_1;
			backgroundQ.setVertexColor( 0, CurrentGameColor.GAME_BACKGROUND_2 );
			backgroundQ.setVertexColor( 1, CurrentGameColor.GAME_BACKGROUND_1 );
			backgroundQ.setVertexColor( 3, Color.BLACK );
			title.color = CurrentGameColor.BUTTON_BACKGROUND;
		}
	}
}