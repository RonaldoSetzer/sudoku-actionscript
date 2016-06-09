package setzer.sudoku.core.beans
{
	import com.creativebottle.starlingmvc.beans.BeanProvider;

	import setzer.sudoku.core.algorithm.GridGenerator;
	import setzer.sudoku.core.managers.FlowManager;
	import setzer.sudoku.core.managers.GameManager;
	import setzer.sudoku.core.managers.NativeApplicationManager;
	import setzer.sudoku.core.managers.SharedObjectManager;
	import setzer.sudoku.core.patterns.ColorFactory;

	public class ManagersConfig extends BeanProvider
	{
		public function ManagersConfig()
		{
			beans = [
				new FlowManager(), new GameManager(), new GridGenerator(), new NativeApplicationManager(), new SharedObjectManager(), new ColorFactory()
			];
		}
	}
}