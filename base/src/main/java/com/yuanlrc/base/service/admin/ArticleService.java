package com.yuanlrc.base.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import javax.persistence.criteria.Predicate;

import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.yuanlrc.base.dao.admin.ArticleDao;
import com.yuanlrc.base.entity.admin.Article;
import javax.persistence.criteria.JoinType;

/**
 * @author jack(jimke127@126.com)
 * @Date 2025-03-31 19:32:24    
 *
 */
@Service
public class ArticleService {
	
	@Autowired
	private ArticleDao articleDao;
	
	public List<Article> findAll(){
		return articleDao.findAll();
	}

	public Article save(Article article) {
		// TODO Auto-generated method stub
		return articleDao.save(article);
	}
	public Page<Article> findAllBySf(Integer star, Integer userid, String kd, Integer pageNo, Integer pageSize) {
		
		//动态查询
        Specification<Article> sf = (Specification<Article>) (root, query, cb) -> {
            //用于添加所有查询条件
            List<Predicate> p = new ArrayList<>();
            if (null != star) {
                Predicate p1 = cb.equal(root.get("star").as(Integer.class), star);
                p.add(p1);
            }
            if (null != userid) {
                //Predicate p2 = cb.greaterThan(root.get("user").as(Integer.class), userid);
            	Predicate p2 = cb.equal(root.join("user", JoinType.INNER).get("id"), userid);
                p.add(p2);
            }
            if (!StringUtils.isEmpty(kd)) {
                Predicate p3 = cb.like(root.get("title").as(String.class), "%" + kd + "%");
                p.add(p3);
            }
            Predicate[] pre = new Predicate[p.size()];
            Predicate and = cb.and(p.toArray(pre));     //查询条件 and
            //Predicate or = cb.or(p.toArray(pre));       //查询条件 or
            query.where(and);       //添加查询条件


            return query.getRestriction();
        };
        Pageable pageable = PageRequest.of(pageNo, pageSize,Sort.by("star").descending());
        return articleDao.findAll(sf, pageable);
		
	}
}
