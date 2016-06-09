package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import flash.globalization.DateTimeFormatter;

	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.infos.TextInfo;
	import setzer.sudoku.utils.StarlingFactory;

	import starling.display.Sprite;
	import starling.text.TextField;

	public class BestView extends Sprite
	{
		private var dtf:DateTimeFormatter;
		private var levelsLabel:Vector.<TextField>;
		private var levelsValue:Vector.<TextField>;

		[PostConstruct]
		public function postConstruct():void
		{
			var levelLabels:Array = [ TextInfo.VERY_EASY + ":", TextInfo.EASY + ":", TextInfo.NORMAL + ":",
			                          TextInfo.HARD + ":"
			];

			levelsLabel = new Vector.<TextField>();
			levelsValue = new Vector.<TextField>();

			var txtLabel:TextField;
			var txtValue:TextField;

			for ( var i:int = 0; i < levelLabels.length; i++ )
			{
				txtLabel = StarlingFactory.getTextField( 280, levelLabels[i] );
				txtLabel.color = CurrentGameColor.BUTTON_BACKGROUND;
				txtLabel.y = i * 70;
				txtLabel.hAlign = "right";

				txtValue = StarlingFactory.getTextField( 150, "--:--" );
				txtValue.color = CurrentGameColor.BUTTON_BACKGROUND;
				txtValue.hAlign = "left";
				txtValue.y = i * 70;
				txtValue.x = 300;

				txtLabel.alpha = 0;
				txtValue.alpha = 0;

				levelsLabel.push( txtLabel );
				levelsValue.push( txtValue );

				addChild( txtLabel );
				addChild( txtValue );
			}
		}

		public function update( times:Array ):void
		{

			dtf = new DateTimeFormatter( "en-US" );
			dtf.setDateTimePattern( "mm:ss" );

			for ( var i:int = 0; i < times.length; i++ )
			{
				if ( times[i] == 0 ) continue;

				levelsValue[i].text = dtf.format( new Date( times[i] ) );
			}
		}

		public function animationIn():void
		{
			for ( var i:int = 0; i < levelsLabel.length; i++ )
			{
				TweenNano.to( levelsLabel[i], .2, { delay: .05 * i, alpha: 1, ease: Quart.easeOut} );
				TweenNano.to( levelsValue[i], .2, { delay: .05 * i, alpha: 1, ease: Quart.easeOut} );
			}
		}
	}
}
