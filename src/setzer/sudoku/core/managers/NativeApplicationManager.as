package setzer.sudoku.core.managers
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.models.StateModel;

	import starling.events.EventDispatcher;

	public class NativeApplicationManager
	{
		[Inject]
		public var stateModel:StateModel;

		private var _dispatcher:EventDispatcher;

		public function NativeApplicationManager()
		{
			NativeApplication.nativeApplication.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDownHandler );
			NativeApplication.nativeApplication.addEventListener( Event.DEACTIVATE, onDeactivateHandler );
			NativeApplication.nativeApplication.addEventListener( Event.EXITING, onDeactivateHandler );
		}

		private function onDeactivateHandler( e:Event ):void
		{
			e.stopPropagation();
			e.preventDefault();

			if ( stateModel.state == StateModel.STATE_GAME && stateModel.hasPopupOpened() == false )
			{
				eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_POPUP_PAUSE ) );
			}
		}

		private function onKeyDownHandler( e:KeyboardEvent ):void
		{
			e.preventDefault();

			if ( e.keyCode == Keyboard.BACK )
			{
				tryBack();
			}
		}

		private function tryBack():void
		{
			if ( stateModel.state == StateModel.STATE_HOME )
				exitApplication();
			else
				eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_VIEW_HOME ) );
		}

		public function exitApplication():void
		{
			NativeApplication.nativeApplication.exit();
		}

		[Dispatcher]
		public function set eventDispatcher( valueParam:EventDispatcher ):void
		{
			_dispatcher = valueParam;
		}

		public function get eventDispatcher():EventDispatcher
		{
			return _dispatcher;
		}
	}
}