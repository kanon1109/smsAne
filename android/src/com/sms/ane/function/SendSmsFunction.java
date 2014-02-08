package com.sms.ane.function;

import java.util.List;

import android.telephony.SmsManager;
import android.widget.Toast;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class SendSmsFunction implements FREFunction 
{
	@Override
	public FREObject call(FREContext context, FREObject[] args) 
	{
		//号码
		String number = "";
		//内容
		String content = "";
		try 
		{
			number = args[0].getAsString();
			content = args[1].getAsString();
			SmsManager smsManager = SmsManager.getDefault();
	        //如果内容大于70字，则拆分为多条
	        List<String> texts = smsManager.divideMessage(content);
            //逐条发送短信
	        //对texts这个String数组中的每个String元素命名为text，在循环中对text进行操作
            for(String text:texts)
            {
            	smsManager.sendTextMessage(number, null, content, null, null);
            }                
            //发送结果提示
            Toast.makeText(context.getActivity().getBaseContext(), "发送成功", Toast.LENGTH_LONG).show();
	        context.dispatchStatusEventAsync("sendSuccess", null);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			context.dispatchStatusEventAsync("sendFail", null);
		}
		return null;
	}
}
