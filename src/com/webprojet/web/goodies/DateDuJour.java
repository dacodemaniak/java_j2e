/**
 * 
 */
package com.webprojet.web.goodies;

import java.text.DateFormat;
import java.util.Date;

/**
 * @author DaCodeManiak
 *
 */
public class DateDuJour {
	private Date date = new Date();
	
	public DateDuJour(){}
	
	public String getDate(){
		DateFormat format = DateFormat.getInstance();
		return format.format(this.date);
	}
}
