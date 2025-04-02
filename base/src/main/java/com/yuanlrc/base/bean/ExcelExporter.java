package com.yuanlrc.base.bean;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.yuanlrc.base.util.StringUtil;

/**
 * 导出类
 * @author jack(jimke127@126.com)
 * @Date 2025-04-01 14:36:52    
 *
 */
@Component
public class ExcelExporter {
	
	@Value("${ylrc.database.excel.dir}")
	private String excelDir;
	
    public String exportToExcel(List<String> excelHeader,List<List<String>> dataList,String sheetname) throws IOException {
        
    	File fPath = new File(excelDir);
		if(!fPath.exists()){
			//若不存在文件夹，则创建一个文件夹
			fPath.mkdir();
		}
		
    	String filename = StringUtil.getFormatterDate(new Date(), "yyyyMMddHHmmss") + ".xlsx";
    	Workbook workbook = new XSSFWorkbook(); // 创建工作簿对象
        Sheet sheet = workbook.createSheet(sheetname); // 创建工作表
        // 创建表头
        Row header = sheet.createRow(0);
        for (int i = 0; i < excelHeader.size(); i++) {
        	header.createCell(i).setCellValue(excelHeader.get(i));
        }

 
        // 填充数据
        int rowNum = 1;
        for (int i = 0; i < dataList.size(); i++) {
        	Row row = sheet.createRow(rowNum++);
        	List<String> innerList = dataList.get(i);
        	for (int j = 0; j < innerList.size(); j++) {
        		row.createCell(j).setCellValue(innerList.get(j));
        	}
        	
        }
 
        // 写入文件
        try (FileOutputStream outputStream = new FileOutputStream(excelDir+filename)) {
            workbook.write(outputStream);
            
        } finally {
            workbook.close(); // 关闭工作簿释放资源
            
        }
        return filename;
    }
}

