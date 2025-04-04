package com.yuanlrc.base.util;

import java.lang.reflect.Field;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yuanlrc.base.admin.interceptor.LoginInterceptor;
import com.yuanlrc.base.annotion.ValidateEntity;
import com.yuanlrc.base.bean.CodeMsg;

/**
 * 验证实体工具类
 * @author Administrator
 *
 */
public class ValidateEntityUtil {
	
	private static Logger log = LoggerFactory.getLogger(ValidateEntityUtil.class);
	
	public static CodeMsg validate(Object object){
		Field[] declaredFields = object.getClass().getDeclaredFields();
		for(Field field : declaredFields){
			ValidateEntity annotation = field.getAnnotation(ValidateEntity.class);
			if(annotation != null){
				if(annotation.required()){
					//表示该字段是必填字段
					field.setAccessible(true);
					try {
						Object o = field.get(object);
						
						//首先判断是否为空
						if(o == null){
							CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
							codeMsg.setMsg(annotation.errorRequiredMsg());
							return codeMsg;
						}
						//到这，说明该变量的值不是null
						//首先判断是不是String类型
						if(o instanceof String){
							//若是字符串类型，则检查其长度
							if(annotation.requiredLeng()){
								if(o.toString().length() < annotation.minLength()){
									log.info("herer1 ="+o);
									CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
									codeMsg.setMsg(annotation.errorMinLengthMsg());
									return codeMsg;
								}
								if(o.toString().length() > annotation.maxLength()){
									log.info("herer2 ="+o);
									CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
									codeMsg.setMsg(annotation.errorMaxLengthMsg());
									return codeMsg;
								}
							}
						}
						//其次来判断是否为数字
						if(isNumberObject(o)){
							//判断是否规定检查最小值
							if(annotation.requiredMinValue()){
								if(Double.valueOf(o.toString()) < annotation.minValue()){
									log.info("herer3 ="+o);
									CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
									codeMsg.setMsg(annotation.errorMinValueMsg());
									return codeMsg;
								}
							}
							//判断是否规定检查最大值
							if(annotation.requiredMaxValue()){
								if(Double.valueOf(o.toString()) > annotation.maxValue()){
									log.info("herer4 ="+o);
									CodeMsg codeMsg = CodeMsg.VALIDATE_ENTITY_ERROR;
									codeMsg.setMsg(annotation.errorMaxValueMsg());
									return codeMsg;
								}
							}
						}
					} catch (IllegalArgumentException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		return CodeMsg.SUCCESS;
	}
	
	/**
	 * 检查对象是否是数字类型
	 * @param object
	 * @return
	 */
	public static boolean isNumberObject(Object object){
		if(object instanceof Integer)return true;
		if(object instanceof Long)return true;
		if(object instanceof Float)return true;
		if(object instanceof Double)return true;
		return false;
	}
}
