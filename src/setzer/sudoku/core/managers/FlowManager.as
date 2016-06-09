package setzer.sudoku.core.managers
{
	import com.creativebottle.starlingmvc.views.ViewManager;

	import setzer.sudoku.core.events.FlowEvent;
	import setzer.sudoku.core.models.StateModel;
	import setzer.sudoku.core.views.ColorSelectView;
	import setzer.sudoku.core.views.FinishPopup;
	import setzer.sudoku.core.views.GameView;
	import setzer.sudoku.core.views.HelpView;
	import setzer.sudoku.core.views.HomeView;
	import setzer.sudoku.core.views.LevelView;
	import setzer.sudoku.core.views.LogoView;
	import setzer.sudoku.core.views.PausePopup;
	import setzer.sudoku.core.views.SettingsView;

	public class FlowManager
	{
		[Inject]
		public var _viewManager:ViewManager;

		[Inject]
		public var stateModel:StateModel;

		[PostConstruct]
		public function postConstruct():void
		{
			_viewManager.setView( LogoView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_HOME")]
		public function navigateToHomeView( e:FlowEvent ):void
		{
			removeAllPopup();
			stateModel.state = StateModel.STATE_HOME;
			_viewManager.setView( HomeView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_GAME")]
		public function navigateToGamePlay( e:FlowEvent ):void
		{
			removeAllPopup();
			stateModel.state = StateModel.STATE_GAME;
			_viewManager.setView( GameView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_LOGO")]
		public function navigateToLogoView( e:FlowEvent ):void
		{
			_viewManager.setView( LogoView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_SETTINGS")]
		public function navigateToSettingsView( e:FlowEvent ):void
		{
			stateModel.state = StateModel.STATE_SETTINGS;
			_viewManager.setView( SettingsView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_HELP")]
		public function navigateToHelpView( e:FlowEvent ):void
		{
			stateModel.state = StateModel.STATE_HELP;
			_viewManager.setView( HelpView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_LEVEL")]
		public function navigateToLevelView( e:FlowEvent ):void
		{
			stateModel.state = StateModel.STATE_LEVEL;
			_viewManager.setView( LevelView );
		}

		[EventHandler(event="FlowEvent.SHOW_VIEW_COLOR")]
		public function navigateToColorPopup( e:FlowEvent ):void
		{
			stateModel.state = StateModel.STATE_COLOR;
			_viewManager.addView( new ColorSelectView() );
		}

		/*  POPUPS */
		[EventHandler(event="FlowEvent.SHOW_POPUP_PAUSE")]
		public function navigateToPausePopup( e:FlowEvent ):void
		{
			_viewManager.addView( new PausePopup() );
		}

		[EventHandler(event="FlowEvent.SHOW_POPUP_FINISH")]
		public function navigateToFinishPopup( e:FlowEvent ):void
		{
			_viewManager.addView( new FinishPopup() );
		}


		[EventHandler(event="FlowEvent.REMOVE_ALL_POPUPS")]
		public function removeAllPopup( e:FlowEvent = null ):void
		{
			_viewManager.removeAll();
		}
	}
}