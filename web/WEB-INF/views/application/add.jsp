<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head>
<title>request</title>
<link rel="stylesheet" href="/css/jquery/autocomplete.min.css">
<c:import url="/WEB-INF/views/common/commonCss.jsp"></c:import>
<link rel="stylesheet" href="/css/jquery/jquery.fileupload.css">
<style type="text/css">
    .ui-autocomplete{
        display:block;
        z-index:99999;
        width: 200px;
    }
    
 .ui-widget {
	font-family: Arial,Helvetica,sans-serif;
	font-size: 1em;
}
.ui-widget .ui-widget {
	font-size: 1em;
}
.ui-widget input,
.ui-widget select,
.ui-widget textarea,
.ui-widget button {
	font-family: Arial,Helvetica,sans-serif;
	font-size: 1em;
}
.ui-widget.ui-widget-content {
	border: 1px solid #c5c5c5;
}
.ui-widget-content {
	border: 1px solid #dddddd;
	background: #ffffff;
	color: #333333;
}
.ui-widget-content a {
	color: #333333;
}
.ui-widget-header {
	border: 1px solid #dddddd;
	background: #e9e9e9;
	color: #333333;
	font-weight: bold;
}
.ui-widget-header a {
	color: #333333;
}
    
.ui-menu {
	list-style: none;
	padding: 0;
	margin: 0;
	display: block;
	outline: 0;
}
.ui-menu .ui-menu {
	position: absolute;
}
.ui-menu .ui-menu-item {
	margin: 0;
	cursor: pointer;
	/* support: IE10, see #8844 */
	list-style-image: url("data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7");
}
.ui-menu .ui-menu-item-wrapper {
	position: relative;
	padding: 3px 1em 3px .4em;
}
.ui-menu .ui-menu-divider {
	margin: 5px 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	border-width: 1px 0 0 0;
}
.ui-menu .ui-state-focus,
.ui-menu .ui-state-active {
	margin: -1px;
}    
</style>
</head>
<body>
 <div class="container">
    <c:import url="/WEB-INF/views/common/navgate.jsp"></c:import>
	<div class="panel panel-primary">
	  <div class="panel-heading">申请注册</div>
	  <div class="panel-body"> 
      <form class="form-horizontal" role="form">
             <fieldset>
                <div class="form-group">
                  <div class="col-md-10">
                  <button type="button" class="btn btn-primary btn-sm" id="addApplicationDetailBtn">添加详情</button>
                  <span style="color:blue; font-size:5px">*可多次添加</span>
                  </div>
                  <div class="col-md-1">
                  <button type="button" class="btn btn-primary btn-sm" id="saveApplicationBtn">保存申请</button>
                  </div>                  
               </div>  
            </fieldset>   
           <fieldset>
              <legend> </legend>
              <div class="form-group">
                 <label class="col-md-1 control-label"  for="company" id="companyLable">申请单位</label>
                 <div class="col-md-3">   
                  <input type="text" class="form-control"  id="company"/>             
					  <select  class="form-control" id="companySelect" style="display:none">
					  <c:forEach var="company" items="${companys}" varStatus="status">
						  <option value="${company.companyNo}">${company.companyName}</option>
					  </c:forEach>					 
					</select>
                 </div>
                 
                 <label class="col-md-1 control-label" for="department">代表机构</label>
                 <div class="col-md-3">                
                    <input class="form-control" id="department" type="text"/>
                 </div>    
                 
              
                 <label class="col-md-1 control-label" for="expert">专家</label>
                 <div class="col-md-3">    
					<div class="input-group">
					      <input type="text" class="form-control" id="expert" readonly="true"/>
					      <span class="input-group-btn">
					        <button class="btn btn-default" type="button" data-toggle="modal" data-target="#expertModal">...</button>
					      </span>
					</div><!-- /input-group -->
                    
					<select  class="form-control" id="expertSelect" style="display:none">
					 <option selected value=""></option>				
					  <c:forEach var="expert" items="${experts}" varStatus="status">
						  <option value="${expert.expertNo}">${expert.expertName}</option>
					  </c:forEach>					 
					</select>
                </div>
              
             </div> 
              <div class="form-group">
                <label class="col-md-1 control-label" for="applicationDate">申请日期</label>
                 <div class="col-md-3">
                    <span class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="applicationDate" data-link-format="yyyy-mm-dd">
                    <input class="form-control"  type="text" value="" >
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </span>
				     <input type="hidden" id="applicationDate" value="" />
                 </div>     
                 
                 <label class="col-md-1 control-label" for="department">申请文件</label>
                 
				<div class="col-md-3">
		 			<span class="btn btn-default  btn-sm fileinput-button">
				        <i class="glyphicon glyphicon-plus"></i>
				        <span>选择文件</span>
				        <!-- The file input field used as target for the file upload widget -->
				         <input id="requestFileupload"  type="file" name="file" multiple>
				    </span>
				    <span>
				     <span id="requsetFileNameSpan"></span>
				     <input type="hidden" id="requsetFileIdHid"/>
				    </span>
				</div>     
				            
                <label class="col-md-1 control-label" for="department">结论文件</label>
				<div class="col-md-3">
		 			<span class="btn btn-default btn-sm fileinput-button">
				        <i class="glyphicon glyphicon-plus"></i>
				        <span>选择文件</span>
				        <!-- The file input field used as target for the file upload widget -->
				         <input id="resultFileupload"  type="file" name="file" multiple>
				    </span>
				    <span>
				     <span id="resultFileNameSpan"></span>
				     <input type="hidden" id="resultFileIdHid"/>
				    </span>				    
				</div>                                           
              </div>
              
           </fieldset>     
           <fieldset>             
               <div class="form-group container" style="margin-left:-25px">
                 <div class="col-md-12">
					<table class="table table-hover table-bordered" id="applicationDetailTable">
                          <colgroup>
                            <col/>  
                            <col  style="width:80px"/>  
                            <col  style="width:80px"/>  
                            <col  style="width:80px"/>  
                            <col  style="width:160px"/>  
                            <col  style="width:120px"/>  
                            <col  style="width:50px"/>  
					       </colgroup>					
					      <thead>
					        <tr>
					          <th id="equipmentTh">设备</th>
					          <th>修理级别</th>
					          <th>结果</th>
					          <th>整改标记</th>
					          <th>有效期期</th>
					          <th>备注</th>
					          <th>操作</th>
					        </tr>
					      </thead>
					      <tbody id="applicationDetailBody">
					      </tbody>
					    </table>
                 </div>             
               </div>
           </fieldset>
       </form>
	  </div>
	</div>
</div>	
<div id="alertDiv"></div>

 <!-- import Modal -->
		<div class="modal fade" id="expertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog" style="width:900px">
		    <form method="post">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">专家选择</h4>
		      </div>
		      
		      	<c:import url="/WEB-INF/views/application/chooseExpert.jsp" charEncoding="UTF-8"></c:import>  	      
		    </div>
		    </form>
		  </div>


     </div> 	
 
    <div class="modal-backdrop fade in" style="display:none" id="loading">
		  <div class="loading"></div>  
	 </div>
	 
	 <div>
	 	<input type="hidden" id="expertsNo"/>
	 	<input type="hidden" id="leaderNo"/>
	 </div>
</body>



<script id="detailTemplate" type="text/x-jquery-tmpl">
<tr id="tr{{= no}}" data-no="{{= no}}" class="addTr">
	<td>
    <input type="text" class="form-control equipment"  id="equipment{{= no}}"/>  
	<select  class="form-control" id="equipmentSelect{{= no}}"style= "display:none">
        <option selected value=""></option>
        {{each equipments}} <option value="{{= $value.equipmentNo}}">{{= $value.equipmentName}}</option>{{/each}}
	</select>    
	<td style="width:100px;">	
	<select  class="form-control" id="repairLevel{{= no}}">
         <option selected value=""></option>
        {{each repairLevels}} <option value="{{= $value.constantNo}}">{{= $value.constantName}}</option>{{/each}}
	</select>  
	
	</td>
	<td>
	<input type="radio" name="result{{= no}}" value="1">合格<br>
	<input type="radio" name="result{{= no}}" value="0">不合格
	</td>								  
	<td>
	<input type="radio" name="isReform{{= no}}" value="1">整改<br>
	<input type="radio" name="isReform{{= no}}" value="0">无整改
	</td>	
	<td>
	<span class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd" data-link-field="timeLimit{{= no}}" data-link-format="yyyy-mm-dd">
	<input class="form-control"  type="text" value="" >
	<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
	</span>
		<input type="hidden" id="timeLimit{{= no}}" value="" />
	</td>
    <td>
         <input type="text" value ="" id="remark{{= no}}"／>
    </td>		
    <td>
         <button type="button" class="btn btn-primary btn-sm deleteClass"  id="delete{{= no}}" data-no="{{= no}}">删除</button>
    </td>					  
</tr>
</script>

<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="/js/common/vendor/jquery.ui.widget.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="/js/common/jquery/jquery.iframe-transport.js"></script>
<script src="/js/common/jquery/jquery.ui.js"></script>
<!-- The basic File Upload plugin -->
<script src="/js/common/jquery/jquery.fileupload.js"></script>
   <script type="text/javascript" src="/js/identification/application/applicationAdd.js" charset="UTF-8"></script>	    
   <script type="text/javascript">
   identification.applicationAdd = new Identification.application.Add();
</script>
</html>
		
		
