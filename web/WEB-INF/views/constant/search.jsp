<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
	<head> 
	    <meta charset="utf-8">
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <c:import url="/WEB-INF/views/common/commonCss.jsp"></c:import>
	</head>
	<body>
		<div class="container">
			<c:import url="/WEB-INF/views/common/navgate.jsp"></c:import>

	<div class="panel panel-primary">
	  <div class="panel-heading">常量信息检索</div>
		  <div class="panel-body"> 
		  
           <fieldset>
              <legend> </legend>
              <div class="form-group">
                 <label class="col-md-1 control-label" for="constantType">常量类型</label>
                 <div class="col-md-2">                
					<select  class="form-control" id="constantType">
					 <option selected value=""></option>				
					 <option value="P_TYPE">专业</option>
					 <option value="C_TYPE">子专业</option>
					 <option value="REPAIR_LEVEL">检修级别</option>
					</select>
                 </div>
                 
                 <label class="col-md-1 control-label" for="constantName">常量名称</label>
                 <div class="col-md-2">
                    <input type="text" class="form-control" id="constantName" name="constantName">
                 </div>
                 
                 <label class="col-md-1 control-label" for="parentNo">父节点</label>
                 <div class="col-md-2">
                   <select  class="form-control" id="parentNo">
					 <option selected value=""></option>				
					  <c:forEach var="constant" items="${constants}" varStatus="status">
						  <option value="${constant.constantNo}">${constant.constantName}</option>
					  </c:forEach>					 
					</select>
                 </div>
           </fieldset>
           
           <fieldset style="margin-top:10px">
              <div class="form-group">
	              <div class="col-md-1" style="float:right">
		            	<button id="searchBtn" class="btn btn-primary">查询</button>
		          </div>
	          </div>
           </fieldset>  		  
 
	       	<div id="constantResultList">
	       	<c:import url="/WEB-INF/views/constant/list.jsp" charEncoding="UTF-8"></c:import>  
	       	</div>
      	
      	 <!-- import Modal   -->	
      <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
      	<div class="modal-dialog" style="width:900px">
      		<form method="post">
      			<div class="modal-content">
      				<div class="modal-header">
      					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        		<h4 class="modal-title" id="detailModalLabel">常量信息</h4>
      				</div>
				<c:import url="/WEB-INF/views/constant/update.jsp" charEncoding="UTF-8"></c:import>
				</div>
			</form>
		</div>
	  </div>
      <div class="modal-backdrop fade in" style="display:none" id="loading">
		<div class="loading"></div>  
	  </div>
      
	      </div>
      </div>
      </div>

 <div id="searchCondition">
 	<input type="hidden" id="page" value="1"/>
 	<input type="hidden" id="constantTypeHide" value=""/>
 	<input type="hidden" id="constantNoHide" value=""/>
 	<input type="hidden" id="constantNameHide" value=""/>
 	<input type="hidden" id="parentNoHide" value=""/>
 </div>		

	    <script type="text/javascript" src="/js/identification/constant/constant.js" charset="UTF-8"></script> 	    
	    <script type="text/javascript">
	    identification.constant = new Identification.constant.List();

	    function goPage() {
	    	identification.constant.searchList();
		}
      </script>

	  </body>
</html>

