$(function($){
	$.ajax({
		type:"post",
		url:"/Test/one/address.json",
		dataType:"json",
		success:function(address){
			$.each(address.province,function(index,obj){
				$("#province").append("<option value="+obj.name+">"+obj.name+"</option>");
			}); 
		}
	});
	$("#province").change(function(){
		var select = document.getElementById("province");
		var index1 = select.selectedIndex;
		$.ajax({
			url:"/Test/one/address.json",
			type:"post",
			dataType:"json",
			success:function(address){
				$("#city").empty();
				$("#city").append("<option>请选择</option>");
				$.each(address.province[index1-1].city,function(index,obj){
					$("#city").append("<option value="+obj.name+">"+obj.name+"</option>");
				});
		    }
	    });
	});
	$("#city").change(function(){
		var select = document.getElementById("province");
		var index1 = select.selectedIndex;
		var select1 = document.getElementById("city");
		var index2 = select1.selectedIndex;
		$.ajax({
			url:"/Test/one/address.json",
			type:"post",
			dataType:"json",
			success:function(address){
				$("#area").empty();
				$("#area").append("<option>请选择</option>");
				$.each(address.province[index1-1].city[index2-1].area,function(index,obj){
					$("#area").append("<option value="+obj+">"+obj+"</option>");
				});
		    }
	    });
	});
});