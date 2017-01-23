package {
	import starling.core.Starling;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display3D.Context3DProfile;
	import flash.display3D.Context3DRenderMode;
	import flash.events.Event;
	import flash.geom.Rectangle;

	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	[SWF(backgroundColor="0", frameRate="60", width="640", height="480", wmode="direct")]
	public class SampleFeathers extends Sprite {
		/**
		 * @private
		 */
		private var _starling : Starling;
		/**
		 * @private
		 */
		private var _viewport : Rectangle;

		public function SampleFeathers() {
			this.stage ? this.create() : this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
		}

		public function get starling() : Starling {
			return this._starling ||= new Starling(WelcomeScreen, this.stage, this.viewport, null, Context3DRenderMode.AUTO, Context3DProfile.BASELINE);
		}

		public function get viewport() : Rectangle {
			return this._viewport ||= new Rectangle(0, 0, 640, 480);
		}

		private function create() : void {
			this.stage.align = StageAlign.TOP_LEFT;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.mouseEnabled = this.mouseChildren = false;

			this.starling.skipUnchangedFrames = true;
			this.starling.supportHighResolutions = true;
			this.starling.showStats = true;
			this.starling.start();
		}

		private function onAddedToStage(event : Event) : void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
			this.create();
		}
	}
}