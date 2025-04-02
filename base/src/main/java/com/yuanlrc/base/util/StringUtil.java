package com.yuanlrc.base.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * 项目通用工具类
 * @author Administrator
 *
 */
public class StringUtil {
	
	
	/**
	 * 返回指定格式的日期字符串
	 * @param date
	 * @param formatter
	 * @return
	 */
	public static String getFormatterDate(Date date,String formatter){
		SimpleDateFormat sdf = new SimpleDateFormat(formatter);
		return sdf.format(date);
	}
	
	/**
	 * 判断请求是否是ajax
	 * @param request
	 * @return
	 */
	public static boolean isAjax(HttpServletRequest request){
		String header = request.getHeader("X-Requested-With");
		if("XMLHttpRequest".equals(header))return true;
		return false;
	}
	
	/**
	 * 从流读取字符串
	 * @param inputStream
	 * @return
	 */
	public static String getStringFromInputStream(InputStream inputStream){
		String string = "";
		try {
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream,"GB2312"));
			String buf = null;
			try {
				while((buf = bufferedReader.readLine()) != null){
					string += buf;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					bufferedReader.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return string;
	}
	/**
	 * 封装分页显示
	 * @Title:         pages   
	 * @Description:   TODO  
	 * @param:         @param totalPage 总页数
	 * @param:         @param currentPage 当前页
	 * @param:         @param showPageSize 当前页左右显示数
	 * @param:         @return      
	 * @return:        List<Integer>   
	 * @author:        jack(jimke127@126.com)
	 * @date:          2025年4月1日 下午4:25:29   
	 * @throws
	 */
	public static List<Integer> pages(Integer totalPage,Integer currentPage,Integer showPageSize){
		
		//Integer showPageSize = 5; //当前页前后显示的页码数
		
		List<Integer> currentShowPage = new ArrayList<Integer>();
		
		for(int i = currentPage - 1;i >= 0; i--){
			currentShowPage.add(i);
			if(i <= (currentPage - showPageSize)){
				break;
			}
		}
		for(int i = currentPage;i < totalPage; i++){
			currentShowPage.add(i);
			if(i >= totalPage){
				break;
			}
			if(i >= (showPageSize + currentPage)){
				break;
			}
		}
		Collections.sort(currentShowPage);
		
		return currentShowPage;
	}

}
