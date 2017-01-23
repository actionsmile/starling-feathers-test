package {
	import feathers.controls.StackScreenNavigator;
	import feathers.controls.StackScreenNavigatorItem;
	import feathers.motion.Slide;
	import feathers.themes.MetalWorksMobileTheme;

	import starling.display.Sprite;
	import starling.events.Event;

	/**
	 * @author Aziz Zainutdin (actionsmile at icloud.com)
	 */
	public class WelcomeScreen extends Sprite {
		/**
		 * @private
		 */
		private var _navigator : StackScreenNavigator;
		/**
		 * @private
		 */
		private var isCreated : Boolean;
		/**
		 * @private
		 */
		private var _level : LevelData;

		public function WelcomeScreen() {
			this.stage ? this.create() : this.addEventListener(Event.ADDED_TO_STAGE, this.onStarlingAppear);
		}

		public function get navigator() : StackScreenNavigator {
			return this._navigator ||= new StackScreenNavigator();
		}

		public function get level() : LevelData {
			return this._level ||= new LevelData();
		}

		private function create() : void {
			if (!this.isCreated) {
				new MetalWorksMobileTheme();

				this.setupNavigator();
				var item : StackScreenNavigatorItem = new StackScreenNavigatorItem(ScreenMap);
				item.properties.level = this.level;
				item.setScreenIDForPushEvent(SampleEvent.SHOW_LEVEL, "level");

				this.navigator.addScreen("map", item);
				item = new StackScreenNavigatorItem(ScreenLevel);
				item.properties.level = this.level;
				item.addPopEvent(SampleEvent.SHOW_MAP);
				this.navigator.addScreen("level", item);

				this.navigator.rootScreenID = "map";

				this.addChild(this.navigator);

				this.isCreated = true;
			}
		}

		private function setupNavigator() : void {
			this.navigator.pushTransition = Slide.createSlideLeftTransition();
			this.navigator.popTransition = Slide.createSlideRightTransition();
		}

		private function onStarlingAppear(event : Event) : void {
			this.removeEventListener(Event.ADDED_TO_STAGE, this.onStarlingAppear);
			this.create();
		}
	}
}