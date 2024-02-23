    /* 전역변수 시작 */
    var forDate = new Date(document.getElementById('inputDate').value);
    /* 전역변수 끝 */

    /* 오늘 날짜로 초기화 시작*/
    // 페이지 로드 시 오늘 날짜로 초기화
    document.addEventListener("DOMContentLoaded", ()=> {
        today();
    });
    /* 오늘 날짜로 초기화 끝*/

    document.getElementById('calenderButton').addEventListener('change', function() {
        inputDate.value = this.value;
        sendToServer(this.value);

    });


    document.getElementById('leftBtn').addEventListener("click", ()=>{
        console.log("leftBtn클릭");
        beforeOneDay();
        sendToServer();
    });


    document.getElementById('rightBtn').addEventListener("click", ()=>{
        console.log("rightBtn클릭");
        afterOneDay();
        sendToServer();
    });


    document.getElementById('yesterdayBtn').addEventListener("click", ()=>{
        console.log("yesterdayBtn클릭");
        yesterday();
        sendToServer();
    });


    document.getElementById('todayBtn').addEventListener("click", ()=>{
        console.log("todayBtn클릭");
        today();
        sendToServer();
    });


    document.getElementById('beforeWeekBtn').addEventListener("click", ()=>{
        console.log("beforeWeekBtn클릭");
        before1weekBtn();
        sendToServer();
    });




// 하루 전으로 초기화 
function beforeOneDay(){
    var inputDate = new Date(document.getElementById('inputDate').value);
    inputDate.setDate(inputDate.getDate() - 1);
    var formattedDate = inputDate.toISOString().substring(0, 10);
    document.getElementById('inputDate').value = formattedDate;
    forDate = formattedDate; // forDate 업데이트
    console.log("하루 전 : ", forDate);
}


// 다음 날짜로 초기화
function afterOneDay(){
    var inputDate = new Date(document.getElementById('inputDate').value);
    inputDate.setDate(inputDate.getDate() + 1);
    var formattedDate = inputDate.toISOString().substring(0, 10);
    document.getElementById('inputDate').value = formattedDate;
    forDate = formattedDate; // forDate 초기화
    console.log("다음 날짜 : ", forDate);
    
}


// 어제 날짜로 초기화
function yesterday(){
    var yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1); // 어제의 날짜로 설정
    var formattedDate = yesterday.toISOString().substring(0, 10);
    inputDate.value = formattedDate;
    console.log("formattedDate : ", formattedDate);
    forDate = formattedDate; // forDate 초기화
    console.log("어제 날짜 : ", forDate);
}


// 오늘 날짜로 초기화
function today(){
    var today = new Date();
    var formattedDate = today.toISOString().substring(0, 10);
    inputDate.value = formattedDate;
    console.log("formattedDate : ", formattedDate);
    forDate = formattedDate; // forDate 초기화
    console.log("오늘날짜 : ", forDate);
}

// 1주 전으로 초기화
function before1weekBtn(){
    var beforeOneWeek = new Date();
    beforeOneWeek.setDate(beforeOneWeek.getDate() - 7); 
    var formattedDate = beforeOneWeek.toISOString().substring(0, 10);
    document.getElementById('inputDate').value = formattedDate;
    console.log("formattedDate : ", formattedDate);
    forDate = formattedDate; // forDate 초기화
    console.log("1주전 날짜 : ", forDate);
    
}



inputDate.addEventListener('keyup', function() {
    console.log("inputDate 변경됨 : ", this.value);
    sendToServer(this.value);
});



/* 날짜 보내기 */
function sendToServer(value) {
    // 형식을 YYYYMMDD로 변경
    let occuDate = formatToYYYYMMDD(value || forDate);
    console.log('Sending occuDate to server:', occuDate); // 콘솔에 occuDate 값 로그 출력

}

/* 날짜 형식화 함수 */
/* YYYYMMDD 형식으로 변환하는 함수 */
function formatToYYYYMMDD(dateString) {
    var year = dateString.substring(0, 4);
    var month = dateString.substring(5, 7);
    var day = dateString.substring(8, 10);
    return year + month + day;
}