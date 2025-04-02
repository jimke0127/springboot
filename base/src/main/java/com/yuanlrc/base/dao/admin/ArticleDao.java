package com.yuanlrc.base.dao.admin;
/**
 * @author jack(jimke127@126.com)
 * @Date 2025-03-31 19:29:24    
 *
 */

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.yuanlrc.base.entity.admin.Article;

@Repository
public interface ArticleDao extends JpaRepository<Article,Long>{
	


	@Query("select r from Article r where r.id = :id")
	Article find(@Param("id")Long id);

	Page<Article> findAll(Specification<Article> sf, Pageable pageable);
	

}
