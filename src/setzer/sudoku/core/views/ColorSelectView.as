package setzer.sudoku.core.views
{
	import com.greensock.TweenNano;
	import com.greensock.easing.Quart;

	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.models.GameColorData;
	import setzer.sudoku.core.views.components.ColorButton;
	import setzer.sudoku.utils.ApplicationViewport;

	import starling.textures.Texture;

	public class ColorSelectView extends BasicView
	{
		public var buttons:Vector.<ColorButton>;

		[PostConstruct]
		public function postConstruct():void
		{
			title.text = "Select Color";
		}

		public function setupButtons( colors:Vector.<GameColorData> ):void
		{
			buttons = new Vector.<ColorButton>();
			var buttonWidth:int = 100 + 5;
			var initX:int = ( ApplicationViewport.MAX_WIDTH_SCALED - ( 4 * buttonWidth )) * .5;
			var button:ColorButton;
			var texture:Texture = Assets.getTexture( AssetsLib.BUTTON_BACKGROUND_LARGE + "_1" );

			for ( var i:int = 0; i < colors.length; i++ )
			{
				button = new ColorButton( texture, colors[i].THUMB );
				button.x = initX + buttonWidth * (i % 4);
				button.y = ApplicationViewport.MAX_HEIGHT_SCALED + 10 + Math.floor( i / 4 ) * buttonWidth;
				addChild( button );
				buttons.push( button );
			}
		}

		public function animaIn():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED * .5;
			var buttonWidth:int = 100 + 5;

			TweenNano.to( title, .3, { alpha: 1 } );

			for ( var i:int = 0; i < buttons.length; i++ )
			{
				TweenNano.to( buttons[i], .2, { delay: .05 * i, y: finalY + Math.floor( i / 4 ) * buttonWidth, ease: Quart.easeInOut } );
			}
		}

		public function animaOut():void
		{
			var finalY:int = ApplicationViewport.MAX_HEIGHT_SCALED + 10;

			TweenNano.to( title, .5, { alpha: 0 } );
			for ( var i:int = buttons.length - 1; i > 0; i-- )
			{
				TweenNano.to( buttons[i], .1, { delay: .45 - .05 * i, y: finalY, ease: Quart.easeInOut } );
			}
			TweenNano.to( buttons[i], .1, { delay: .45 - .05 * i, y: finalY, ease: Quart.easeInOut, onComplete: animaOutComplete} );
		}

		private function animaOutComplete():void
		{
			var event:FlowEvent = new FlowEvent( FlowEvent.ANIMATION_OUT_COMPLETE );
			dispatchEvent( event )
		}

		public function destroy():void
		{
			removeFromParent();
		}
	}
}