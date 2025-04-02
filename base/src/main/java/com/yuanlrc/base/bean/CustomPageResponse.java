package com.yuanlrc.base.bean;
import java.util.List;

/**
 * @author jack(jimke127@126.com)
 * @Date 2025-04-01 12:00:14    
 *
 */
import org.springframework.data.domain.Page;

public class CustomPageResponse<T> {
	 private Page<T> content;
	    private int totalPages;
	    private long totalElements;
	    private int pageNumber;
	    private int pageSize;
	    private int currentPage;
	    private int showPageSize;
	    private List<Integer> pagelist;
	    private String url;
	 
	    // 构造方法、getter和setter
	    public CustomPageResponse(Page<T> content,Integer currentPage,Integer showPageSize, List<Integer> pagelist,String url) {
	        this.content = content;
	        this.totalPages = content.getTotalPages();
	        this.totalElements = content.getTotalElements();
	        this.pageNumber = content.getNumber();
	        this.pageSize = content.getSize();
	        this.currentPage = (int) currentPage;
	        this.showPageSize = (int) showPageSize;
	        this.pagelist = pagelist;
	        this.url = url;
	    }

		public Page<T> getContent() {
			return content;
		}

		public void setContent(Page<T> content) {
			this.content = content;
		}

		public int getTotalPages() {
			return totalPages;
		}

		public void setTotalPages(int totalPages) {
			this.totalPages = totalPages;
		}

		public long getTotalElements() {
			return totalElements;
		}

		public void setTotalElements(long totalElements) {
			this.totalElements = totalElements;
		}

		public int getPageNumber() {
			return pageNumber;
		}

		public void setPageNumber(int pageNumber) {
			this.pageNumber = pageNumber;
		}

		public int getPageSize() {
			return pageSize;
		}

		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getShowPageSize() {
			return showPageSize;
		}

		public void setShowPageSize(int showPageSize) {
			this.showPageSize = showPageSize;
		}



		public List<Integer> getPagelist() {
			return pagelist;
		}

		public void setPagelist(List<Integer> pagelist) {
			this.pagelist = pagelist;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}
	    
}
