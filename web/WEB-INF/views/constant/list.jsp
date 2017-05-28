<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
   
      	 <div style="padding-top: 10px;">
	         <table class="table table-bordered table-striped">
	            <thead>
	              <tr>
	                <th>No</th>
	                <th>常量类型</th>
	                <th>常量名称</th>
	                <th>父节点</th>
	                <th>排序</th>
	                <th>附加属性1</th>
	                <th>附加属性2</th>
	                <th>附加属性3</th>
	                <th>操作</th>
	              </tr>
	            </thead>
	            <tbody>
	            	<c:forEach var="company" items="${constantResultList}" varStatus="status">
		               <tr>
		                <td>${status.count+(page-1)*30}</td>
		                <td>${company.constantType}</td>
		                <td>${company.constantName}</td>
		                <td>${company.parentNo}</td>
		                <td>${company.sort}</td>
		                <td>${company.attribute1}</td>
		                <td>${company.attribute2}</td>
		                <td>${company.attribute3}</td>
		                <td>
		                	<button id="detailBtn" class="btn btn-primary" type="button" data-toggle="modal" data-target="#detailModal" onclick="goUpdate('${company.constantNo}', '${company.constantType}')">修改</button>
							<button id="deleteBtn" class="btn btn-primary" type="button" onclick="goDelete('${company.constantNo}', '${company.constantType}')">删除</button>
		                </td>
		              </tr>
	            	</c:forEach>
	            </tbody>
	         </table>
         </div>
		 <div id="alertDiv"></div>
          <div class="text-center">
                <ul id="pagination-demo" class="pagination-sm pagination">
               </ul>
          </div>		
<script src="/js/common/jquery/jquery-1.11.1.min.js"></script>          
<script type="text/javascript" src="/js/common/jquery/jquery.twbsPagination.min.js" charset="UTF-8"></script>

<script type="text/javascript">
	
	function goDelete(constantNo, constantType) {
    	identification.constant.goDelete(constantNo, constantType);
	};
	
	function goUpdate(constantNo, constantType) {
		identification.constantUpdate.goDetail(constantNo, constantType);
	};
	
	$('#pagination-demo').twbsPagination({
	    totalPages: '${totalPage}',
	    startPage: '${page}',
	    visiblePages: 30,
	    onPageClick: function (event, page) {
	    	$("#page").val(page);
		    event.preventDefault();
	    	goPage(page);
	    }
	});
 </script>