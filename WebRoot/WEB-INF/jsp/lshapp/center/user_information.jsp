<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html><head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <title>编辑资料</title>
    <link href="static/lshapp/css/center/app.css" rel="stylesheet" type="text/css">
	 <link rel="stylesheet" type="text/css" href="static/lshapp/css/center/weui.css" />
	 <link rel="stylesheet" type="text/css" href="static/lshapp/css/editbirthdaysytle.css" />
    <script type="text/javascript">var ROOT_URL = '/mobile/';</script>
    <script src="static/lshapp/js/goods_type.js"></script>
    <script src="static/lshapp/js/center/app.js"></script>
	<script src="static/lshapp/js/center/zepto.min.js"></script>
	<script src="static/lshapp/js/center/jquery-1.9.1.min.js"></script>
	<script src="static/lshapp/js/jquery.form.js"></script>
	<script type="text/javascript">

	</script>
    <style type="text/css">
    	.layermbox{position:absolute;left:0;top:0;width:100%;z-index:19891014}
    	.layermmain,.laymshade{position:fixed;left:0;top:0;width:100%;height:100%}
    	.layermbtn span,.layermchild{display:inline-block;position:relative}
    	.laymshade{background-color:rgba(0,0,0,.5);pointer-events:auto}
    	.layermmain{display:table;font-family:Helvetica,arial,sans-serif;pointer-events:none}
    	.layermmain .section{display:table-cell;vertical-align:middle;text-align:center}
    	.layermcont{padding:20px 15px;line-height:22px;border-radius:5px}

		.inlin{
			display:inline-block;
		}
		.user_name{
			display:inline-block;
			margin-right:0.5rem;
			padding-top: .3rem;
			font-size: 1.6rem;
			color: #333;
			line-height: normal;
			list-style: none;
			font-weight: 450;
			box-sizing: border-box;
			font-family: inherit;
		}
		.user_icon{
			width: 1.0rem;
			height: 1.0rem;
			border-radius: 0.5rem;
		}
		.user_icon1{
			width: 1.0rem;
			height: 1.0rem;
			margin-bottom: .5rem;
		}
		.return_image{
			width:1.2rem;
			height:1.8rem;
		}
		.user_list{
			background:#fff;
			padding-top: 1rem;
			padding-bottom:1rem;
			border-bottom: 1px solid #f6f6f9;
		}
		.s-user-top {
			padding: 0 1.5rem;
			position: relative;
		}
		.submint {
		height: 32px;
		width: 92%;
		/* border: 1.3px solid #00AEED; */
		border-radius: 8px;
		margin-left: 4%;
		margin-top: 30px;
		text-align: center;
		font-size: 20px;
		background-color:red;
		color: white;
		line-height:32px;
		}
		input[type="radio"] + label::before {
			content: "\a0"; /*不换行空格*/
			display: inline-block;
			vertical-align: middle;
			font-size: 16px;
			width: 1em;
			height: 1em;
			margin-right: .4em;
			border-radius: 50%;
			border: 1px solid #01cd78;
			text-indent: .15em;
			line-height: 1;
        }
		input[type="radio"]:checked + label::before {
			background-color: #01cd78;
			background-clip: content-box;
			padding: .27em;
		}
		input[type="radio"] {
			position: absolute;
			clip: rect(0, 0, 0, 0);
		}
		.z_mask {
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, .5);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 999;
           display: none;
        }
       .z_alert {
            width: 80px;
            height: 50px;
            font-size: 16px;
            text-align: center;
            position: absolute;
            left:40%;
            top: 50%;
            margin-top: -5rem;
        }
 .wenzi{
	width:100%;
	height:10%;
	margin-left:8px;
}
.imgdiv{
	height: 20px;
	width: 30px;
	float: right;
	display:none;
}



.birimgdiv{
	height: 20px;
	width: 30px;
	float: right;
	display:none;
}

.on{
    display:block;
 }
.off{
     display:none;
 }


/* div.checked{ */
/* 	display:block; */
/* } */
div.checkeds{
	display:block;
}
.switchsDiv{
	width: 62px;
	height: 40px;
	margin-left: 20%;
}

	</style>
</head>
<body style="background:#fff;">
<p style="text-align:right; display:none;"></p>
<div id="loading" style="display: none;"><img src="static/lshapp/images/center/loading.gif"></div>

<div class="con mb-7">
   <!-- <section class="search category-search common-search">
       <div class="text-all dis-box j-text-all text-all-back">
					<a class="a-icon-back j-close-search" href="javascript:history.go(-1);">
                        	<img class="return_image" src="static/lshapp/images/return.png">
                   </a>
				  <div style="text-align: center;width: 90%;" >
                        <span style="text-align: center;font-size: 1.8rem;color: #4F4F4F">编辑资料</span>
				  </div>
		</div>
  </section>
  <hr style="height:1px;border:none;border-top:1px solid #E1E1E1;width: 100%;margin-top: 0.1rem;" />
   -->

<jsp:include page="../head_title.jsp">
	<jsp:param value="编辑资料" name="pageTitle"/>
</jsp:include>
   <form action="<%=basePath%>lshapp/userCenter/update_information.do" method="post" name="Form" id="Form">
	<div class="s-user-top" style="background:#fff;margin-bottom:0.8rem;">
		<div class="user_profile_box p-r">
			<div class="dis-box t-goods1 onelist-hidden jian-top"  style="padding-top:2.5rem;padding-bottom:2.0rem;padding-left:40%;">
				<div class="user-img " style="width: 7.5rem;height: 7.5rem;" onclick="upFile()">
<!-- 					<input id="file" name="file" class="user-profile-img" style="opacity: 0" type="file"> -->

					<div class="user-head-img-box-1" style="width: 7.5rem;height: 7.5rem;border-radius: 4.5rem;">
					<c:if test="${pd.PATH !=null}"><img style="width: 7.5rem;height: 7.5rem;" id="imgId" src="<%=basePath%>uploadFiles/uploadImgs/${pd.PATH}"></c:if>
					<c:if test="${pd.PATH ==null}"><img id="imgId" src="static/lshapp/images/logo.png"></c:if>
					</div>
				</div>
			</div>
			<div style="font-size: 1.7rem;color:#ABABAB;text-align:center;padding-top:0.1rem;" >点击更换头像</div>
			<input id="PICTURE_ID" name="PICTURE_ID" type="hidden"/>
		</div>
	</div>
	<div style="background:#fff;font-size: 1.6rem;margin-left:1.5rem;color:#ABABAB;">基本资料</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 style="width: 50px;font-size: 16px;margin-top: 3px;">昵称</h3>
			<input type="text" name="NICK_NAME" id="NICK_NAME" value="${pd.NICK_NAME}" style="   font-size: 1.5rem;"/>
		</div>
	</div>



	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3  style="width: 50px;font-size: 16px;margin-top: 3px;">性别</h3>

			<input type="radio" name="SEX" id="female" value="1" <c:if test="${pd.SEX=='1'}">checked="checked"</c:if> /> <label for="female">男</label>
			&nbsp; &nbsp;&nbsp; <input type="radio" id="male" name="SEX" value="2" <c:if test="${pd.SEX=='2'}">checked="checked"</c:if>/> <label for="male">女</label>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3  style="width:50px;font-size: 16px;margin-top: 3px;">生日</h3>

				<input style="border: 0;font-size:14px;width: 280px;" value="新历:${pd.SOLAR_BIRTHDAY}  农历:${pd.LUNAR_CALENDAR }" type="text" placeholder="请选择生日"  id="SHENGRI" name="SHENGRI" readonly="readonly" onclick="showDates('${pd.SOLAR_BIRTHDAY}');">
				<input type="hidden" id="SOLAR_BIRTHDAY" name="SOLAR_BIRTHDAY" value="${pd.SOLAR_BIRTHDAY}"> 
				<input type="hidden" id="LUNAR_CALENDAR" name="LUNAR_CALENDAR" value="${pd.LUNAR_CALENDAR}">
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3  style="width:50px;font-size: 16px;margin-top: 3px;" >手机</h3>

				<input  readonly="readonly" type="text" value="${pd.PHONE_NUMBER}" id="PHONE_NUMBER" name="PHONE_NUMBER"style="font-size: 1.4rem;border:none"/>
		</div>
	</div>
	<div id="wrapper">

		<!-- header 开始 -->
    	
<!-- header 结束 -->
			<div style="height:25px;width:100%;background:#eeeeee;margin-top:20px;line-height:25px;color:#a0a0a0">
				&nbsp;&nbsp;&nbsp;&nbsp;提醒天数设置
			</div>
	<div class="Newsinfo">
		<ul class="tabslider">
			<li onclick="check(this)"  class="licls">
				<div class="wenzi">
					生日当天  
					
					<div class="birimgdiv <c:if test="${pds.ad0 != null }">on</c:if>" myvalue="0">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
					
			</li>
			<li onclick="check(this)" class="licls">
				<div class="wenzi">
				提前一天				
				<div class="birimgdiv <c:if test="${pds.ad1 != null }">on</c:if>"  myvalue="1">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
				</div>
				
				</div>		
			</li>
			<li onclick="check(this)"  class="licls">
				<div class="wenzi">
				提前三天
				<div class="birimgdiv <c:if test="${pds.ad3 != null }">on</c:if>" myvalue="3">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="check(this)" class="licls">
				<div class="wenzi">
				提前七天
				<div class="birimgdiv <c:if test="${pds.ad7 != null }">on</c:if>"  myvalue="7">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="check(this)"  class="licls">
				<div class="wenzi">
				提前三十天
				<div class="birimgdiv <c:if test="${pds.ad30 != null }">on</c:if>" myvalue="30">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			
		</ul>
		<div style="height:25px;width:100%;background:#eeeeee;line-height:25px;color:#a0a0a0">
				&nbsp;&nbsp;&nbsp;&nbsp;双历提醒
		</div>
    </div>
    <ul class="tabslider">
    <li onclick="remind(this)" myvalue="0">
				<div class="wenzi">
				公历提醒
				<div class="reminddiv imgdiv <c:if test="${pd.REMIND_TYPE == 0 }">checkeds</c:if>" >
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="remind(this)" myvalue="1">
				<div class="wenzi">
				农历提醒
				<div class="reminddiv imgdiv <c:if test="${pd.REMIND_TYPE == 1 }">checkeds</c:if>">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			<li onclick="remind(this)" myvalue="2">
				<div class="wenzi">
				双历提醒
				<div class="reminddiv imgdiv <c:if test="${pd.REMIND_TYPE == 2 }">checkeds</c:if>">
						<img alt="" src="static/lshapp/images/Selected_red.png" style="width: 20px;height: 20px"></img>
					</div>
				</div>
			</li>
			</ul>
	<%-- <div style="height:50px;width:100%;margin-top:10px;line-height:50px;">	
		<span style="margin-left:20px;color:#a0a0a0;">公历生日和农历生日都将提醒</span>
		<img onclick="switchs(this)" class="switchsDiv" src="static/lshapp/images/<c:if test="${pd.REMIND_TYPE ==1 }">on.png</c:if><c:if test="${pd.REMIND_TYPE == 0}">off.png</c:if>" >
	</div> --%>
</div>
<input type="hidden" id="REMIND_TYPE" name="REMIND_TYPE" value="${pd.REMIND_TYPE }">
	<input type="hidden" id="ADVANCE_DATE_COUNT" name="ADVANCE_DATE_COUNT" value="${pd.ADVANCE_DATE_COUNT }">
	<input type="hidden" id="BIRTHDAY_ID" name="BIRTHDAY_ID" value="${pd.BIRTHDAY_ID }">
	<input type="hidden" id="USER_ID" name="USER_ID" value="${pd.USER_ID }">
<!-- 	<div class="s-user-top onclik-nick_name" style="background:#fff;" onclick="goBirthdayRemind()"> -->
<!-- 		<div class="dis-box s-xian-box s-user-top-1"> -->
<!-- 			<h3  style="width:100px;font-size: 16px;margin-top: 7px;">设置生日提醒</h3> -->
<!-- 			<div  class="box-flex t-goods1 text-right onelist-hidden jian-top"> -->
<!-- 				<img src="static/lshapp/images/right arrow1-hdpi.png"> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<%-- <div style="background:#F2F2F2;height:.8rem;"></div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">现居地</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top">${pd.BIRTHDAY} &nbsp;&nbsp; <img class="user_icon1" src="static/lshapp/images/center/Arrow3-hdpi.png"></div>
		</div>
	</div>
	<div class="s-user-top onclik-nick_name" style="background:#fff;">
		<div class="dis-box s-xian-box s-user-top-1">
			<h3 class="box-flex text-all-span my-u-title-size">职位</h3>
			<div id="nick_name" class="box-flex t-goods1 text-right onelist-hidden jian-top"><input type="text" value="程序员" style="text-align:right;font-size: 1.4rem;"/></div>
		</div>
	</div> --%>
	<div class="z_mask">
         <!--弹出框-->
         <div class="z_alert">
             <p ><img src="static/lshapp/images/jiazais.gif"/></p>
             <p style="color: white;padding-top: 5px;">图片加载中</p>
         </div>
     </div>


	 <div class="ect-button-more dis-box m-top12" style="width:90%;margin-left:4%;margin-top:5%;" onclick="save()">
                <input type="button" class="btn-submit box-flex br-5 min-two-btn" value="保存" >
     </div>
	</form>
</div>
	<script src="static/lshapp/js/center/ajaxfileupload.js"></script>
<!--悬浮菜单e-->
		<script type="text/javascript">
		
		
		
		
		function check(obj){
			var $v = $(obj);
			if($v.find(".birimgdiv").hasClass("on")){
				$v.find(".birimgdiv").removeClass("on");
			}else{
		 		$v.find(".birimgdiv").addClass("on");
			}
			
			$("#ADVANCE_DATE_COUNT").val("");
		    $(".Newsinfo .birimgdiv").each(function(){
			if($(this).hasClass("on")){
			    var temp=$("#ADVANCE_DATE_COUNT").val();
			    myvalue=$(this).attr("myvalue");
			    $("#ADVANCE_DATE_COUNT").val(temp+myvalue+",");
			}
		  });
		}

		function remind(obj){
			$(".reminddiv").each(function(){
				$(this).removeClass("checkeds");
			  });
			var $v = $(obj);
			$v.find(".reminddiv").addClass("checkeds");
			myvalue=$v.attr("myvalue");
			$("#REMIND_TYPE").val(myvalue);
		}
		</script>


		<script type="text/javascript">
		function clock()
		{var d=new Date();
			if(localStorage.time&&d.getTime()<localStorage.time&&localStorage.val){
				$("#SOLAR_BIRTHDAY").val(localStorage.val);
				localStorage.remove("val");
			}
		}
		var int1=self.setInterval("clock()",500);

		function showDate(obj){
			if($(obj).val()){
				window.location.href="<%=basePath%>lshapp/appLogin/dateSelector1.do?ymd="+$(obj).val();
			}else{
				window.location.href="<%=basePath%>lshapp/appLogin/dateSelector1.do";
			}

		}

		</script>

		<script>
		//去设置生日提醒页面
		function goBirthdayRemind(){
			window.location.href='<%=basePath%>lshapp/userbrithday/goAppUserBirthdayRemind.do';
			//window.event.returnValue=false;
		}


        $("#file").change(function(){
    		upPhoto();
    		});
    	function upPhoto(){
    		$(".z_mask").css("display","block") ;
    	    var url = "<%=basePath%>lshapp/uploading/pictures/saveForUrl.do?token=1";//这里填请求的地址
    	    $.ajaxFileUpload({
    	        url : url,
    	        type : 'POST',
    	        fileElementId : 'file',  //这里对应html中上传file的id
    	        contentType:"application/json;charset=UTF-8",
    	        success: function(data){
    	            var str = $(data).find("body").text();//获取返回的字符串
    	            var json = $.parseJSON(str);//把字符串转化为json对象
    	            if(json.result=='ok'){
    	            	$("#PICTURE_ID").val(json.PICTURES_ID);
    	            	var p=json.PATH;
    	            	var path="<%=basePath%>"+"uploadFiles/uploadImgs/"+p;
    	            	$("#imgId").attr('src',path);
    	            	$(".z_mask").css("display","none") ;
    	                //alert("上传成功"+json.PICTURES_ID);
    	                //修改用户图片编号
    	                var PICTURE_ID = $("#PICTURE_ID").val();
    	                $("#file").val("");
    	            	 $.ajax({
    	            		 	async : false,
    	    			        /* async : false,
    	    			        cache : false, */
    	    			        //cache: false,
    	    			        type : 'POST',
    	    			        url : "<%=basePath%>lshapp/userCenter/update_picture.do",// 请求的action路径
    	    			        data:{"PICTURE_ID":PICTURE_ID},
    	    			        success: function(data){// 请求失败处理函数
    	    			        	if(data=="success"){

    	    			        	}else{
    	    			        		alert("保存失败！");
    	    			        		return false;
    	    			        	}
    	    			        },
    	    			    });
    	            }
    	            else{
    	                alert("上传失败");
    	            }
    	        },
    	        error: function(){
    	            alert("请链接网络");
    	        }
    	    })
    	}
    	//保存
		function save(){
			var COUNT = $("#ADVANCE_DATE_COUNT").val();
			if($("#NICK_NAME").val()==""){
				d_messages("社区昵称不能为空！");
				return false;
			}else if($("#SOLAR_BIRTHDAY").val() == ""){
				d_messages("请选择出生日期！");
				return false;
			}else if($("#PHONE_NUMBER").val()==""){
				d_messages("手机号不能为空！");
				return false;
			}else if(COUNT == "" || COUNT == null){
				d_messages("请至少选择一个提醒天数 !");
				return;		
			}else{
				 var phonenum = $("#PHONE_NUMBER").val();
				  var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
				    if(!myreg.test(phonenum)){
				    	d_messages('请输入有效的手机号码！');
				        return;
				    }else{
				    	$("#Form").submit();
				    }
			}

		}

    	   $(function(){
    			var options = {
    				type: 'POST',
    		        success:showResponse,
    				error : function(xhr, status, err) {
    					alert("操作失败");
    				}
    		    };
    		    $("#Form").submit(function(){
    		        $(this).ajaxSubmit(options);
    		        return false;   //防止表单自动提交
    		    });
    		});
    	    /**
    	     * 保存操作
    	     */
    	    function toSave(){
    	    	$("#Form").submit();
    	    }

    	    /**
    	     * 保存后，执行回调
    	     * @param responseText
    	     * @param statusText
    	     * @param xhr
    	     * @param $form
    	     */
    	    function showResponse(responseText, statusText, xhr, $form){
    	    	if(responseText == "1"){
    	    		 openPageOne();
    	    	} else {
    	    		openPageTwo();
    	    	}
    	    }
    	    function openPageOne() {
    	        var data='{"index":"4","refresh":"1"}';
    	        window.WebViewJavascriptBridge.callHandler(
    	            'openPage'
    	            ,data
    	            , function(responseData) {
    	            }
    	        );
    	    }

    	    function openPageTwo() {
    	        var data='{"index":"6","refresh":"1"}';
    	        window.WebViewJavascriptBridge.callHandler(
    	            'openPage'
    	            ,data
    	            , function(responseData) {
    	            }
    	        );
    	    }

    	    function upFile(){
    	    	var data='';
    	    	window.WebViewJavascriptBridge.callHandler(
    	              'postFile'
    	              ,data
    	              , function(responseData) {
    	            	 //$("#PICTURE_ID").val(responseData);
    	              	var json = eval('(' + responseData + ')');
    	             	$("#PICTURE_ID").val(json.PICTURES_ID);
    	              	$("#imgId").attr('src',json.absoluteUrl);
    	              }
    	 	      );
    	   	}
    	    function showAlert(message){
    			//var message = "";
    			//var json = eval('(' + message + ')');
    	     	$("#PICTURE_ID").val(message.PICTURES_ID);
    	      	$("#imgId").attr('src',message.absoluteUrl);
    	    }
    		
    	    
    	    
    	    function showDates(solar){
    			 var data="${pd.SOLAR_BIRTHDAY}";
    		        window.WebViewJavascriptBridge.callHandler(
    		            'selectDate'
    		            ,data
    		            , function(responseData) {
    		            	var json = eval('(' + responseData + ')')
    		            	$("#SHENGRI").val("新历:"+json.solar+"  农历:"+json.lunar);
    		            	$("#SOLAR_BIRTHDAY").val(json.solar);
    		            	$("#LUNAR_CALENDAR ").val(json.lunar);
    		            }
    		        );
    		}
    	    
    	   
    		function editUserBirthday(message) {
    			$("#SHENGRI").val("新历:"+message.solar+"  农历:"+message.lunar);
    			$("#SOLAR_BIRTHDAY").val(message.solar);
    			$("#LUNAR_CALENDAR ").val(message.lunar);
    		}

</script>
<script type="text/javascript">
	 //注册事件监听
	function connectWebViewJavascriptBridge(callback) {
	    if (window.WebViewJavascriptBridge) {
	        callback(WebViewJavascriptBridge)
	    } else {
	        document.addEventListener(
	            'WebViewJavascriptBridgeReady'
	            , function() {
	                callback(WebViewJavascriptBridge)
	            },
	            false
	        );
	    }
	}
	//注册回调函数，第一次连接时调用 初始化函数
	connectWebViewJavascriptBridge(function(bridge) {
	    bridge.init(function(message, responseCallback) {
	        var responseData = '默认接收收到来自Java的数据，回传数据给你';
	        responseCallback(responseData);
	    });
	})
</script>
<script type="text/javascript">
	function ip_back(responseData) {
		d_messages("请选择出生日期！");
		d_messages(responseData);
		
    }
	
	
	
	
</script>
<script type="text/javascript">

</script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.0.0/weui.min.js"></script>
</body></html>