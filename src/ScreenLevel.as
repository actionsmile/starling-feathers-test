package {
	import feathers.controls.Button;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	public class ScreenLevel extends Sprite {
		/**
		 * @private
		 */
		private var isCreated : Boolean;

		[Embed(source="./../assets/map_2.jpg")]
		private var BackgroundImage : Class;
		/**
		 * @private
		 */
		private var _level : LevelData;

		public function ScreenLevel() {
			this.stage ? this.create() : this.addEventListener(Event.ADDED_TO_STAGE, this.onStarlingAppear);
		}

		public function get background() : Image {
			return new Image(Texture.fromBitmap(new BackgroundImage()));
		}

		public function get level() : LevelData {
			return this._level;
		}

		public function set level(value : LevelData) : void {
			if (this._level != value) this._level = value;
		}

		private function create() : void {
			if (!this.isCreated) {
				var button : Button = new Button();
				button.addEventListener("creationComplete", this.onCreationComplete);
				button.addEventListener(Event.TRIGGERED, this.onButtonPressed);
				button.label = "Current level is " + this.level.current.toString();

				this.addChild(this.background);
				this.addChild(button);

				this.isCreated = true;
			}
		}

		private function onButtonPressed(event : Event) : void {
			this.dispatchEventWith(SampleEvent.SHOW_MAP);
		}

		private function onCreationComplete(event : Event) : void {
			var button : Button = event.target as Button;
			if (button) {
				button.x = (this.stage.stageWidth - button.width) >> 1;
				button.y = (this.stage.stageHeight - button.height) >> 1;
			}
		}

		private function onStarlingAppear(event : Event) : void {
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, this.onStarlingAppear);
			this.create();
		}
	}
}