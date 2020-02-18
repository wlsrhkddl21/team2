/**
 * 
 */

// 타임스탬프(밀리세컨드) 값을 받아서 문자열 형태로 반환
function dateString(mSec) {
	var d = new Date(mSec);
	var year = d.getFullYear(); // 년
	var month = d.getMonth() + 1;	// 월
	var date = d.getDate();		// 일
	var hour = d.getHours();	// 시
	var minute = d.getMinutes(); // 분
	var sec = d.getSeconds();	// 초
	
	return year + "/" + 
		   make2digits(month) + "/" + 
		   make2digits(date) + " " + 
		   make2digits(hour) + ":" + 
		   make2digits(minute) + ":" + 
		   make2digits(sec);
}

function make2digits(num){
	if(num<10){
		num = "0" + num;
	}
	return num;
//	return (num < 10) ? "0" + num : num;
}
