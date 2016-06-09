package setzer.sudoku.core.mediators
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.views.HomeView;
	import setzer.sudoku.utils.TextLib;
	
	import starling.events.Event;

	public class HomeViewMediator extends AbstractMediator
	{
		public var _view:HomeView;

		private var delayedEvent:FlowEvent;

		[ViewAdded]
		public function viewAdded( view:HomeView ):void
		{
			_view = view;

			eventMap.addMap( _view, FlowEvent.ANIMATION_OUT_COMPLETE, onAnimationOutHandler );
			eventMap.addMap( _view.startButton, Event.TRIGGERED, onStartHandler );
			eventMap.addMap( _view.moreGamesButton, Event.TRIGGERED, onMoreGamesHandler );
			eventMap.addMap( _view.helpButton, Event.TRIGGERED, onHelpHandler );
			eventMap.addMap( _view.settingsButton, Event.TRIGGERED, onSettingsHandler );
			eventMap.addMap( _view.colorButton, Event.TRIGGERED, onColorHandler );

			_view.animaIn();

		}

		private function onStartHandler( e:Event ):void
		{
			e.stopImmediatePropagation();
			delayedEvent = new FlowEvent( FlowEvent.SHOW_VIEW_LEVEL );
			_view.animaOut();
		}

		private function onMoreGamesHandler( e:Event ):void
		{
			navigateToURL( new URLRequest( TextLib.SETZER_LINK ) );
		}

		private function onHelpHandler( e:Event ):void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HELP ) );
		}

		private function onSettingsHandler():void
		{
			_dispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_SETTINGS ) );
		}

		private function onColorHandler( e:Event ):void
		{
			e.stopImmediatePropagation();
			delayedEvent = new FlowEvent( FlowEvent.SHOW_VIEW_COLOR );
			_view.animaOut();
		}

		private function onAnimationOutHandler( e:FlowEvent ):void
		{
			e.stopImmediatePropagation();
			if ( delayedEvent == null ) return;

			_dispatcher.dispatchEvent( delayedEvent );
			delayedEvent = null;
		}

		[ViewRemoved]
		public function viewRemoved( view:HomeView ):void
		{
			_view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}