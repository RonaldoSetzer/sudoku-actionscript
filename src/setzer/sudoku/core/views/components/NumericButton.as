package setzer.sudoku.core.views.components
{
	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.assets.AssetsLib;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.infos.TextInfo;

	public class NumericButton extends ColorButton
	{
		public var value:String;

		public function NumericButton( label:String )
		{
			super( Assets.getTexture( AssetsLib.BUTTON_BACKGROUND_SMALL ), CurrentGameColor.BUTTON_BACKGROUND, (label != "0") ? label : "" );

			fontName = AssetsLib.FONT;
			fontColor = CurrentGameColor.BUTTON_TEXT;
			fontSize = TextInfo.SIZE_LARGE;

			this.value = label;

			pivotX = width * .5;
			pivotY = height * .5;
		}
	}
}