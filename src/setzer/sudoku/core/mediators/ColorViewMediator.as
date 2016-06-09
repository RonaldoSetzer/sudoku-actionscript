package setzer.sudoku.core.mediators
{
	import flash.utils.Dictionary;

	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.events.GameEvent;
	import setzer.sudoku.core.models.CurrentGameColor;
	import setzer.sudoku.core.models.GameColorData;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.patterns.ColorFactory;
	import setzer.sudoku.core.views.ColorSelectView;

	import starling.events.Event;

	public class ColorViewMediator extends AbstractMediator
	{
		[Inject]
		public var colorFactory:ColorFactory;

		[Inject]
		public var gameModel:GameModel;

		private var _view:ColorSelectView;
		private var delayedEvent:FlowEvent;

		private var colorsId:Dictionary;

		[ViewAdded]
		public function viewAdded( view:ColorSelectView ):void
		{
			var colors:Vector.<GameColorData> = colorFactory.colors;

			colorsId = new Dictionary();

			_view = view;
			_view.setupButtons( colors );

			eventMap.addMap( _view, FlowEvent.ANIMATION_OUT_COMPLETE, onAnimationOutHandler );

			for ( var i:int = 0; i < _view.buttons.length; i++ )
			{
				eventMap.addMap( _view.buttons[i], Event.TRIGGERED, onClickHandler );
				colorsId[_view.buttons[i]] = colors[i];
			}

			_view.animaIn();
		}

		private function onClickHandler( e:Event ):void
		{
			e.stopImmediatePropagation();

			var colorData:GameColorData = colorsId[e.currentTarget];
			CurrentGameColor.updateColors( colorData );
			gameModel.colorId = colorData.colorId;

			_view.updateColors();

			_dispatcher.dispatchEvent( new GameEvent( GameEvent.UPDATE_CONFIG ) );
			_view.animaOut();
		}

		private function onAnimationOutHandler( e:FlowEvent ):void
		{
			e.stopImmediatePropagation();

			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
			delayedEvent = null;
		}

		[ViewRemoved]
		public function viewRemoved( view:ColorSelectView ):void
		{
			_view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}