function makeTable(data){
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

    createCell(htr, "th", "gatetd", "게이트명");
    createCell(htr, "th", "gatetd", "위치");
    createCell(htr, "th", "gatetd", "개폐여부");
    createCell(htr, "th", "gatetd", "통신상태");


    var gateTbody = document.createElement("tbody");
    gateTbody.className = "gateTbody";
    gateTable.appendChild(gateTbody);

    var tr = document.createElement("tr");
    gateTbody.appendChild(tr);

    createCell(tr, "td", "gatetd", data);
    createCell(tr, "td", "gatetd", data);
    createCell(tr, "td", "gatetd gate", data);
    createCell(tr, "td", "gatetd", data);
}

function createCell(row, elementType, className, content) {
    var cell = document.createElement(elementType);
    cell.className = className;
    cell.innerHTML = content;
    row.appendChild(cell);
}