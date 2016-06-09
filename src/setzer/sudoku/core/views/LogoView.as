package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.assets.AssetsLib;

	import setzer.sudoku.utils.ApplicationViewport;

	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.TextureSmoothing;

	public class LogoView extends Sprite
	{

		private var timer:Timer;
		private var logo:Image;

		[PostConstruct]
		public function postConstruct():void
		{
			ApplicationViewport.applyScale( this );

			var background:Quad = new Quad( ApplicationViewport.MAX_WIDTH_SCALED, ApplicationViewport.MAX_HEIGHT_SCALED, 0xFFFFFF );
			addChild( background );

			logo = new Image( Assets.getTexture( AssetsLib.SETZER_LOGO) );
			logo.pivotX = logo.width * .5;
			logo.pivotY = logo.height * .5;
			logo.y = ApplicationViewport.MAX_HEIGHT_SCALED * .5;
			logo.x = ApplicationViewport.MAX_WIDTH_SCALED * .5;
			logo.alpha = 0;
			logo.smoothing = TextureSmoothing.NONE;

			addChild( logo );

			timer = new Timer( 3000 );
		}

		public function show():void
		{
			TweenNano.to( logo, 2, { alpha: 1 } );
		}

		public function destroy():void
		{
			removeFromParent();
		}

		private function timerToFinishHandler( e:TimerEvent ):void
		{
			timer.removeEventListener( TimerEvent.TIMER, timerToFinishHandler );
			timer = null;

			dispatchEvent( new Event( Event.COMPLETE ) );
		}

		public function starCountToNextView():void
		{
			show();
			timer.addEventListener( TimerEvent.TIMER, timerToFinishHandler );
			timer.start();
		}
	}
}