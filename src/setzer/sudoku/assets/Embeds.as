package setzer.sudoku.assets
{
	public class Embeds
	{
		/* SETZER */
		[Embed(source="/../assets/setzer/SetzerLogoBlack.png")]
		public static var SetzerLogoPNG:Class;

		/* FONT */
		[Embed(source="/../assets/fonts/font_pixel.fnt", mimeType="application/octet-stream")]
		public static const FontPixelFNT:Class;
		
		[Embed(source = "/../assets/fonts/font_pixel.png")]
		public static const FontPixelPMG:Class;

		/* ATLAS */		
		[Embed(source="/../assets/atlas/sudoku_spritesheet.png")]
		public static const SudokuAtlasPNG:Class;
		
		[Embed(source="/../assets/atlas/sudoku_spritesheet.xml", mimeType="application/octet-stream")]
		public static const SudokuAtlasXML:Class;
	}
}