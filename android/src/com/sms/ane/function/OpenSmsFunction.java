package com.sms.ane.function;

import android.content.Intent;
import android.net.Uri;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.sms.ane.utils.LogUtil;

public class OpenSmsFunction implements FREFunction 
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
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		LogUtil.log("number:" + number + " content:" + content);
		Uri uri = Uri.parse("smsto:"+ number);     
		Intent it = new Intent(Intent.ACTION_SENDTO, uri);     
		it.putExtra("sms_body", content);     
		context.getActivity().startActivity(it); 
		return null;
	}

}
