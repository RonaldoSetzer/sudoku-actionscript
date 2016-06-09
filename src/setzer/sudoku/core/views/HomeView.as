package setzer.sudoku.core.views
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import flash.display.BitmapData;

	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.views.components.BasicButton;
	import setzer.sudoku.utils.ApplicationViewport;

	import starling.display.Button;
	import starling.display.Image;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class HomeView extends BasicView
	{
		public var startButton:Button;

		public var moreGamesButton:BasicButton;
		public var colorButton:BasicButton;
		public var settingsButton:BasicButton;
		public var helpButton:BasicButton;

		private var tap:TextField;
		private var logoGame:Image;
		private var timeline:TimelineLite;

		[PostConstruct]
		public function postConstruct():void
		{
			setupImages();
			setupButtons();
		}

		private function setupImages():void
		{
			logoGame = new Image( Assets.getTexture( AssetsLib.SUDOKU_LOGO ) );
			logoGame.alignPivot();
			logoGame.y = 120;
			logoGame.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			logoGame.color = CurrentGameColor.BUTTON_BACKGROUND;
			addChild( logoGame );

			tap = new TextField( 400, 100, "Tap to Start!", AssetsLib.FONT );
			tap.alignPivot();
			tap.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			tap.y = 400;
			tap.fontSize = 30;
			tap.color = CurrentGameColor.BUTTON_BACKGROUND;
			addChild( tap );

			timeline = new TimelineLite( {onComplete:tweenBack} );
			timeline.append( new TweenLite( tap, .5, { scaleX:1.2, scaleY:1.2} ) );
			timeline.append( new TweenLite( tap, .5, { scaleX:1, scaleY:1} ) );
			timeline.stop();
		}

		private function tweenBack():void
		{
			timeline.restart();
		}

		private function setupButtons():void
		{
			var texture:Texture = Texture.fromBitmapData( new BitmapData( ApplicationViewport.MAX_WIDTH_SCALED, ApplicationViewport.MAX_HEIGHT_SCALED * .7, false, 0xFF0000 ) );
			startButton = new Button( texture );
			startButton.alpha = 0;
			startButton.visible = false;
			addChild( startButton );

			moreGamesButton = new BasicButton();
			moreGamesButton.setIco( AssetsLib.ICON_SETZER );

			helpButton = new BasicButton();
			helpButton.setIco( AssetsLib.ICON_HELP );

			settingsButton = new BasicButton();
			settingsButton.setIco( AssetsLib.ICON_CONFIG );

			colorButton = new BasicButton();
			colorButton.setIco( AssetsLib.ICON_COLOR );

			var buttons:Vector.<BasicButton> = new Vector.<BasicButton>();
			buttons.push( moreGamesButton );
			buttons.push( helpButton );
			buttons.push( settingsButton );
			buttons.push( colorButton );

			var buttonWidth:int = 100 + 5;
			var initX:int = ( ApplicationViewport.MAX_WIDTH_SCALED - ( buttons.length * buttonWidth )) * .5;

			for ( var i:int = 0; i < buttons.length; i++ )
			{
				buttons[i].x = initX + buttonWidth * i;
				buttons[i].y = ApplicationViewport.MAX_HEIGHT_SCALED + 10;
				addChild( buttons[i] );
			}
		}


		public function animaIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .7 + 10;

			TweenNano.to( logoGame, .4, { alpha:1 } );
			TweenNano.to( tap, .4, { alpha:1 } );
			TweenNano.to( moreGamesButton, .2, { delay:.05, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( helpButton, .2, { delay:.1, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( settingsButton, .2, { delay:.15, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( colorButton, .2, { delay:.2, y:finalY, ease:Quart.easeInOut} );

			startButton.visible = true;

			timeline.restart();
		}

		public function animaOut():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED + 10;

			TweenNano.to( logoGame, .8, { alpha:0 } );
			TweenNano.to( tap, .8, { alpha:0 } );
			TweenNano.to( colorButton, .1, { delay:.05, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( settingsButton, .1, { delay:.1, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( helpButton, .1, { delay:.15, y:finalY, ease:Quart.easeInOut} );
			TweenNano.to( moreGamesButton, .1, { delay:.2, y:finalY, ease:Quart.easeInOut, onComplete:animaOutComplete} );

			startButton.visible = false;

			timeline.stop();
		}

		private function animaOutComplete():void
		{
			var event:FlowEvent = new FlowEvent( FlowEvent.ANIMATION_OUT_COMPLETE );
			dispatchEvent( event )
		}
	}
}