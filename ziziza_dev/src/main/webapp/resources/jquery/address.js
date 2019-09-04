/**
 * 
 */
var daumAddress;
function openDaumAddressPopup() {
	if(daumAddress == null){
		daumAddress = new daum.Postcode({
			oncomplete: function(data) {
				var addr = ""; var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				
				//무조건 도로명 주소만
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				    addr = data.roadAddress;
				} else { 							// 사용자가 지번 주소를 선택했을 경우(J)
				    addr = data.roadAddress || data.autoRoadAddress;
				}//if end
				
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== ''){
				extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
				}
                
				$(".addressBox .zoneCode").val(data.zonecode);
				$(".addressBox .address").val(addr + extraAddr);
				$(".addressBox .detailAddress").val('');
			}
		});
	}//if end
	daumAddress.open();
}///