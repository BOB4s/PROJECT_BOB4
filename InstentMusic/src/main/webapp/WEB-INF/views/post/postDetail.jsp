<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://172.30.1.32:4000/socket.io/socket.io.js"></script>
<style>
.write, .delete{
	width: 20px;
	height : 20px;
}
.table{
text-align: center;
max-width: 70%;
margin-bottom: 0px;
margin-left: 14%;
}
.recon{
text-align: center;
}
.date{
text-align: center;
width: 100px;
}
.cid{
text-align: center;
width: 120px;
}
.proset{
float : left;
}
.sp{
	width: 30px;
	height: 30px;
	border-radius:15px;
}
</style>
<script type="text/javascript">
var username = '${nickname}';
var socket = io.connect('http://172.30.1.32:4000');

$(function() {
   socket.emit('add user', username);
   init();
   $("#replyControl").on('click', replySend);
});
function init() {
   var post_number = ${post.post_number};

   $.ajax({
      method : 'GET',
      url : 'replyAll',
      data : {
         "post_number" : post_number
      },
      success : output,
      error : function(resp) {
         alert("Error");
      }
   })

}

function output(resp) {
   var nickname = "${sessionScope.nickname}";
   var data = '   <table class="table table-dark"><thead><tr><th class="date"></th><th class="cid"></th><th class="recon"></th></tr></thead><tbody>';
         $.each(resp,
               function(index, item) {
                  data += '<tr><td>' + item.rep_date + '</td>'
                  data += '<td>';
               /*    if (item.savedfilename!=null) {
                     data += '<img src="<c:url value="/imgs/'+item.savedfilename+'"/>" width="25px" height="25px"/>'
                  } else {
                     data +='<img src="/personal/resources/images/userdefalut.png" width="25px" height="25px"/>'
                     
                  } */
                  data += '<a href="proDetail?cust_number='+item.cust_number+'">'+'<span class="proset"><img class="sp" src="<spring:url value="/image/'
					+item.cust_photo+'"/>"/>'+'&nbsp'+item.rep_nickname + '</span></td>'
                  data += '<input type="hidden" value="'+item.rep_content+'">'
                  data +='<td>'+ item.rep_content+'</td><td>' ;

                  if (nickname == item.rep_nickname) {
                     data += '<a id="replyDelete" data-num="'+  item.rep_number+'" class="replyDelete" ">'+'<img class="delete" src="resources/images/reply/slreset.png">'+'</a>';
//                      data +='<a id="replyUpdate" data-num="'+  item.rep_number+'" class="replyUpdate" ">'+'<img class="update" src="resources/images/sound/slset.png">'+'</a>';
                  }
                  data += '</td></tr>'
               })
   data += '</tbody></table>';

   $("#replyResult").html(data);
   $("#replyDelete").on('click', replyDelete);
   $("#replyUpdate").on('click', replyUpdate);

}

function replyUpdate() {

   var rep_number = $(this).attr("data-num");
   var rep_content = $(this).attr("data-text");
   $("#replyControl").attr("data-num", rep_number);

   $("#rep_content").val(rep_content);
//    $("#replyControl").val('댓글수정');

}
//수정과 입력을 동시에 처리할것이다.
function replySend() {
   var rep_number = $(this).attr("data-num");
   if (rep_number == ""){
      rep_number = 0;
   }
   var rep_url = $("#rep_url").val();
   var cust_number = '${cust_number}';
   var rep_content = $("#rep_content").val();
   var post_number = ${post.post_number};
   var status = ($("#replyControl").val() == "댓글수정") ? "replyUpdate": "replyWrite";
   /* var savedfilename = $("#getUserimgs").val(); */

   if (status == 'replyUpdate') {
      var sendData = {
            "rep_url" : rep_url,
         "cust_number" : cust_number,
         "rep_number" : rep_number,
         "rep_content" : rep_content,
         "post_number" : post_number
      /*    ,"savedfilename" : savedfilename */
      };
      $.ajax({
         method : "POST",
         url : status,
         data : sendData,
         success : function(resp) {
            if (resp == 'success') {
               alert("댓글수정완료");
               init();
               $("#rep_content").val("");
               $("#replyControl").val("댓글달기");
            } else {
               alert("댓글수정실패")
            }
         }
      });

   } else {
      var sendData = {
            "rep_url" : rep_url,
            "cust_number":cust_number,
            "rep_number" : rep_number,
            "rep_content" : rep_content,
            "post_number" : post_number
         /*    ,"savedfilename" : savedfilename */
      };
      $.ajax({

         method : "POST",
         url : status,
         data : sendData,
         success : function(resp) {
            if (resp == 'success') {
               replynotice();
               init();
               $("#rep_content").val("");
               
               
            } else {
               alert("작성실패")
            }
         }
      });

   }
}

function replyDelete() {
   var rep_number = $(this).attr('data-num');
   var post_number = ${post.post_number};

   var sendData = {
      "post_number" : post_number,
      "rep_number" : rep_number
   };

   $.ajax({
      method : 'GET',
      url : 'replyDelete',
      data : sendData,
      success : function(resp) {
         if (resp == 'success') {
            alert("삭제 성공");
            //전체 댓글다시 불러온다.
            init();
         } else
            alert('삭제 실패')
      },
      error : function() {
         alert("에러 에러");
      }
   })

}

function replynotice(){
      var post_number = '${post.post_number}';
      var mus_title = '${post.mus_title}';
      var replyWriter_number = '${nickname}';
      var postWriter_number = '${post.cust_number}';
      console.log(mus_title+','+replyWriter_number+','+postWriter_number);
    socket.emit('replynotice',replyWriter_number , postWriter_number,mus_title,post_number);
    noti_save();

   }

function noti_save(){
   
   var not_cust_number =  '${post.cust_number}';
   var not_sender_number  = '${cust_number}';
   var not_content  ='${post.post_number}';
   var not_type = 'Reply';
   $.ajax({
      method : 'GET',
      url : 'noti_save',
      data : {
         "not_sender_number":not_sender_number,
         "not_cust_number":not_cust_number,
         "not_content" : not_content,
         "not_type" : not_type
      }

   });
   }
</script>

</head>
<body>
<br><br>
   <div id="wrapper">
      <div id="replyForm" style="text-align: center;">
         <c:if test="${not empty nickname}">
            <form action="replyWrite" method="POST">
               <input type="hidden" name="cust_number" value="${cust_number}">
               <input type="hidden" name="rep_nickname" value="${nickname}">
            <%--    <input type="hidden" name="rep_url" value="${rep_url}"> --%>
               <input type="hidden"  id="rep_url" name="rep_url" value="url입니다">
               <span id="rep_nickname">
<!--                작성자 :  -->
         <%--       <c:if test="${not empty sessionScope.cust_photo_saved}">
               <img src="<c:url value='/imgs/${sessionScope.cust_photo_saved}'/>"
                  width="50px" height="30px" />
            </c:if> <c:if test="${empty sessionScope.cust_photo_saved}">
               <img src="<c:url value='/resources/images/userdefalut.png'/>"
                  width="50px" height="30px" />
            </c:if> --%>
<%--                ${sessionScope.nickname} --%>
               </span> <input type="text" id="rep_content"
             placeholder="댓글 달기..." name="rep_content" >
             <a id="replyControl" data-num=""><img class="write" src="resources/images/reply/sledit.png">
			</a>
<!--                <input id="replyControl" name="replyControl" data-num="" type="button" value="댓글달기">  -->
            </form>
         </c:if>

      </div>
      <!-- 댓글 목록 출력 -->

      

   </div>
   <div id="replyResult" style="width: 60%; margin: auto; "></div>
</body>
</html>