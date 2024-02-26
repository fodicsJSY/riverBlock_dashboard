<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainPage</title>

    <%-- echarts --%>
    <script src="/resources/js/echart/echart.min.js"></script>

    <%-- jquery --%>
    <script src="/resources/js/jquery/jquery.min.js"></script>


    <%-- css --%>
    <link rel="stylesheet" href="/resources/css/main.css">

    <style>


    </style>
    


</head>
<body>
<c:set var="rushHourPeopleCountList" value="${rushHourPeopleCountList}"/>
    <main>
    <section>
        <%-- 
        **** 디자인에 있는 통계버튼은 만들어만 놓고 주석처리하기 **** 
        --%>

            <div class="sectionBox1" >
                <div class="containerBox01">
                    <div class="innerBox03">
                        <div class="logoContainer"><img src="/resources/img/logo.png" class="logoIcon" alt=""></div>
                        <div class="dashboardTitleBox">
                            <div class="dashboard">DASHBOARD</div>
                            <div class="dashboardTitle">하천진출통계</div>
                        </div>
                    </div>
                    <div class="innerBox04">
                        <div class="leftTitleBox" >
                            <div class="leftImgContainer"><img src="/resources/img/iconList_favorite.png" class="markerIcon" alt=""></div>
                            <div class="leftTitle">게이트 현황</div>
                        </div>
                        <div class="dataContainer01">
                            <div class="leftDataBox dataTotal">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/icon_chLive.png" class="chLiveIcon" alt=""></div>
                                    <div class="dataStats">Total</div>
                                </div>
                                <div class="dataCount">999개소</div>
                            </div>
                            <div class="leftDataBox dataSection">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/connect-signalOK.png" class="dataStatsImg" alt=""></div>
                                    <div class="dataStats">열림</div>
                                </div>
                                <div class="dataCount">999개소</div>
                            </div>
                            <div class="leftDataBox dataSection">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/connect-signalNO.png" class="dataStatsImg" alt=""></div>
                                    <div class="dataStats">닫힘</div>
                                </div>
                                <div class="dataCount">99개소</div>
                            </div>
                            <div class="leftDataBox dataSection">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/connect-signalBAD.png" class="dataStatsImg" alt=""></div>
                                    <div class="dataStats">통신불량</div>
                                </div>
                                <div class="dataCount">9개소</div>
                            </div>
                        </div>
                    </div>
                    <div class="innerBox04">
                        <div class="leftTitleBox" >
                            <div class="leftImgContainer"><img src="/resources/img/iconList_cctv.png" class="cctvIcon" alt=""></div>
                            <div class="leftTitle">카메라정보</div>
                        </div>
                        <div class="dataContainer01">
                            <div class="leftDataBox dataTotal">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/icon_chLive.png" class="chLiveIcon" alt=""></div>
                                    <div class="dataStats">Total</div>
                                </div>
                                <div class="dataCount">999개소</div>
                            </div>
                            <div class="leftDataBox dataSection">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/connect-signalOK.png" class="dataStatsImg" alt=""></div>
                                    <div class="dataStats">열림</div>
                                </div>
                                <div class="dataCount">999CH</div>
                            </div>
                            <div class="leftDataBox dataSection">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/connect-signalNO.png" class="dataStatsImg" alt=""></div>
                                    <div class="dataStats">끊어짐</div>
                                </div>
                                <div class="dataCount">99CH</div>
                            </div>
                            <div class="leftDataBox dataSection">
                                <div class="dataStatsBox">
                                    <div class="dataStatsImgBox"><img src="/resources/img/connect-signalBAD.png" class="dataStatsImg" alt=""></div>
                                    <div class="dataStats">통신불량</div>
                                </div>
                                <div class="dataCount">9CH</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sectionBox2" >
                <div class="containerBox02">
                    <div class="innerBox01 innerheader">
                        <div class="headerBtnBox">
                            <input type="date" class="calendarBtn abled" id="calenderButton">
                            <button class="arrowBtn abled" id="leftBtn"><img src="/resources/img/icon_goLeft.png" class="arrowIcon" alt=""></button>
                            <input type="date" class="inputDateBtn" id="inputDate">
                            <button class="arrowBtn abled" id="rightBtn"><img src="/resources/img/icon_goRight.png" class="arrowIcon" alt=""></button>
                            <button class="textBtn abled" id="yesterdayBtn">어제</button>
                            <button class="textBtn abled" id="todayBtn">오늘</button>
                            <button class="textBtn abled" id="beforeWeekBtn">1주전</button>
                        </div>
                        <div class="statsBtnBox"><button class="statsBtn" ><img src="/resources/img/icon_stats.png" class="statsIcon" alt="" disabled>&nbsp;통계</button></div>
                    </div>

                    
                    <div class="innerBox02">
                        <div class="chartBox">
                            <div class="titleBox">
                                <div class="titleText01">시간별 개문 횟수</div>
                            </div>
                            <div class="dataBox" >
                                <div id="openCount" style="width: 100%; height: 100%;">

                                </div>
                            </div>
                        </div>
                        <div class="chartBox">
                            <div class="titleBox">
                                <div class="titleText01">시간별 패문 횟수</div>
                            </div>
                            <div class="dataBox">
                                <div id="closeCount" style="width: 100%; height: 100%;"> 
                                
                                </div>
                            </div>
                        </div>
                        <div class="chartBox">
                            <div class="titleBox">
                                <div class="titleText01">게이트 현황</div>
                            </div>
                            <div class="dataBox tablebox">
                                <div class="tableContainer">
                                    <%-- <table class="gateTable">
                                        <thead class="gateThead">
                                            <tr>
                                                <th class="gateth">게이트명</th>
                                                <th class="gateth">위치</th>
                                                <th class="gateth">개폐여부</th>
                                                <th class="gateth">통신상태</th>
                                            </tr>
                                        </thead>
                                        <tbody class="gateTbody">
                                            <tr >
                                                <td class="gatetd">게이트 이름</td>
                                                <td class="gatetd">게이트 위치</td>
                                                <td class="gatetd gate"><div class="gateIconBox"><img src="/resources/img/iconBTN_GateClose.png" class="gateIcon"></div></td>
                                                <td class="gatetd"><div class="signalIconBox"><img src="/resources/img/connect-signalNO.png" class="signalIcon"></div></td>
                                            </tr>
                                        </tbody>
                                    </table> --%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="innerBox02 innerBox1">
                        <div class="titleBox">
                            <div class="titleText02">일별 구동 횟수</div>
                            <div class="titleText03">게이트 개폐 횟수 TOP 10</div>
                        </div>
                        <div class="dateDataBox">
                            <div id="dateData" style="width: 100%; height: 100%;">
                            </div>
                        </div>
                    </div>
                    <div class="innerBox01 innerFooter">
                        <div class="text"> ※ 화면에 표시된 모든 실시간 데이터는 1분마다 자동으로 업데이트 합니다. 다만 "시간대별 현황" 그래프의 실시간 데이터는 정시에 한 번씩 업데이트 합니다.</div>
                        <div><img src="/resources/img/fodics_logo.png" alt=""></div>
                    </div>
                </div>
            </div>
    </section>
    </main>



    <script>

    </script>

    <%-- 전역변수 시작 --%>
    <script>
        // var kimpo7to8Count = ${kimpo7to8Count != null ? kimpo7to8Count : 0};
        // var kimpo8to9Count = ${kimpo8to9Count != null ? kimpo8to9Count : 0};
        // var kimpo9to10Count = ${kimpo9to10Count != null ? kimpo9to10Count : 0};
        // var gochon7to8Count = ${gochon7to8Count != null ? gochon7to8Count : 0};
        // var gochon8to9Count = ${gochon8to9Count != null ? gochon8to9Count : 0};
        // var gochon9to10Count = ${gochon9to10Count != null ? gochon9to10Count : 0};
        // var pungmu7to8Count = ${pungmu7to8Count != null ? pungmu7to8Count : 0};
        // var pungmu8to9Count = ${pungmu8to9Count != null ? pungmu8to9Count : 0};
        // var pungmu9to10Count = ${pungmu9to10Count != null ? pungmu9to10Count : 0};
    </script>
    <%-- 전역변수 끝 --%>

    <%-- js --%>
    <script src="/resources/js/date.js"></script>
    <script src="/resources/js/lineChart.js"></script>
    <script src="/resources/js/openCountChart.js"></script>
    <script src="/resources/js/closeCountChart.js"></script>
    <script src="/resources/js/table.js"></script>
</body>
</html>
