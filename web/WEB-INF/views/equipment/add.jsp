<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html> 
<head>
<title>request</title>

<c:import url="/WEB-INF/views/common/commonCss.jsp"></c:import>
</head>
<body>
 <div class="container	">
    <c:import url="/WEB-INF/views/common/navgate.jsp"></c:import>
	<div class="panel panel-primary">
	  <div class="panel-heading">设备添加</div>
	  <div class="panel-body"> 
      <form class="form-horizontal" role="form">
             <fieldset>
                <div class="form-group">
                  <div class="col-md-1">
                  <button type="button" class="btn btn-primary btn-sm" id="saveEquipmentBtn">保存设备</button>
                  </div>                  
               </div>  
            </fieldset>   
           <fieldset>
              <legend> </legend>
              <div class="form-group">
                 <label class="col-md-1 control-label" for="equipmentName">设备名称</label>
                 <div class="col-md-2">                
                    <input class="form-control" id="equipmentName" type="text"/>
                 </div>  
                 <label class="col-md-1 control-label" for="company">专业</label>
                 <div class="col-md-2">                
					<select  class="form-control" id="groupNo">
					 <option selected value=""></option>				
					  <c:forEach var="constant" items="${constants}" varStatus="status">
						  <option value="${constant.constantNo}">${constant.constantName}</option>
					  </c:forEach>					 
					</select>
                 </div>
                 
                 <label class="col-md-1 control-label" for="company">专业类别</label>
                 <div class="col-md-2">                
					<select  class="form-control" id="subGroupNo">
					 <option selected value=""></option>				
					    <c:forEach var="constant" items="${constantsChild}" varStatus="status">
						  <option value="${constant.constantNo}">${constant.constantName}</option>
					  </c:forEach>					 
					</select>
                 </div>    
                 <label class="col-md-1 control-label" for="company">排序</label>
                   <div class="col-md-2">   
			             <input class="form-control" value ="" id="sort"/>
			     </div> 
			     <label class="col-md-1 control-label" for="company">备注</label>
			 	   <div class="col-md-2">   
			            <input class="form-control" type="text" id="remark"/>
			            
			     </div>          
              </div>
           </fieldset>     
<!--            <fieldset>             
               <div class="form-group">
                 <div class="col-md-*">
					<table class="table table-hover table-bordered" id="applicationDetailTable">
					      <thead>
					        <tr>
					          <th>设备名称</th>
					          <th>专业</th>
					          <th>专业类别</th>
					          <th>修别</th>
					          <th>备注</th>
					          <th>操作</th>
					        </tr>
					      </thead>
					      <tbody id="equipmentDetailBody">
					      </tbody>
					    </table>
                 </div>             
               </div>
           </fieldset>
 -->       </form>
	  </div>
	</div>
</div>	
<div id="alertDiv"></div>
</body>

<script id="detailTemplate" type="text/x-jquery-tmpl">
<tr id="tr{{= no}}" data-no="{{= no}}" class="addTr">
 	<td>
         <input type="text" value ="" id="equipmentName{{= no}}"／>
    </td>
	<td style="width:150px;">
	<select  class="form-control" id="groupNo{{= no}}">
        <option selected value=""></option>
        {{each parentConstants}} <option value="{{= $value.constantNo}}">{{= $value.constantName}}</option>{{/each}}
	</select>    
	</td>
	<td style="width:150px;">
	<select  class="form-control" id="subGroupNo{{= no}}">
        <option selected value=""></option>
        {{each childrenConstants}} <option value="{{= $value.constantNo}}">{{= $value.constantName}}</option>{{/each}}
	</select>    
	</td>
	<td>
         <input type="text" value ="" id="sort{{= no}}"／>
    </td> 
	</td>
 	<td>
         <input type="text" value ="" id="remark{{= no}}"／>
    </td>
    <td>
         <button type="button" class="btn btn-primary btn-sm deleteClass"  id="delete{{= no}}" data-no="{{= no}}">删除</button>
    </td>					  
</tr>
</script>
<c:import url="/WEB-INF/views/common/commonScript.jsp"></c:import>  
   <script type="text/javascript" src="/js/identification/equipment/equipmentAdd.js" charset="UTF-8"></script>	    
   <script type="text/javascript">
   identification.equipment = new Identification.equipment.Add();
</script>
</html>
		
		
