package setzer.sudoku.core.beans
{
	import com.creativebottle.starlingmvc.beans.BeanProvider;
	
	import setzer.sudoku.core.models.ExternalData;
	import setzer.sudoku.core.models.GameModel;
	import setzer.sudoku.core.models.GridData;
	import setzer.sudoku.core.models.StateModel;
	
	public class ModelsConfig extends BeanProvider
	{
		public function ModelsConfig()
		{
			beans = [
				new GameModel(),
				new GridData(),
				new StateModel(),
				new ExternalData()
			];
		}
	}
}