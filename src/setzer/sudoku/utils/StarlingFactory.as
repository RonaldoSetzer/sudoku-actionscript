package setzer.sudoku.utils
{
	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.infos.TextInfo;

	import starling.display.Image;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.TextureSmoothing;

	public class StarlingFactory
	{
		public static function getTextField( width:int, text:String = "", size:int = TextInfo.SIZE_LARGE, rows:int = 1 ):TextField
		{
			return new TextField( width, (size + 2) * rows, text, AssetsLib.FONT, size, 0xFFFFFF );
		}

		public static function getImage( assetKey:String ):Image
		{
			var img:Image = new Image( Assets.getTexture( assetKey ) );
			img.smoothing = TextureSmoothing.NONE;
			return img;
		}

		public static function getQuad( width:Number, height:Number, color:int ):Quad
		{
			return new Quad( width, height, color );
		}
	}
}
