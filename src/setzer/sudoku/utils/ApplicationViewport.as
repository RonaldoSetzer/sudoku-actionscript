package setzer.sudoku.utils
{
	import flash.display.Stage;
	import flash.geom.Rectangle;

	public class ApplicationViewport
	{
		public static const PORTRAIT:String = "portrait";
		public static const LANDSCAPE:String = "landscape";

		private static var BASE_WIDTH:uint = 480;
		private static var BASE_HEIGHT:uint = 800;

		public static var SCALE:Number;
		public static var SCALE_WIDTH:Number;
		public static var SCALE_HEIGHT:Number;

		public static var MAX_WIDTH:Number;
		public static var MAX_HEIGHT:Number;

		public static var MAX_WIDTH_SCALED:Number;
		public static var MAX_HEIGHT_SCALED:Number;

		public static var viewport:Rectangle;


		public static function updateValues( stage:Stage, type:String = "portrait" ):void
		{
			if ( type == LANDSCAPE )
			{
				BASE_WIDTH = 1024;
				BASE_HEIGHT = 600;
			}

			SCALE_WIDTH = stage.fullScreenWidth / ApplicationViewport.BASE_WIDTH;
			SCALE_HEIGHT = stage.fullScreenHeight / ApplicationViewport.BASE_HEIGHT;

			SCALE = SCALE_WIDTH//Math.min( SCALE_WIDTH, SCALE_HEIGHT );

			MAX_WIDTH = stage.fullScreenWidth;
			MAX_HEIGHT = stage.fullScreenHeight;

			viewport = new Rectangle( 0, 0, MAX_WIDTH, MAX_HEIGHT );

			MAX_WIDTH_SCALED = stage.fullScreenWidth * SCALE;
			MAX_HEIGHT_SCALED = stage.fullScreenHeight * SCALE;

			if ( MAX_WIDTH > stage.fullScreenWidth ) return;

			MAX_WIDTH_SCALED = stage.fullScreenWidth / SCALE;
			MAX_HEIGHT_SCALED = stage.fullScreenHeight / SCALE;

		}

		public static function applyScale( view:Object ):void
		{
			view.scaleX = SCALE;
			view.scaleY = SCALE;
		}
	}
}