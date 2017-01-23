package {
	import starling.events.Event;

	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	public class SampleEvent extends Event {
		public static const SHOW_LEVEL : String = "showLevel";
		public static const SHOW_MAP : String = "showMap";

		public function SampleEvent(type : String, bubbles : Boolean = false, data : Object = null) {
			super(type, bubbles, data);
		}
	}
}