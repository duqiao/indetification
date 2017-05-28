<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<div class="modal-body">   
<div class="container-fluid">
<div class="row">
	<div class="col-md-* col-xs-* col-sm-*">
	    <div class="row">
	      <div class="panel-body"> 
	           <fieldset>
	              <div class="form-group">
	                 <label class="col-md-2 control-label" for="detailConstantName">常量名称</label>
	                 <div class="col-md-2">
	                    <input type="text" class="form-control" id="detailConstantName">
	                 </div>
	                 
	                 <label class="col-md-2 control-label" for="detailParentNo">父节点</label>
	                 <div class="col-md-2">
	                   <select  class="form-control" id="detailParentNo">
						 <option selected value=""></option>				
						  <c:forEach var="constant" items="${constants}" varStatus="status">
							  <option value="${constant.constantNo}">${constant.constantName}</option>
						  </c:forEach>					 
						</select>
	                 </div>
	                 
	                 <label class="col-md-2 control-label" for="detailSort">排序</label>
	                 <div class="col-md-2">
	                    <input type="text" class="form-control" id="detailSort">
	                 </div>
	              </div>
	           </fieldset>
	           <fieldset style="margin-top:10px">
	              <div class="form-group">  
	                 <label class="col-md-2 control-label" for="detailAttribute1">说明1</label>
	                 <div class="col-md-2" >
	                    <input type="text" class="form-control" id="detailAttribute1">
	                 </div>
	                 
	                 <label class="col-md-2 control-label" for="detailAttribute2">说明2</label>
	                 <div class="col-md-2" >
	                    <input type="text" class="form-control" id="detailAttribute2">
	                 </div>
	                 
	                 <label class="col-md-2 control-label" for="detailAttribute3">说明3</label>
	                 <div class="col-md-2" >
	                    <input type="text" class="form-control" id="detailAttribute3">
	                 </div>
	                         
	              </div>
	           </fieldset>
	           <fieldset style="margin-top:10px">
	              <div class="form-group">
	                  <div class="col-md-1">
	                  <button type="button" class="btn btn-primary btn-sm" id="updateConstantBtn">保存</button>
	                  </div>                  
	               </div>  
	            </fieldset>       
		  </div>
		  
	    </div>
	</div>
</div>
<div id="updateCondition">
 	<input type="hidden" id="detailConstantTypeHide" value=""/>
 	<input type="hidden" id="detailConstantNoHide" value=""/>
 </div>
<c:import url="/WEB-INF/views/common/commonScript.jsp"></c:import>   
<script type="text/javascript" src="/js/identification/constant/update.js" charset="UTF-8"></script>	    
<script type="text/javascript">
 identification.constantUpdate = new Identification.constant.Update();
</script>
