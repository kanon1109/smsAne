package com.sms.ane.init;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.sms.ane.function.OpenSmsFunction;
import com.sms.ane.function.SendSmsFunction;
import com.sms.ane.utils.LogUtil;

public class SmsContext extends FREContext 
{
	//打开短信界面
	public static final String OPEN_SMS = "open_sms";
	//直接发送短信界面
	public static final String SEND_SMS = "send_sms";
	@Override
	public void dispose() {
		// TODO Auto-generated method stub
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		// TODO Auto-generated method stub
		LogUtil.log("SmsContext init");
		Map<String, FREFunction> map = new HashMap<String, FREFunction>();
	    map.put(OPEN_SMS, new OpenSmsFunction());
	    map.put(SEND_SMS, new SendSmsFunction());
		return map;
	}
}
