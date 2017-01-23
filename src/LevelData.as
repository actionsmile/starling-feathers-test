package {
	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	public class LevelData {
		private var _current : uint = 1;

		public function get current() : uint {
			return this._current;
		}

		public function set current(value : uint) : void {
			if (this._current != value) this._current = value;
		}
	}
}