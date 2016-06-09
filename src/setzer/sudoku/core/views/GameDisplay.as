package setzer.sudoku.core.views
{
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.infos.TextInfo;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class GameDisplay extends Sprite
	{

		public var pauseButton:BasicButton;

		private var level:TextField;

		private var stopWatch:TextField;

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

			pauseButton = new BasicButton();
			pauseButton.setIco( AssetsLib.ICON_PAUSE );
			pauseButton.y = 20;
			pauseButton.x = 460 - pauseButton.width;
			addChild( pauseButton );
		}

		public function setLevel( value:int ):void
		{
			var labels:Array = [ TextInfo.VERY_EASY, TextInfo.EASY, TextInfo.NORMAL, TextInfo.HARD];
			level.text = labels[value];
		}

		public function update( mmss:String ):void
		{
			stopWatch.text = mmss;
		}
	}
}