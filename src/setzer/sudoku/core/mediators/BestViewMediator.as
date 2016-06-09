/**
 * Created by Ronaldo on 30/11/2014.
 */
package setzer.sudoku.core.mediators
{
	import setzer.sudoku.core.models.ExternalData;
	import setzer.sudoku.core.views.BestView;

	public class BestViewMediator extends AbstractMediator
	{

		[Inject]
		public var external:ExternalData;

		private var view:BestView;

		[ViewAdded]
		public function viewAdded( view:BestView ):void
		{
			this.view = view;

			view.update( external.times );
			view.animationIn();
		}

		[ViewRemoved]
		public function viewRemoved( view:BestView ):void
		{
			view = null;
			eventMap.removeAllMappedEvents();
		}
	}
}
