package;

import kha.System;

class Main {
	public static function main() {
		System.init({title: "Draw", width: 1024, height: 768, samplesPerPixel: 5}, function () {
			new Draw();
		});
	}
}
