package com.sms.ane 
{
import flash.events.EventDispatcher;
import flash.events.StatusEvent;
import flash.external.ExtensionContext;
/**
 * ...用于rsa签名的ANE
 * @author Kanon
 */
public class SmsAne extends EventDispatcher 
{
	//与extension.xml中的id标签一致
	public static const EXTENSION_ID:String = "com.sms.ane";
	//打开短信界面
	public static const OPEN_SMS:String = "open_sms";
	//直接发送短信界面
	public static const SEND_SMS:String = "send_sms";
	//用于连接静态库的上下文 
	private var context:ExtensionContext;
	private static var instance:SmsAne;
	public function SmsAne(singletoner:Singletoner) 
	{
		if (!singletoner) throw new Error("非法初始化单例元件");
		this.initContext();
	}
	
	/**
	 * 获取单例
	 * @return
	 */
	public static function getInstance():SmsAne
	{
		if (!instance) instance = new SmsAne(new Singletoner());
		return instance;
	}
	
	/**
	 * 初始化上下文
	 */
	private function initContext():void
	{
		if (!this.context)
		{
			this.context = ExtensionContext.createExtensionContext(SmsAne.EXTENSION_ID, "");
			this.context.addEventListener(StatusEvent.STATUS, statusHandler);
		}
	}
	
	/**
	 * 转抛事件 由游戏内部监听
	 * @param event 回调事件
	 */
	private function statusHandler(event:StatusEvent):void
	{
		this.dispatchEvent(event);
	}
    
	/**
	 * 打开发送短信界面 并显示发送号码和内容
	 * @param	number		号码
	 * @param	content		内容
	 */
    public function openSMS(number:String, content:String):void
	{
		if (this.context)
			this.context.call(SmsAne.OPEN_SMS, number, content);
	}
	
	/**
	 * 发送短信
	 * @param	number		号码
	 * @param	content		内容
	 */
	public function sendSMS(number:String, content:String):void
	{
		if (this.context)
			this.context.call(SmsAne.SEND_SMS, number, content);
	}
}
}
class Singletoner {
}