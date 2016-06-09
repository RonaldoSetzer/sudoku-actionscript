package setzer.sudoku.core.patterns
{
	import setzer.sudoku.core.models.GameColorData;

	public class ColorFactory
	{
		public var colors:Vector.<GameColorData>;

		public function ColorFactory()
		{
			colors = new Vector.<GameColorData>();
			/*colors.push( new GameColorData( ID,      THUMB, BUTTON_BGRND, BTN_TEXT, G_BUND_1, G_BAND_2, GR_BACK1, GR_UND_2, GR_ND_SE, GR_TET_S, GR_TXT_E, GRID_TXT ) );*/
			colors.push( new GameColorData( "blue_01", 0x003355, 0xFFFFFF, 0x003355, 0x003355, 0x0099FF, 0x57A5FF, 0x006AA0, 0xFFFFFF, 0x003355, 0xFF0000, 0xFFFFFF ) );
			colors.push( new GameColorData( "lila_01",0x8A3ACC, 0xFFFFFF, 0x260e30, 0x31183e, 0x7203a1, 0x9e35b9, 0x490272, 0xFFFFFF, 0x260e30, 0xFF0000, 0xFFFFFF ) );
			colors.push( new GameColorData( "green_01",0x005D3E, 0xFFFFFF, 0x0c440d, 0x0e2c0f, 0x116119, 0x198b2f, 0x0c440d, 0xFFFFFF, 0x0c440d, 0xFF3300, 0xFFFFFF ) );
			colors.push( new GameColorData( "yellow_01",0xFFFF00, 0xFFFFE3, 0x2a2400, 0x362d06, 0x7e6b00, 0xa49a00, 0x503e00, 0xFFFFE3, 0x2a2400, 0xFF0000, 0xFFFFFF ) );
			
			colors.push( new GameColorData( "black_01",0x000000, 0xFFFFFF, 0x333333, 0x000000, 0x333333, 0x666666, 0x333333, 0xFFFFFF, 0x333333, 0xFF0000, 0xFFFFFF ) );
			colors.push( new GameColorData( "red_01",0xFF0000, 0xFFFFFF, 0x590905, 0x3b0e0b, 0x8e1808, 0xb72f0b, 0x590905, 0xFFFFFF, 0x590905, 0x000099, 0xFFFFFF ) );
			colors.push( new GameColorData( "pink_01",0xFF3399, 0xFFF3FF, 0x730550, 0x821665, 0xf61cb1, 0xf85eb9, 0xb5078a, 0xFFFFFF, 0x730550, 0x0000FF, 0xFFFFFF ) );
			colors.push( new GameColorData( "white_01",0xFFFFFF, 0x333333, 0xFFFFFF, 0xEEEEEE, 0xFFFFFF, 0xFFFFFF, 0xCCCCCC, 0x000000, 0xFFFFFF, 0xFF0000, 0x000000 ) );
		}

		public function getGameColorDataByID( colorId:String ):GameColorData
		{
			for ( var i:int = 0; i < colors.length; i++ )
			{
				if ( colorId == colors[i].colorId ) return colors[i];
			}
			return colors[0];
		}
	}
}
