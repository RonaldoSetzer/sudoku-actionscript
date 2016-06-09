package setzer.sudoku.core.setup
{
	import com.creativebottle.starlingmvc.StarlingMVC;
	import com.creativebottle.starlingmvc.config.StarlingMVCConfig;
	import com.creativebottle.starlingmvc.views.ViewManager;

	import setzer.sudoku.assets.Assets;
	import setzer.sudoku.core.beans.CommandsConfig;
	import setzer.sudoku.core.beans.ManagersConfig;
	import setzer.sudoku.core.beans.MediatorsConfig;
	import setzer.sudoku.core.beans.ModelsConfig;

	import starling.display.Sprite;
	import starling.events.Event;

	public class StarlingView extends Sprite
	{
		public function StarlingView()
		{
			Assets.init();

			this.addEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			var _pathViews:String = "setzer.sudoku.core.views";
			var _pathEvents:String = "setzer.sudoku.core.events";

			var configMVC:StarlingMVCConfig = new StarlingMVCConfig();
			configMVC.eventPackages = [_pathEvents];
			configMVC.viewPackages = [_pathViews];

			var beanProviders:Array = [
				new MediatorsConfig(), new ViewManager( this ), new ModelsConfig(), new ManagersConfig(), new CommandsConfig()
			];

			var _starlingMVC:StarlingMVC = new StarlingMVC( this, configMVC, beanProviders );
		}
	}
}