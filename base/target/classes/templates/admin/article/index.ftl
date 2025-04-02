<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, article-scalable=no" />
<title>${siteName!""}|文章管理-${title!""}</title>
<#include "../common/header.ftl"/>
<style>
td{
	vertical-align:middle;
}
</style>
</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-toolbar clearfix">
                <form class="pull-right search-bar" method="get" action="list" role="form">
                  <div class="input-group">
                    <div class="input-group-btn">
                      <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                      文章名 <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="title">文章标题</a> </li>
                      </ul>
                    </div>
                    <input type="text" class="form-control" value="" name="articlename" placeholder="请输入文章名">
                  	<span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                  </div>
                </form>
                <#include "../common/third-menu.ftl"/>
              </div>
              <div class="card-body">
                
                <div class="table-responsive">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" id="check-all"><span></span>
                          </label>
                        </th>
                        <th>主图</th>
                        <th>文章标题</th>
                        <th>摘要</th>
                        <th>状态</th>
                        <th>作者</th>
                        <th>添加时间</th>
                      </tr>
                    </thead>
                    <tbody>
                      <#if pageData?size gt 0>
                      <#list pageData.content.content as article>
                      <tr>
                        <td style="vertical-align:middle;">
                          <label class="lyear-checkbox checkbox-primary">
                            <input type="checkbox" name="ids[]" value="${article.id}"><span></span>
                          </label>
                        </td>
                        <td style="vertical-align:middle;">
                        	<#if article.headPic??>
                        		<#if article.headPic?length gt 0>
                        		<img src="/photo/view?filename=${article.headPic}" width="60px" height="60px">
                        		<#else>
                        		<img src="/admin/images/default-head.jpg" width="60px" height="60px">
                        		</#if>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">${article.title}</td>
                        <td style="vertical-align:middle;">${article.contents}</td>
                        
                        <td style="vertical-align:middle;">
                        	<#if article.status == 1>
                        	<font class="text-success">正常</font>
                        	<#else>
                        	<font class="text-warning">冻结</font>
                        	</#if>
                        </td>
                        <td style="vertical-align:middle;">${article.user.username}</td>
                        
                        <td style="vertical-align:middle;" style="vertical-align:middle;"><font class="text-success">${article.createTime}</font></td>
                      </tr>
                    </#list>
                    <#else>
                    <tr align="center"><td colspan="9">这里空空如也！</td></tr>
					</#if>
                    </tbody>
                  </table>
                </div>
                <div>	
					<ul class="pagination ">
	                  <#if pageData.currentPage == 1>
	                  <li class="disabled"><span>«</span></li>
	                  <#else>
	                  <li><a href="${pageData.url}?pageNum=1">«</a></li>
	                  </#if>
	                  <#list pageData.pagelist as showPage>
	                  <#if pageData.currentPage == showPage+1>
	                  <li class="active"><span>${showPage+1}</span></li>
	                  <#else>
	                  <li><a href="${pageData.url}?pageNum=${showPage+1}">${showPage+1}</a></li>
	                  </#if>
	                  </#list>
	                  <#if pageData.currentPage == pageData.totalPages>
	                  <li class="disabled"><span>»</span></li>
	                  <#else>
	                  <li><a href="${pageData.url}?pageNum=${pageData.totalPages}">»</a></li>
	                  </#if>
	                  <li><span>共${pageData.totalPages}页,${pageData.totalElements}条数据</span></li>
	                </ul>
			    </div>
                
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content center-block" style="height:150px">
      <div style="padding:10px 0 0 10px">下载成功！</div>
      <div style="padding:10px 0 0 10px" id="download_sus"></div>
    </div>
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
});
function del(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行删除！');
		return;
	}
	var id = $("input[type='checkbox']:checked").val();
	$.confirm({
        title: '确定删除？',
        content: '删除后数据不可恢复，请慎重！',
        buttons: {
            confirm: {
                text: '确认',
                action: function(){
                    deleteReq(id,url);
                }
            },
            cancel: {
                text: '关闭',
                action: function(){
                    
                }
            }
        }
    });
}
function exportt(url){

	ajaxRequest(url,'get',{},function(rst){
		if(rst.code == 0){
		$("#download_sus").html('<a href="/photo/viewExcel?filename='+rst.data+'">'+rst.data+'</a>');
			$('#myModal').modal('show');
		}
			
	});
}
//打开编辑页面
function edit(url){
	if($("input[type='checkbox']:checked").length != 1){
		showWarningMsg('请选择一条数据进行编辑！');
		return;
	}
	window.location.href = url + '?id=' + $("input[type='checkbox']:checked").val();
}
//调用删除方法
function deleteReq(id,url){
	$.ajax({
		url:url,
		type:'POST',
		data:{id:id},
		dataType:'json',
		success:function(data){
			if(data.code == 0){
				showSuccessMsg('文章删除成功!',function(){
					$("input[type='checkbox']:checked").parents("tr").remove();
				})
			}else{
				showErrorMsg(data.msg);
			}
		},
		error:function(data){
			alert('网络错误!');
		}
	});
}
</script>
</body>
</html>