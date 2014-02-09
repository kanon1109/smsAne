package
{
import com.sms.ane.SmsAne;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;
import flash.events.StatusEvent;
import flash.text.TextField;

public class SmsAneTest extends Sprite
{
	private var txt:TextField;
	public function SmsAneTest()
	{
		super();
		
		// 支持 autoOrient
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		
		this.txt = new TextField();
		this.txt.textColor = 0x000000;
		this.txt.multiline = true;
		this.txt.wordWrap = true;
		this.txt.width = 550;
		this.txt.height = 400;
		this.txt.selectable = false;
		this.txt.mouseEnabled = false;
		this.txt.text = "initd";
		this.addChild(this.txt);
		
		var btn1:Sprite = new Sprite();
		btn1.graphics.lineStyle(1, 0xFF0000);
		btn1.graphics.beginFill(0xFF00FF);
		btn1.graphics.drawRect(0, 0, 150, 150);
		btn1.graphics.endFill();
		this.addChild(btn1);
		btn1.x = 150;
		btn1.y = 200;
		
		var btn2:Sprite = new Sprite();
		btn2.graphics.lineStyle(1, 0xFF0000);
		btn2.graphics.beginFill(0xFF00FF);
		btn2.graphics.drawRect(0, 0, 150, 150);
		btn2.graphics.endFill();
		this.addChild(btn2);
		btn2.x = 150;
		btn2.y = 350;
		
		SmsAne.getInstance().addEventListener(StatusEvent.STATUS, statusHandler);
		
		btn1.addEventListener(MouseEvent.MOUSE_DOWN, btn1ClickHandler);
		btn2.addEventListener(MouseEvent.MOUSE_DOWN, btn2ClickHandler);
	}
	
	protected function btn2ClickHandler(event:MouseEvent):void
	{
		// TODO Auto-generated method stub
		this.txt.text = "click2";
		SmsAne.getInstance().openSMS("137xxxxxxxx", "ane test");
	}
	
	protected function statusHandler(event:StatusEvent):void
	{
		// TODO Auto-generated method stub
		this.txt.text = "code:" + event.code + " ,level=" + event.level;
	}
	
	protected function btn1ClickHandler(event:MouseEvent):void
	{
		// TODO Auto-generated method stub
		this.txt.text = "click1";
		SmsAne.getInstance().sendSMS("137xxxxxxxx", "ane test");
	}
}
}