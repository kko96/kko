$(window).on("load",function() {	// 로딩 완료되었을때
  $.LoadingOverlay("hide");
});

$(document).ready(function() {	// 문서의 로딩을 시작할때
	$.LoadingOverlay("show");
}).ajaxStart(function(){		// ajax 시작할때
	$.LoadingOverlay("show");
}).ajaxStop(function(){			// ajax 종료
	$.LoadingOverlay("hide");
}).ajaxError(function() {
	$.LoadingOverlay("hide");
	
});
	
var tbody, temp, board;
$(function(){
	/**		메뉴 공통	**/
	$(".navToggle").on("click", function(e){
		e.preventDefault();
		$("#wrap").toggleClass("hideNav");
	});
	
	$("span.items").on("click", function(e){
		e.preventDefault();
		$(".menu > li.open").removeClass("open");
		$(this).parent().addClass("open");
	});
	/**		스크롤		**/
//	const psNav = new PerfectScrollbar('#navWrap', {
//	  wheelSpeed: 2,
//	  wheelPropagation: true
//	});
//	
//	const psCon = new PerfectScrollbar('#container', {
//	  wheelSpeed: 2,
//	  wheelPropagation: true
//	});
//	
//	psNav.update();psCon.update();
//	
//	$(window).resize(throttle(100, function(e) {
//		psNav.update();psCon.update();
//    }));
	
	
	$(".modal .close").on("click", function(){
		$.modal.close();
		return false;
	});	
		
	/**		목록페이지		**/
	board = $("input[name='board']").val();
	if(board == 'list'){
		tbody = $(".lTbl tbody");
		temp = $(".lTbl tbody").children().clone();
		tbody.empty();
		
		getList();	//목록 ajax
		
		$(".search button[type='submit']").on('click', function(e){		//검색 버튼
			e.preventDefault();
			getList();
		});
	}//if end
	
	//등록 폼
	if(board == 'regist' || board == 'modify'){
		var form = $(".form");
		commonValidator(form, rules, messages);
		
		if(board == 'modify'){
			getInfo();
			$(".fOpt .dBtn").on('click', function(e){	//삭제 버튼
				e.preventDefault();
				var url = $(this).attr("href");
				$(".confirm .message").empty().text("삭제하시겠습니까?");
				$(".confirm").modal({ clickClose: false, showClose : false});
				$(".modal .ok").off("click").on("click", function(e){		//Modal OK
					e.preventDefault();
					$.modal.close();
					deleteInfo(url);
				});
			});
		}//
		
		$("input[type='tel']").on('keyup', function(e){	//전화번호 자동 하이픈
			e.preventDefault();
			var tel = $(this);
			var hypen = autoHypenPhone(tel.val());
			tel.val(hypen)
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
		
		$('.openAddr').on('click', function(e){		//주소 검색
			e.preventDefault();
			openDaumAddressPopup();
		});
		
		$(".rlBtn").on('click', function(e){
			e.preventDefault();
			getReply();
		});
		
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
		  }
		}
		
		$("#banner").on('change', function(e) {
			e.preventDefault();
			readURL(this);
		});
		
//		$("input[name='title'], textarea").on('keyup', function(e){		//Byte 출력
//			var title = $(this);
//			title.next().next().text(title.val().getByteLength());
//		});
	}
});

/** 공통 Validator **/
function commonValidator(targetForm, rules, messages) {
	targetForm.validate({
        debug: false,   //debug가 true인 경우 validation 후 submit을 수행하지 않음
        focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
        rules: rules,
        messages: messages,
        errorPlacement: function (error, element) {
        	element.parent().find(".message").addClass("error").text(error.text());
        },
        success: function(error, element) {
        	$(element).parent().find(".message").removeClass("error").text("OK");
        },
        submitHandler: function(form){
        	$(".confirm .message").empty().text("등록하시겠습니까?");
			$(".confirm").modal({ clickClose: false, showClose : false});
			$(".modal .ok").off("click").on("click", function(e){		//Modal OK
				e.preventDefault();
				$.modal.close();
				saveInfo($(form));
			});
        }
    });
}//

/* 목록 ajax */
function getList(){
	var form = $(".search");
	var formData = new FormData(form[0]);
	var url = form.attr("action");
	$.ajax({
		url: url, 
		data:formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: form.attr("method"), 
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			putList(data);		//목록 보여주기 페이지 별
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//getList()

/**		저장 ajax		**/
function saveInfo(form){
	var formData = new FormData(form[0]);
	var url = form.attr("action");
	var option = {success:    function() { 
        alert('Thanks for your comment!'); 
    } }
	form.ajaxSubmit();
//	$.ajax({
//		url: url, 
//		data:formData, 
//		dataType:'json', 
//		processData:false, 
//		contentType:false,
//		type: form.attr("method"), 
//		success:function(data, status, xhr){
////			console.log(data, status, xhr);
//			if(board == 'regist'){
//				if(data > 0){
//					url = url.replace("regist", "modify") + "?no=" + data;
//					commonAlert("등록이 완료되었습니다.", url);
//				}else{
//					commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
//				}
//			}else{
//				if(data > 0){
//					commonAlert("수정이 완료되었습니다.");
//					getInfo();
//				}
//				else
//					commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
//			}
//		}, 
//		error:function(xhr, status, error){
////			console.log(xhr, status, error);
//			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
//		}
//	});//ajax
}//saveInfo()

/**		상세 ajax		**/
function getInfo(){
	var form = $(".form");
	var no = form.data("no");
	if(no == '') {commonAlert("원하는 정보가 존재하지 않습니다.", "list"); return;}
	var formData = new FormData();
	formData.append("no", no);
	var url = form.attr("action");
	url = url.replace("modify", "detail");
	$.ajax({
		url: url,
		data: formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: form.attr("method"),
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			if(data.vo) 
				putInfo(data.vo, data.charge, data.plants);
			else	
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
			if(data.files)
				putFiles(data.files);
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//getInfo()

/**		삭제 ajax			**/
function deleteInfo(url){
	var form = $(".form");
	var no = form.data("no");
	if(no == '') {emptyAlert(); return;}
	var formData = new FormData();
	formData.append("no", no);
	$.ajax({
		url: url,
		data: formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: "POST",
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			if(data > 0)	
				commonAlert("삭제가 완료되었습니다.", "list");
			else 
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//

/**		파일 삭제 ajax	**/
function deleteFile(no, elem){
	var formData = new FormData();
	formData.append("no", no);
	$.ajax({
		url: "/file/delete",
		data: formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: "POST",
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			if(data > 0){
				commonAlert("삭제가 완료되었습니다.");
				elem.parent().remove();
			}else {
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
			}
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//deleteFile()

/**		배너 삭제 ajax	**/
function deleteBanner(no, elem){
	var formData = new FormData();
	formData.append("no", no);
	$.ajax({
		url: "/file/delete",
		data: formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: "POST",
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			if(data > 0){
				commonAlert("삭제가 완료되었습니다.");
				$(".bPreview").empty();
				$('.files #banner').val('').show();
				elem.remove();
			}else {
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
			}
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//deleteFile()

/**		댓글 ajax		**/
function getReply(){
	var form = $(".form");
	var no = form.data("no");
	var formData = new FormData();
	formData.append("no", no);
	$.ajax({
		url: "/admin/comment/list", 
		data:formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: form.attr("method"), 
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			if(data.list) putReply(data);
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//getReply()

/** 	댓글 삭제  	**/
function deleteReply(no, elem){
	var formData = new FormData();
	formData.append("no", no);
	$.ajax({
		url: "/admin/comment/delete", 
		data: formData, 
		dataType:'json', 
		processData:false, 
		contentType:false,
		type: "POST",
		success:function(data, status, xhr){
//			console.log(data, status, xhr);
			if(data > 0){
				commonAlert("삭제가 완료되었습니다.");
				elem.parent().remove();
			}else {
				commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
			}
		}, 
		error:function(xhr, status, error){
//			console.log(xhr, status, error);
			commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
		}
	});//ajax
}//deleteReply()

/** 	댓글 출력	 **/
function putReply(data){
	var ul = $('.replyList').empty();
	$.each(data.list, function(idx, vo){
		var li = $('<li>').text(vo.contents + " " + vo.memberId + " " + vo.registDate);
		var no = vo.commentNo;
		var btn = $('<button type="button">').text('삭제').on('click', function(e){
			e.preventDefault();
			$(".confirm .message").empty().text("댓글을 삭제 하시겠습니까?");
			$(".confirm").modal({ clickClose: false, showClose : false});
			$(".modal .ok").off("click").on("click", function(e){		//Modal OK
				e.preventDefault();
				$.modal.close();
				deleteReply(no, btn);
			});
			
		}).appendTo(li);
		li.appendTo(ul);
	});
}//putReply()

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




