package setzer.sudoku.core.views.components
{
	public class CheckButton extends BasicButton
	{
		private var _isSelected:Boolean;

		public function CheckButton()
		{
			isSelected = false;
		}

		public function set isSelected( value:Boolean ):void
		{
			_isSelected = value;
			alpha = (_isSelected) ? 1 : .7;
			text = (_isSelected) ? "ON" : "OFF";
		}

		public function get isSelected():Boolean
		{
			return _isSelected;
		}
	}
}


