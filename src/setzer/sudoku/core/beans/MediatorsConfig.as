package setzer.sudoku.core.beans
{
	import com.creativebottle.starlingmvc.beans.BeanProvider;

	import setzer.sudoku.core.mediators.BestViewMediator;

	import setzer.sudoku.core.mediators.ButtonsBarDisplayMediator;
	import setzer.sudoku.core.mediators.CoreGameViewMediator;
	import setzer.sudoku.core.mediators.FinishPopupMediator;
	import setzer.sudoku.core.mediators.GameDisplayMediator;
	import setzer.sudoku.core.mediators.HelpViewMediator;
	import setzer.sudoku.core.mediators.HomeViewMediator;
	import setzer.sudoku.core.mediators.LevelViewMediator;
	import setzer.sudoku.core.mediators.LogoViewMediator;
	import setzer.sudoku.core.mediators.PausePopupMediator;
	import setzer.sudoku.core.mediators.ColorViewMediator;
	import setzer.sudoku.core.mediators.SettingsViewMediator;
	
	public class MediatorsConfig extends BeanProvider
	{
		public function MediatorsConfig()
		{
			beans = [ 
				new LogoViewMediator(), 
				new HomeViewMediator(), 
				new CoreGameViewMediator(),
				new GameDisplayMediator(),
				new ColorViewMediator(),
				new ButtonsBarDisplayMediator(),
				new LevelViewMediator(),
				new SettingsViewMediator(),
				new PausePopupMediator(),
				new FinishPopupMediator(),
				new HelpViewMediator(),
				new BestViewMediator()
			];
		}
	}
}