function makeTable(data){
    console.log("테이블 생성");
    var tableContainer = document.querySelector(".tableContainer");
    tableContainer.innerHTML = ""; // Clear previous data

    var gateTable = document.createElement("table");
    gateTable.className = "gateTable";
    tableContainer.appendChild(gateTable);

    var gateThead = document.createElement("thead");
    gateThead.className = "gateThead";
    gateTable.appendChild(gateThead);

    var htr = document.createElement("tr");
    gateThead.appendChild(htr);

    createCell(htr, "th", "gatetd gateName", "게이트명");
    // createCell(htr, "th", "gatetd", "위치");
    createCell(htr, "th", "gatetd gateYN", "개폐여부");
    createCell(htr, "th", "gatetd signal", "통신상태");


    var gateTbody = document.createElement("tbody");
    gateTbody.className = "gateTbody";
    gateTable.appendChild(gateTbody);

    var tr = document.createElement("tr");
    gateTbody.appendChild(tr);

    createCell(tr, "td", "gatetd", data);

    var div1 = document.createElement("div");
    div1.className = "gateIconBox";
    tr.appendChild(div1);
    
    let gateImg =  document.createElement("img");
    gateImg.className = "gateIcon";
    gateImg.src = "/resources/img/iconBTN_GateClose.png";
    div1.appendChild(gateImg);

    let signalImg =  document.createElement("img");
    signalImg.className = "signalIcon";
    signalImg.src = "/resources/img/connect-signalNO.png";



    // createCell(tr, "td", "gatetd", data);
    createCell(tr, "td", "gatetd gate", div1);
    createCell(tr, "td", "gatetd", signalImg.outerHTML);
}

function createCell(row, elementType, className, content) {
    var cell = document.createElement(elementType);
    cell.className = className;
    
    // 이미지 엘리먼트인 경우에는 바로 추가
    if (typeof content === 'object' && content instanceof HTMLElement) {
        cell.appendChild(content);
    } else {
        cell.innerHTML = content;
    }

    row.appendChild(cell);
}

