package {
	import feathers.controls.Button;
	import feathers.controls.LayoutGroup;
	import feathers.layout.HorizontalAlign;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalAlign;

	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;

	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	public class ScreenMap extends Sprite {
		[Embed(source="./../assets/map_1.jpg")]
		private var BackgroundImage : Class;
		/**
		 * @private
		 */
		private var isCreated : Boolean;
		/**
		 * @private
		 */
		private var _image : Image;
		/**
		 * @private
		 */
		private var _container : LayoutGroup;
		/**
		 * @private
		 */
		private var _level : LevelData;

		public function ScreenMap() {
			this.stage ? this.create() : this.addEventListener(Event.ADDED_TO_STAGE, this.onStarlingAppear);
		}

		public function get background() : Image {
			return this._image ||= new Image(Texture.fromBitmap(new BackgroundImage()));
		}

		public function get container() : LayoutGroup {
			return this._container ||= new LayoutGroup();
		}

		public function get level() : LevelData {
			return this._level;
		}

		public function set level(value : LevelData) : void {
			if (this._level != value) this._level = value;
		}

		private function create() : void {
			if (!this.isCreated) {
				var layout : HorizontalLayout = new HorizontalLayout();
				layout.horizontalAlign = HorizontalAlign.CENTER;
				layout.verticalAlign = VerticalAlign.MIDDLE;
				layout.padding = 10;
				layout.gap = 10;

				this.container.layout = layout;
				this.container.addEventListener("creationComplete", this.onCreationComplete);
				this.createLevelButtons();

				this.addChild(this.background);
				this.addChild(this.container);

				this.isCreated = true;
			}
		}

		private function createLevelButtons(count : uint = 3) : void {
			var button : Button;
			for (var i : int = 1; i < count + 1; i++) {
				button = new Button();
				button.label = "Level " + i.toString();
				button.addEventListener(Event.TRIGGERED, this.onButtonTriggered);

				this.container.addChild(button);
			}
		}

		private function onCreationComplete(event : Event) : void {
			event.target.removeEventListener("creationComplete", this.onCreationComplete);
			this.container.x = (this.stage.stageWidth - this.container.width) >> 1;
			this.container.y = (this.stage.stageHeight - this.container.height) >> 1;
		}

		private function onButtonTriggered(event : Event) : void {
			var button : Button = event.target as Button;
			if (button) {
				this.level.current = int(button.label.split(" ")[1]);
				this.dispatchEventWith(SampleEvent.SHOW_LEVEL);
			}
		}

		private function onStarlingAppear(event : Event) : void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onStarlingAppear);
			this.create();
		}
	}
}