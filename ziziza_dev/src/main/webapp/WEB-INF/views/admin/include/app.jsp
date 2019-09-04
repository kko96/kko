<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><link rel="stylesheet" href='<c:url value="/css/reset.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/admin/main.css"/>'>
<link rel="stylesheet" href='<c:url value="/css/admin/responsive.css"/>'>
<link rel="stylesheet" href='<c:url value="/jquery/perfect-scrollbar/css/perfect.scrollbar.css"/>'>
<link rel="stylesheet" href='<c:url value="/jquery/jquery-modal/css/jquery.modal.css"/>'>
<script src='<c:url value="/jquery/jquery-3.4.1.min.js"/>'></script>
<script src='<c:url value="/jquery/jquery-form/jquery.form.js"/>'></script>
<script src='<c:url value="/jquery/jquery-validation/jquery.validate.js"/>'></script>
<script src='<c:url value="/jquery/jquery-validation/additional-methods.js"/>'></script>
<script src='<c:url value="/jquery/perfect-scrollbar/perfect.scrollbar.js"/>'></script>
<script src='<c:url value="/jquery/jquery-modal/jquery.modal.js"/>'></script>
<script src='<c:url value="/jquery/jquery-loading/loadingoverlay.js"/>'></script>
<script>
/**		페이지 로딩 js		**/
$(window).on("load",function() {	// 로딩 완료되었을때
 	$.LoadingOverlay("hide");
});
$(document).ready(function() {		// 문서의 로딩을 시작할때
	$.LoadingOverlay("show");
}).ajaxStart(function(){			// ajax 시작할때
	$.LoadingOverlay("show");
}).ajaxStop(function(){				// ajax 종료
	$.LoadingOverlay("hide");
}).ajaxError(function() {
	$.LoadingOverlay("hide");
	commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
});
/** 	Ajax 공통 	**/
var options = {	
	type	:	'POST',       		// 'get' or 'post', override for form's 'method' attribute 
	dataType	:	'json', 		// 'xml', 'script', or 'json' (expected server response type) 
//	url	:	url,         		// override for form's 'action' attribute 
//	success	:	function(data, statusText, xhr, $form){},	// post-submit callback 
//	target:        '#output1',  // target element(s) to be updated with server response 
//	clearForm	:	true,        // clear all form fields after successful submit 
//	resetForm	:	true,        // reset the form after successful submit 
//	beforeSubmit:  showRequest, // pre-submit callback
//	error	:	function(xhr, status, error){},				// post-submit callback error
//	$.ajax options can be used here too, for example: 
//	timeout:   3000 
};
var tbody, temp, board, form, url;
$(function(){
	board = $("input[name='board']").val();
	
	/**		메뉴 공통	**/
	$(".navToggle").on("click", function(e){		//메뉴 숨김 버튼 클릭
		e.preventDefault();
		$("#wrap").toggleClass("hideNav");
	});
	$("span.items").on("click", function(e){		//메뉴 클릭
		e.preventDefault();
		$(".menu > li.open").removeClass("open");
		$(this).parent().addClass("open");
	});
	
	/**		스크롤		**/
	if(board != 'login'){		//로그인 페이지 제외
		const psNav = new PerfectScrollbar('#navWrap', {
			wheelSpeed: 2,
			wheelPropagation: true
		});
		
		const psCon = new PerfectScrollbar('#container', {
			wheelSpeed: 2,
			wheelPropagation: true
		});
		
		psNav.update();
		psCon.update();
		
		$(window).resize(throttle(100, function(e) {
			psNav.update();
			psCon.update();
	   }));
	}//if end
	
	$(".modal .close").on("click", function(){
		$.modal.close();
		return false;
	});	
	
	/**		목록페이지		**/
	if(board == 'list'){
		form  	=	$('.search');
		var listOpt = options;
		listOpt.success = function(data, statusText, xhr, $form){
			putList(data.list);			//목록 출력
			pageSetting(data.page);		//페이징
		};
		tbody 	=	$(".lTbl tbody");
		temp	=	$(".lTbl tbody").children().clone();
		tbody.empty();
		
		form.ajaxSubmit(listOpt);
		
		$(".search button[type='submit']").on('click', function(e){		//검색 버튼
			e.preventDefault();
			form.ajaxSubmit(listOpt);
		});
	}//if end
	
	/**		입력 폼		**/
	if(board == 'regist' || board == 'modify'){
		form 	= 	$(".form");
		url = form.attr("action");
		commonValidator(form, rules, messages);		//validate
		if(board == 'modify')	getInfo();		//상세 페이지
		
		$(".fOpt .dBtn").on('click', function(e){	//삭제 버튼
			e.preventDefault();
			var deleteUrl = $(this).attr("href");
			$(".confirm .message").empty().text("삭제하시겠습니까?");
			$(".confirm").modal({ clickClose: false, showClose : false});
			$(".modal .ok").off("click").on("click", function(e){		//Modal OK
				e.preventDefault();
				$.modal.close();
				deleteInfo(deleteUrl);
			});
		});
		
		$(".files #attachments").on('change', function(e){		//첨부파일 추가
			e.preventDefault();
			var file = $(this);
			var fileName = file[0].files[0].name;
			var fileSize = file[0].files[0].size;
			if(fileName != '' && fileSize > 0){		//체크  확장자 이후 추가
				var ul = file.next();
				var li = $('<li class="add">');
				file.clone().attr("name", "attachments").appendTo(li);
				file.val('');
				var name = $("<span>").text(fileName).appendTo(li);
				var btn = $('<button type="button">').text('제거').on('click', function(e){
					$(this).parent().remove();
				}).appendTo(li);
				li.prependTo(ul);
			}//
		});
		
		$("#banner").on('change', function(e) {		//이미지 변경
			e.preventDefault();
			readURL(this);
		});
		
		$('.openAddr').on('click', function(e){			//주소 검색
			e.preventDefault();
			openDaumAddressPopup();
		});
		
		$("input[type='tel']").on('keyup', function(e){	//전화번호 자동 하이픈
			e.preventDefault();
			var tel = $(this);
			var hypen = autoHypenPhone(tel.val());
			tel.val(hypen)
	    });
		
	}//if end
	
});

/**		저장 Ajax		**/
function saveInfo(){
	options.url	= 	url.replace("detail", "modify");
	options.success = function(data, statusText, xhr, $form){
		if(board == 'regist'){
			if(data > 0){
				url = url.replace("regist", "modify") + "?no=" + data;
				commonAlert("등록이 완료되었습니다.", url);
			}else{
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
			}//if end
		}//if end
		if(board == 'modify'){
			if(data > 0){
				commonAlert("수정이 완료되었습니다.");
				getInfo();
			}else{
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
			}//if end
		}//if end
	};
	form.ajaxSubmit(options);
}//saveInfo()

/**		상세 ajax		**/
function getInfo(){
	options.url	= 	url.replace("modify", "detail");
	options.success = function(data, statusText, xhr, $form){
		if(data.vo){
			putInfo(data.vo, data.files, data.charge, data.plants);
			putFiles(data.files);
		}else	
			commonAlert("정보가 존재하지 않습니다.", "list");
	};
	form.ajaxSubmit(options);
}//getInfo()

/**		삭제 ajax			**/
function deleteInfo(deleteUrl){
	$.post(deleteUrl, {"no" : form.data("no")}, function(data, statusText, xhr){
		if(data > 0)	
			commonAlert("삭제가 완료되었습니다.", "list");
		else 
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
	},'json');
}//deleteInfo()

/** 공통 Validator **/
function commonValidator(targetForm, rules, messages) {
	targetForm.validate({
        debug: false,   //debug가 true인 경우 validation 후 submit을 수행하지 않음
        focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
        rules: rules,		//validate 	규칙
        messages: messages,	//validate 	메세지
        errorPlacement: function (error, element) {	//틀림
        	element.parent().find('.message').addClass('error').text(error.text());
        },
        success: function(error, element) {		//통과
        	$(element).parent().find('.message').removeClass('error').text('');
        },
        submitHandler: function(form){
        	$('.confirm .message').empty().text('저장하시겠습니까?');
			$('.confirm').modal({ clickClose: false, showClose : false});
			$('.modal .ok').off('click').on('click', function(e){		//Modal 확인 버튼
				e.preventDefault();
				$.modal.close();
				saveInfo();
			});
        }
    });
}//commonValidator()

/**		페이징 공통		**/
function pageSetting(page){
	$(".paging .pageNum").remove();	//초기화
	var nowPage = page.currentPage;
	var prev = $(".paging > .prev");
	var next = $(".paging > .next");
	
	if(page.prevState)	prev.removeClass("disabled").data("page", nowPage - 1);	
		else	prev.addClass("disabled");
	if(page.nextState)	next.removeClass("disabled").data("page", nowPage + 1);	
		else	next.addClass("disabled");
	
	for(var i = page.startPage;i <= page.endPage;i++){
		var span = $("<span>").text(i);
		var li = $("<li class='pageNum'>").data("page", i);
		li.append(span);
		if(i == nowPage) li.addClass("active");
		next.before(li);
	}//for end
	
	$(".paging li").off("click").not('.active, .disabled').on("click", function(e){
		e.preventDefault();
		$("input[name='currentPage']").val($(this).data("page"));
		form.ajaxSubmit(options);
	});
}//pageSetting()

/*** 	Modal custom		 **/
/** 공통 Alert **/
function commonAlert(msg, returnUrl){
	$(".alert .message").empty().text(msg);
	$(".alert").modal({ clickClose: false, showClose : false});
	if(returnUrl){
		$(".alert .close").off("click").on("click", function(e){
			e.preventDefault();
			location.href = (returnUrl == 'list' ? $(".lBtn").attr("href") : returnUrl);
		});	
	}
}//commonAlert()


//주어진 시간만큼 지나야 주어진 함수를 실행 합니다.
function throttle(ms, fn) {
    var allow = true;
    function enable() { allow = true;}
    return function(e) {
        if(allow) {
            allow = false;
            setTimeout(enable, ms);
            fn.call(this, e);
        }//if end
    }
}//throttle()

/**
 * 문자열의 바이트수 리턴
 * @returns {Number}
 */
String.prototype.getByteLength = function() {
    var l	= 	0;
    for(var idx = 0; idx < this.length; idx++) {
        var c	=	escape(this.charAt(idx));
        if(c.length == 1) l ++;
        else if(c.indexOf("%u") != -1)	l += 2;
        else if(c.indexOf("%") != -1)	l += c.length/3;
    }//for end
    return l;
};

/*	
 * 	전화번호 자동 하이픈	
 * 	출처 : https://mulder21c.github.io/2014/11/03/automatically-enter-cell-phone-number-hyphen/
 * */
function autoHypenPhone(str){
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	
	// 서울이라는 변수를 선언
    var seoul = 0;

    // 서울 지역번호(02)가 들어가는 경우 1을 삽입
    if(str.substring(0, 2).indexOf('02') == 0) {
        seoul = 1;
    }
    
	if( str.length < (4 - seoul)){
		return str;
	}else if(str.length < 7- seoul){
		tmp += str.substr(0, 3- seoul);
		tmp += '-';
		tmp += str.substr(3- seoul);
		return tmp;
	}else if(str.length < 11- seoul){
		tmp += str.substr(0, 3- seoul);
		tmp += '-';
		tmp += str.substr(3- seoul, 3);
		tmp += '-';
		tmp += str.substr(6- seoul);
		return tmp;
	}else{
		tmp += str.substr(0, 3- seoul);
		tmp += '-';
		tmp += str.substr(3- seoul, 4);
		tmp += '-';
		tmp += str.substr(7- seoul);
		return tmp;
	}
	return str;
}//autoHypenPhone()

/*********************파일************************/
/**		파일 목록출력 		**/
function putFiles(files){
	var ul = $(".fileList").empty();
	$.each(files, function(idx, file){
		if(file.fileType == 'ATTACHMENTS') appendAttach(file, ul)
		else if(file.fileType == 'BANNER') appendBanner(file);
	});
}//putFiles()

/** 	첨부 파일	출력 **/
function appendAttach(file, ul){
	var li = $('<li>');
	var name = $("<span>").text(file.originName).appendTo(li);
	var no = file.fileNo;
	var btn = $('<button type="button">').text('삭제').on('click', function(e){
		e.preventDefault();
		$(".confirm .message").empty().text("파일을 삭제 하시겠습니까?");
		$(".confirm").modal({ clickClose: false, showClose : false});
		$(".modal .ok").off("click").on("click", function(e){		//Modal OK
			e.preventDefault();
			$.modal.close();
			deleteFile(no, btn);
		});
	}).appendTo(li);
	li.appendTo(ul);
}//appendAttach()

/** 	배너 이미지	출력 **/
function appendBanner(file){
	var btn = $('<button type="button">').text('삭제').on('click', function(e){
		e.preventDefault();
		$(".confirm .message").empty().text("이미지을 삭제 하시겠습니까?");
		$(".confirm").modal({ clickClose: false, showClose : false});
		$(".modal .ok").off("click").on("click", function(e){		//Modal OK
			e.preventDefault();
			$.modal.close();
			deleteBanner(file.fileNo, btn);
		});
	});
	$('.files #banner').after(btn)
	$('.files #banner').hide();
	var preview = $(".bPreview").empty();
	var img = $('<img title="배너 이미지">').attr('src', '/file/imageView?no=' + file.fileNo);
	img.appendTo(preview);
}//appendBanner()

/**		파일 삭제 ajax	**/
function deleteFile(no, elem){
	$.post("/file/delete", {"no" : no}, function(data, statusText, xhr){
		if(data > 0)	{
			commonAlert("삭제가 완료되었습니다.");
			elem.parent().remove();
		}else 
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
	},'json');
}//deleteFile()

/**		배너 삭제 ajax	**/
function deleteBanner(no, elem){
	$.post("/file/delete", {"no" : no}, function(data, statusText, xhr){
		if(data > 0)	{
			commonAlert("삭제가 완료되었습니다.");
			$(".bPreview").empty();
			$('.files #banner').val('').show();
			elem.remove();
		}else 
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
	},'json');
}//deleteFile()

/**		이미지 바로 출력		**/
function readURL(input) {
	if (input.files && input.files[0]) {
    	var reader = new FileReader();
    	reader.onload = function(e) {
	    	var btn = $('<button type="button">').text('제거').on('click', function(e){
	    		e.preventDefault();
	    		 $(".bPreview").empty();
	    		 $('.files #banner').val('').show();
	    		 $(this).remove();
	    	});
	    	$(input).after(btn)
	    	$('.files #banner').hide();
	    	var preview = $(".bPreview").empty();
	    	var img = $('<img title="배너 이미지">').attr('src', e.target.result);
	    	img.appendTo(preview);
    	}
    	reader.readAsDataURL(input.files[0]);
    }//if end
}//readURL()
</script>