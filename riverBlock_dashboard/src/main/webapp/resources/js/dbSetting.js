var settingButton = document.getElementById("settingButton");

settingButton.addEventListener("click", ()=>{
    console.log("클릭");

    ipFetch();
});


// IP명 받기
async function getDBIP() {
    const { value: ipAddr } = await Swal.fire({
        title: "IP를 입력해주세요.",
        input: "text",
        inputLabel: "IP를 입력해주세요.",
        showCancelButton: true,
        inputValidator: (value) => {
            // console.log("value : ", value);
            if (!value) {
                return getDBIP();
            }
        }
    });
    // console.log("ipAddr: ", ipAddr);
    return ipAddr;
}

let dataBaseIP;


// 비동기로 IP 받아오기
async function ipFetch(){

    const ipAddr = await getDBIP();
    // console.log("ipAddr2: ", ipAddr);


    if (ipAddr) {
        fetch("ipAddrFetch", { 
            method : "POST", 
            headers: {"Content-Type": "application/json"}, 
            body : JSON.stringify( {"ipAddr":ipAddr} ) 
        })
        .then(resp => resp.json()) // 요청에 대한 응답 객체(response)를 필요한 형태로 파싱
        .then((result) => {
            // console.log("ipAddr result : ", result);

            dataBaseIP = result.ipAddr;
            console.log("dataBaseIP : ", dataBaseIP);
            sendToServer(dataBaseIP, forDate)


        }).catch( err => {
            // console.log("err : ", err);
            Swal.fire("데이터를 불러올 수 없습니다.");
        }); // 예외 발생 시 처리할 내용을 작성

    }

}