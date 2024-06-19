var settingButton = document.getElementById("settingButton");

settingButton.addEventListener("click", ()=>{
    console.log("클릭");

    getDBIP();

});



// ip 2개 받아서 로그인하는 것으로 수정해야 함

// IP명 받기
async function getDBIP() {
    const { value: formValues } = await Swal.fire({
        title: "IP와 PORT를 입력해주세요.",
        html: `
            <input id="swal-input1" class="swal2-input" placeholder="IP">
            <input id="swal-input2" class="swal2-input" placeholder="PORT">
        `,
        focusConfirm: true,
        preConfirm: () => {
            const inputIP = document.getElementById('swal-input1').value;
            const inputPORT = document.getElementById('swal-input2').value;

            if (!inputIP || !inputPORT) {
                Swal.showValidationMessage('IP와 PORT 모두 입력해주세요.');
                return;
            }

            return { inputIP, inputPORT };
        },
        showCancelButton: true,
    });

    if (formValues) {
        const { inputIP, inputPORT } = formValues;
        saveIP_ToLocalStorage(inputIP);
        savePORT_ToLocalStorage(inputPORT);
        // initialize(dataIP, input1, input2);  // 필요한 경우 초기화 호출
    }
}



// 로컬 스토리지에 IP 주소를 저장하는 함수
function saveIP_ToLocalStorage(inputIP) {
    localStorage.setItem("inputIP", inputIP);
}

// 로컬 스토리지에서 IP 주소를 가져오는 함수
function getIP_FromLocalStorage() {
    return {
        saveIP: localStorage.getItem("inputIP")
    };
}


// 로컬 스토리지에 PORT를 저장하는 함수
function savePORT_ToLocalStorage(inputPORT) {
    localStorage.setItem("inputPORT", inputPORT);
}

// 로컬 스토리지에서 PORT를 가져오는 함수
function getPORT_FromLocalStorage() {
    return {
        savePORT: localStorage.getItem("inputPORT")
    };
}






