package setzer.sudoku.core.views.components
{
	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;

	import starling.display.Image;
	import starling.textures.Texture;

	public class BasicButton extends ColorButton
	{
		private var _ico:Image;

		public function BasicButton( label:String = "", typeSize:String = "1" )
		{

			var texture:Texture = Assets.getTexture( AssetsLib.BUTTON_BACKGROUND_LARGE + "_" + typeSize );

			super( texture, CurrentGameColor.BUTTON_BACKGROUND );

			fontName = AssetsLib.FONT;
			fontColor = CurrentGameColor.BUTTON_TEXT;
			fontSize = 16;

			text = label;
		}

		public function setIco( name:String ):void
		{
			if ( _ico ) _ico.removeFromParent();

			text = "";
			_ico = new Image( Assets.getTexture( name ) );
			/*_ico.smoothing = TextureSmoothing.NONE;*/
			_ico.color = CurrentGameColor.BUTTON_TEXT;
			_ico.pivotX = _ico.width * .5;
			_ico.pivotY = _ico.height * .5;
			_ico.x = width * .5;
			_ico.y = height * .5;
			mContents.addChild( _ico );
		}
	}
}