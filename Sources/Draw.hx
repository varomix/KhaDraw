package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.input.Mouse;
import kha.graphics2.Graphics;
import kha.Image;


class Draw {
	
	public var mouseoffset:Int  = 4;
	public var isDrawing:Bool;
	
	public var mouseX:Int;
	public var mouseY:Int;
	
	public var img:Image;
	
	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		isDrawing = false;
		
		img = Image.createRenderTarget(320, 320);
		// img = Image.create(32, 32);
		paint();
		
		Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, null);
	}
	
	
	function paint()
    {
        img.g2.begin(false);
        img.g2.color = Color.Red;
		
        // img.g2.drawLine(mouseX, 0, img.width, img.height, 10);
        // img.g2.drawLine(img.width, 0, 0, img.height, 10);
		if(isDrawing){
			
			img.g2.fillRect(mouseX, mouseY, 10, 10);
		}
        img.g2.end();
    }
	
	
	public function onMouseDown(btn:Int, x:Int, y:Int):Void
	{
		isDrawing = true;
		mouseX = x;
		mouseY = y;
		// trace("mouse down start drawing");
	}
	
	public function onMouseUp(btn:Int, x:Int, y:Int):Void
	{
		isDrawing = false;
		// trace("mouse Up stop drawing");
		
	}
	
	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int):Void
	{
		mouseX = x;
		mouseY = y;
		
	}
	
	function update(): Void {
		paint();
	}

	function render(framebuffer: Framebuffer): Void {
		
		var g = framebuffer.g2;
		
		g.begin(true, Color.White);
		
		// g.drawImage(img, 0, 0);
		g.drawScaledImage(img, 0, 0, 320, 320);
		g.end();
	}
}
