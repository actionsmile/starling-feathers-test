package {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	public class SampleFeathers extends Sprite {
		public function SampleFeathers() {
			this.stage ? this.create() : this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
		}

		private function create() : void {
			
		}

		private function onAddedToStage(event : Event) : void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
			this.create();
		}
	}
}