package com.ding.utils;

import java.util.Calendar;

public class Time {
	public String getTime(){
		Calendar cal=Calendar.getInstance();
		int y=cal.get(Calendar.YEAR);
		int m=cal.get(Calendar.MONTH);
		int d=cal.get(Calendar.DATE);
		int h=cal.get(Calendar.HOUR_OF_DAY);
		int mi=cal.get(Calendar.MINUTE);
		int s=cal.get(Calendar.SECOND);
		String time=y+"年"+m+"月"+d+"日"+h+"时"+mi+"分"+s+"秒";
		return time;
	}
	public String getDay(){
		Calendar cal=Calendar.getInstance();
		int y=cal.get(Calendar.YEAR);
		int m=cal.get(Calendar.MONTH)+1;
		int d=cal.get(Calendar.DATE);
		String time=y+"-"+m+"-"+d;
		return time;
	}
	public int getYear(){
		Calendar cal=Calendar.getInstance();
		int y=cal.get(Calendar.YEAR);
		return y;
	}

	public int getMonth(){
		Calendar cal=Calendar.getInstance();
		int m=cal.get(Calendar.MONTH)+1;
		return m;
	}
}
