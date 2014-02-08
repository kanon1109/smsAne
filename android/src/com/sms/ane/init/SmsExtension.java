package com.sms.ane.init;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class SmsExtension implements FREExtension {

	@Override
	public FREContext createContext(String arg0) {
		// TODO Auto-generated method stub
		return new SmsContext();
	}

	@Override
	public void dispose() {
		// TODO Auto-generated method stub

	}

	@Override
	public void initialize() {
		// TODO Auto-generated method stub

	}

}
