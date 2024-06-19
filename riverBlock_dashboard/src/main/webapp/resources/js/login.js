
document.getElementById("settingBtn").addEventListener("click", ()=>{
    getDBIP();
});

const loginFrm = document.getElementById("loginFrm");
const inputIp = document.querySelector("#loginFrm input[name='serverip']");
const inputPort = document.querySelector("#loginFrm input[name='port']");
const inputUserId = document.querySelector("#loginFrm input[name='user_id']");
const inputUserPw = document.querySelector("#loginFrm input[name='user_pw']");




document.getElementById('loginFrm').addEventListener('submit', async function(event) {
    event.preventDefault(); // 기본 폼 제출 중단

    savedIP = getIP_FromLocalStorage().saveIP;
    // console.log("savedIP : ", savedIP);
    savePORT = getPORT_FromLocalStorage().savePORT;
    // console.log("savePORT : ", savePORT);

    if (!savedIP || savedIP === 'undefined' || !savePORT || savePORT === 'undefined') {
        await getDBIP();
        savedIP = getIP_FromLocalStorage().saveIP;
        savePORT = getPORT_FromLocalStorage().savePORT;
    }

    if (!savedIP || savedIP === 'undefined') {
        Swal.fire("IP를 입력해주세요");
        return;
    }
    if (!savePORT || savePORT === 'undefined') {
        Swal.fire("PORT를 입력해주세요");
        return;
    }

    if (savedIP == 'undefined' || !savePORT == 'undefined') {
        await getDBIP();
        savedIP = getIP_FromLocalStorage().saveIP;
        savePORT = getPORT_FromLocalStorage().savePORT;
    }

    if (!savedIP) {
        Swal.fire("IP를 입력해주세요");
        return;
    }
    if (!savePORT) {
        Swal.fire("PORT를 입력해주세요");
        return;
    }

    /* id 체크 */
    if (inputUserId.value.trim().length == 0) {
        Swal.fire("아이디를 입력해주세요");
        return;
    }
    /* pw 체크 */
    if (inputUserPw.value.trim().length == 0) {
        Swal.fire("비밀번호를 입력해주세요");
        return;
    }

    // 폼에 IP와 PORT를 추가
    const ipInput = document.createElement('input');
    ipInput.type = 'hidden';
    ipInput.name = 'inputIP';
    ipInput.value = savedIP;

    const portInput = document.createElement('input');
    portInput.type = 'hidden';
    portInput.name = 'inputPORT';
    portInput.value = savePORT;

    this.appendChild(ipInput);
    this.appendChild(portInput);

    if (loginFrm != null) {
        this.submit(); // 폼 제출
    }

});