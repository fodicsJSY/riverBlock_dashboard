<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mainPage</title>


    <%-- css --%>
    <link rel="stylesheet" href="../../resources/css/main-style.css">

    <style>

        *{ 
            box-sizing: border-box;
            padding: 0;
            margin: 0;
            background-color: #1e1e1e;
            color:white;
            font-family: NanumSquareEB;
        }

        button:hover, a:hover{
            cursor: pointer;
        }


        /* 다 만들고 삭제예정 */
        div, main, section, header, footer, article, nav, aside, form 
        { border: 1px solid yellow; }  


        body {
            /* display: flex;
            flex-direction: column;
            justify-content: center; */
            min-height: 100vh; /* 최소 높이를 뷰포트 높이의 100%로 설정합니다. */
        }



        main{
            margin: auto;
            min-width: 100vh;
            min-height: 100vh;
            /* min-height: 요소의 최소 높이  
                            -> 내부 요소 없어도 최소 높이 유지
                            -> 내부 요소가 지정된 크기를 초과하면 
                                그에 맞게 늘어남
            */
            
        }


        section{
            width:100%;
            height:100%;
            display: grid;
            /* grid-template-columns: repeat(2, 1fr);  */
            /* grid-auto-rows: 200px; */
            gap: 15px;
            grid-template-areas:
                "a a a"
                "b b c"
                "b b c"
            ;
        }

        .gridBox{
            border: 1px solid white;
        }


        
        .gridBox1{
            grid-area: a;
            /* min-height: 200px; */
            max-width: 100%;
        }
        .gridBox2{
            grid-area: b;
            /* min-height: 900px; */
            width: 100%;
            min-height: 1000px;
        }

        .gridBox3{
            grid-area: c;
            width: 100%;
        }


        .cameraContainer{
            width:100%;
            height:100%;
            display: grid;
            gap: 15px;
            grid-template-areas:
                "a b"
                "a b"
                "c c"
            ;
        }


        .cameraBox1{
            grid-area: a;
            min-height: 500px;
        }
        .cameraBox2{
            grid-area: b;
        }
        .cameraBox3{
            grid-area: c;
            min-height: 250px;
        }

    </style>
    
</head>
<body>
<c:set var="rushHourPeopleCountList" value="${rushHourPeopleCountList}"/>
    <main>
    <section>
        <div class="gridBox gridBox1" style="background-color: red; ">
            <div class="headContainer" style="background-color: yellow;">
                <div class="modeContainer" >
                    <div class="searchBox" style="display: flex; justify-content: space-around;">
                        <div><input type="date" id="mainDateSearch" aria-label="Date-Time"></div>
                        <div><button type="button" id="rushHourModeSearchBtn">검색</button></div>
                    </div>
                    <div><a href="/"><button type="button">출근 모드 (7시 ~ 9시)</button></a></div>
                    <div><a href="/normalMode"><button type="button">기본 모드</button></a></div>
                    <div><button id="csvBtn">csv</button></div>
                    <div class="modeBox" style="display: flex; ">
                    </div>
                </div>
                <div class="clockContainer">
                    <h1><p id="time_title" class="time">2021-00-00 10:00:00</p></h1>
                </div>
            </div>
        </div>
        <div class="gridBox gridBox2" style="background-color: orange; width: 100%">
                <%-- 막대차트 캔버스 --%>
            <div class="chartContainer" id="rushHourChart" style="width: 100%; height:100%;">
            </div> 
        </div>
        <div class="gridBox gridBox3" style="width: 100%">
            <div class="cameraContainer" style="background-color: yellow;">
                <div class="cameraBox cameraBox1"  style="background-color: green;">
                    <div class="throngChartTitleBox">
                        <h1>고촌역 군중밀집</h1>
                    </div>
                    <div class="throngChartBox">
                        <div class="throngChartTitle">
                            플랫폼1
                        </div>
                        <div class="throngChartContainer" id="gochon1">
                            <%-- 게이지차트 캔버스 --%>
                        </div>

                    </div>
                    <div class="throngChartBox">
                        <div class="throngChartTitle">
                            플랫폼2
                        </div>
                        <div class="throngChartContainer" id="gochon2">
                            <%-- 게이지차트 캔버스 --%>
                        </div>
                    </div>
                </div>
                <div class="cameraBox cameraBox2"  style="background-color: blue;">
                    <div class="throngChartTitleBox">
                        <h1>풍무역 군중밀집</h1>
                    </div>
                    <div class="throngChartBox">
                        <div class="throngChartTitle">
                            플랫폼1
                        </div>
                        <div class="throngChartContainer" id="pungmu1">
                            <%-- 게이지차트 캔버스 --%>
                        </div>
                    </div>
                    <div class="throngChartBox">
                        <div class="throngChartTitle">
                            플랫폼2
                        </div>
                        <div class="throngChartContainer" id="pungmu2">
                            <%-- 게이지차트 캔버스 --%>
                        </div>
                    </div>
                </div>
                <div class="cameraBox cameraBox3" style="background-color: violet;">
                    <div>일일 누계</div>
                    <div>
                        <div>(유출)김포공항역: </div>
                        <div>112233명</div>
                    </div>
                        
                    ${rushHourPeopleCountList}
                </div>
            </div>
        </div>
    </section>
    </main>

    <%-- CSV 대화상자 --%>
    <dialog open id="csv_dialog" style = "display:none; background-color: rgba(30,30,30,1); color:rgba(192,192,192,1); width: 336px; padding: 0px; top:80px; left:980px;">		
        <div style = "font-size: 14px; width: 330px; background-color: rgba(45,45,45,1); color:rgba(255,255,255,1); padding: 16px; ">
            <p>.csv 파일로 내려받기를 원하시는 항목을 선택</p>						
            <p style = "margin-top: 6px">하여 체크한 후 [확인] 버튼을 누르세요.</p>
        </div>
        <div style = "width: 330px;  border: 1px solid gray;"></div>
        <div style = "margin : 15px;"><input name="round" id="chk_csv_rushHourChart" type="checkbox"> <label for="chk_csv_rushHourChart"> 누적집계차트</label></div>
        <div style = "margin : 15px;"><input name="round" id="chk_csv_gochon1" type="checkbox">  <label for="chk_csv_gochon1">고촌1군중밀집</label></div>
        <div style = "margin : 15px;"><input name="round" id="chk_csv_gochon2" type="checkbox"> <label for="chk_csv_gochon2">고촌2군중밀집</label></div>
        <div style = "margin : 15px;"><input name="round" id="chk_csv_pungmu1" type="checkbox"> <label for="chk_csv_pungmu1"> 풍무1군중밀집</label></div>
        <div style = "margin : 15px;"><input name="round" id="chk_csv_pungmu2" type="checkbox">  <label for="chk_csv_pungmu2">풍무2군중밀집</label></div>
        <div style = "margin : 15px;"><input name="round" id="chk_csv_rushHourDaliyTotal" type="checkbox"> <label for="chk_csv_rushHourDaliyTotal">일일누계</label></div>
        <div style = "margin : 10px; float: right;">
            <a class="rollover" alt="확인" OnClick="OnCSV_OK()"><img  src="../../resources/img/btn_popConfirm.png"> <img src="../../resources/img/btn_popConfirm_hover.png" class="over"></a>
            <a class="rollover" alt="취소" OnClick="OnCSV_Cancel()"><img src="../../resources/img/btn_popCancel.png"> <img src="../../resources/img/btn_popCancel_hover.png" class="over"></a>
        </div>
    </dialog>

    <%-- 전역변수 시작 --%>
    <script>
        var kimpo7to8Count = ${kimpo7to8Count != null ? kimpo7to8Count : 0};
        var kimpo8to9Count = ${kimpo8to9Count != null ? kimpo8to9Count : 0};
        var kimpo9to10Count = ${kimpo9to10Count != null ? kimpo9to10Count : 0};
        var gochon7to8Count = ${gochon7to8Count != null ? gochon7to8Count : 0};
        var gochon8to9Count = ${gochon8to9Count != null ? gochon8to9Count : 0};
        var gochon9to10Count = ${gochon9to10Count != null ? gochon9to10Count : 0};
        var pungmu7to8Count = ${pungmu7to8Count != null ? pungmu7to8Count : 0};
        var pungmu8to9Count = ${pungmu8to9Count != null ? pungmu8to9Count : 0};
        var pungmu9to10Count = ${pungmu9to10Count != null ? pungmu9to10Count : 0};
    </script>
    <%-- 전역변수 끝 --%>

    <%-- echarts --%>
	<script src="https://cdn.jsdelivr.net/npm/echarts@5.4.3/dist/echarts.min.js"></script>

    <script src="../../resources/js/clock.js"></script>
    <script src="../../resources/js/mainSearch.js"></script>
    <script src="../../resources/js/rushHourChart.js"></script>
    <script src="../../resources/js/rushHour_csv.js"></script>
    <script src="../../resources/js/gauge.js"></script>
    <script src="../../resources/js/dialog.js"></script>
    <%-- <script src="../../resources/js/refresh.js"></script> --%>
</body>
</html>
