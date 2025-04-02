package com.yuanlrc.base.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import com.yuanlrc.base.bean.Result;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.CustomPageResponse;
import com.yuanlrc.base.bean.ExcelExporter;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.admin.Article;
import com.yuanlrc.base.entity.admin.User;
import com.yuanlrc.base.service.admin.ArticleService;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.UserService;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;


/**
 * @author jack(jimke127@126.com)
 * @Date 2025-03-31 19:19:48    
 *
 */
@RequestMapping("/article")
@Controller
public class ArticleController {
	
	private  Logger log = LoggerFactory.getLogger(ArticleController.class);
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OperaterLogService operaterLogService;
	
	@Autowired
	private ExcelExporter excelExporter;
	
	@Value("${sping.show.page.size}")
	private Integer showPageSize;
	
	@Value("${sping.page.size}")
	private Integer pageSize;
	
	@Value("${ylrc.database.backup.dir}")
	private String backUpDir;
	
	@RequestMapping(value="/index")
	public String list(Model model,@RequestParam(name="pageNum",defaultValue = "1")Integer pageNum) {
		model.addAttribute("title", "文章列表");
		Page<Article> pageData = articleService.findAllBySf(null,null,null,pageNum-1,pageSize);

	    List<Integer> pagelist = StringUtil.pages(pageData.getTotalPages(), pageNum-1, showPageSize);
	     
		model.addAttribute("pageData",new CustomPageResponse<>(pageData,pageNum,showPageSize,pagelist,"/article/index"));

		return "admin/article/index";
		
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(Model model){
		model.addAttribute("users", userService.findAll());
		return "admin/article/add";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> add(Article article){
		CodeMsg validate = ValidateEntityUtil.validate(article);
		if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
			return Result.error(validate);
		}
		if(article.getUser() == null || article.getUser().getId() == null){
			return Result.error(CodeMsg.ADMIN_USER_ROLE_EMPTY);
		}
		//到这说明一切符合条件，进行数据库新增
		if(articleService.save(article) == null){
			return Result.error(CodeMsg.ADMIN_USE_ADD_ERROR);
		}

		operaterLogService.add("添加文章，标题为：" + article.getTitle());
		return Result.success(true);
	}
	
	@RequestMapping(value="/export",method=RequestMethod.GET)
	@ResponseBody
	public Result<String> exportArticle(HttpServletResponse response) throws IOException {
		Page<Article> pageData = articleService.findAllBySf(null,null,null,0,1000);
		List<Article> articles = pageData.getContent();
		//List<Article> articles = articleService.findAll();
		List<List<String>> map2D = new ArrayList<>();
		for (Article a : articles) {
			List<String> row1 = new ArrayList<String>();
			row1.add(a.getUser().getUsername());
	        row1.add(a.getTitle());
	        row1.add(a.getContents());
	        row1.add("1".equals(String.valueOf(a.getStatus())) ? "正常" : "无效");
	        map2D.add(row1);
		}
		List<String> excelHeader = Arrays.asList("作者","标题","内容","状态");
		String filename = "article";
	
		try {
			//log.info(articles.toString());
			String f = excelExporter.exportToExcel(excelHeader,map2D, filename); 
			return Result.success(f);
		}catch (Exception e){
		
			return Result.error(CodeMsg.DATA_ERROR);
		}
		
        
	}
	
    @RequestMapping(value = "/import", method = RequestMethod.POST)
    @ResponseBody
    public String importExcel(@RequestParam("file") MultipartFile file) {
        try (java.io.InputStream inputStream = file.getInputStream()) {
            List<Article> userList = new ArrayList<>();
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            Iterator<Row> iterator = sheet.iterator();
 
            // 跳过表头
            if (iterator.hasNext()) {
                iterator.next();
            }
 
            while (iterator.hasNext()) {
                Row row = iterator.next();
                Article user = new Article();
                Cell cell = row.getCell(0);
                User user2 = userService.findByUsername(cell.getCellType() == CellType.NUMERIC ? String.valueOf(cell.getNumericCellValue()) : cell.getStringCellValue());
                user.setUser(user2);
                
                Cell cell_1 = row.getCell(1);
                String t = cell_1.getCellType() == CellType.NUMERIC ? String.valueOf(cell_1.getNumericCellValue()) : cell_1.getStringCellValue();
                user.setTitle(t);
                
                Cell cell_2 = row.getCell(2);
                String c = cell_2.getCellType() == CellType.NUMERIC ? String.valueOf(cell_2.getNumericCellValue()) : cell_2.getStringCellValue();
                user.setContents(String.valueOf(c));
                
                Cell cell_3 = row.getCell(3);
                Integer s = cell_3.getCellType() == CellType.NUMERIC ? (int) cell_3.getNumericCellValue() : Integer.valueOf(cell_3.getStringCellValue());
                user.setStar(s);
                
        
                articleService.save(user);
                userList.add(user);
                
            }
 
            // 处理导入的数据，例如保存到数据库
            //processUserData(userList);
 
            return "导入成功，共导入 " + userList.size() + " 条数据";
        } catch (IOException e) {
            e.printStackTrace();
            return "导入失败: " + e.getMessage();
        }
    }
}
