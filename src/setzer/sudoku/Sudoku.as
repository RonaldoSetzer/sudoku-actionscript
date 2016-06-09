package setzer.sudoku
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import setzer.sudoku.core.setup.StarlingView;
	import setzer.sudoku.utils.ApplicationViewport;
	
	import starling.core.Starling;
	import starling.events.ResizeEvent;

	public class Sudoku extends Sprite
	{
		private var _starling:Starling;

		public function Sudoku()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			stage.color = 0x000000;

			addEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			ApplicationViewport.updateValues( stage );
			Starling.handleLostContext = true;

			_starling = new Starling( StarlingView, stage );
			_starling.nativeStage.frameRate = 60;
			_starling.start();
			stage.addEventListener( ResizeEvent.RESIZE, resizeStageHandler );
		}

		private function resizeStageHandler( e:Event ):void
		{
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;

			Starling.current.viewPort = viewPortRectangle;

			_starling.stage.stageWidth = stage.stageWidth;
			_starling.stage.stageHeight = stage.stageHeight;

			ApplicationViewport.updateValues( stage );
		}

	}
}