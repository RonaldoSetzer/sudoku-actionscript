package setzer.sudoku.assets
{
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.textures.TextureSmoothing;

	public class Assets
	{
		/* TEXTURE ATLAS*/
		private static var sudokuTextureAtlas:TextureAtlas;

		public static function init():void
		{
			var sudokuTexture:Texture = Texture.fromBitmap( new Embeds.SudokuAtlasPNG() );
			var sudokuTextureXML:XML = XML( new Embeds.SudokuAtlasXML() );
			sudokuTextureAtlas = new TextureAtlas( sudokuTexture, sudokuTextureXML );

			var texture:Texture = Texture.fromBitmap( new Embeds.FontPixelPMG() );

			var pixelFontBMP:BitmapFont = new BitmapFont( texture, XML( new Embeds.FontPixelFNT() ) );
			pixelFontBMP.smoothing = TextureSmoothing.NONE;

			TextField.registerBitmapFont( pixelFontBMP );
		}

		public static function getTexture( preFix:String ):Texture
		{
			var texture:Texture;
			if( preFix == AssetsLib.SETZER_LOGO )
				texture = Texture.fromBitmap( new Embeds.SetzerLogoPNG() );
			else
				texture = sudokuTextureAtlas.getTexture( preFix );

			return texture
		}

		public static function getTextures( preFix:String ):Vector.<Texture>
		{
			return sudokuTextureAtlas.getTextures( preFix );
		}
	}
}