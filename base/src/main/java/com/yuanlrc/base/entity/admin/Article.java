package com.yuanlrc.base.entity.admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.yuanlrc.base.annotion.ValidateEntity;

/**
 * 后台用户实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_article")
@EntityListeners(AuditingEntityListener.class)
public class Article extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;// 文章作者
	
	@ValidateEntity(required=true,requiredLeng=true,minLength=4,maxLength=128,errorRequiredMsg="标题不能为空!",errorMinLengthMsg="标题长度需大于4!",errorMaxLengthMsg="标题长度不能大于128!")
	@Column(name="title",nullable=false,length=128,unique=true)
	private String title;//标题
	
	@ValidateEntity(required=true)
	@Column(name="contents",nullable=false,columnDefinition = "TEXT")
	private String contents;//登录密码
	
	@ValidateEntity(required=false)
	@Column(name="status",length=1)
	private int status = 1;//文章状态,默认可用
	
	@ValidateEntity(required=false)
	@Column(name="star",length=1)
	private int star;
	
	@ValidateEntity(required=false)
	@Column(name="head_pic",length=128)
	private String headPic;//主图


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	@Override
	public String toString() {
		return "Article [user=" + user + ", title=" + title + ", contents=" + contents + ", status=" + status
				+ ", headPic=" + headPic + "]";
	}


	


	
	
	
}
