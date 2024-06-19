<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하천진출통계</title>
    <%-- <link rel="shortcut icon" type="image/png" href="/resources/img/slogan.png" sizes="192x192"> --%>

        <%-- sweetalert2 --%>
    <script src="/resources/js/sweetalert/sweetalert2.js"></script>

    <link rel="stylesheet" href="/resources/css/login.css">
    <%-- <link rel="stylesheet" href="/resources/css/modal.css"> --%>
</head>
<body>

<%-- 로그인 --%>
    <%-- <header>
        <div class="headContiner">
            <div class="headContent">
                <a href="/"><div class="logoBox"><img class="logo" src="/resources/img/logo.png" alt=""></a></div>
                <div class="menuContiner">
                    <div><a href="/">데이터검색</a></div>
                    <div><a href="/차단기수동제어">장비제어</a></div>
                    <div><a href="/임계값설정">침수설정</a></div>
                    <div><a href="/보고서출력">보고서</a></div>
                </div>
            </div>
        </div>
    </header>
<hr>
    <main>
        <section>
            <div class="sectionBox01">
                <div class="listBox">
                    <div class="listTitle">데이터 검색</div>
                    <div class="listContent"><a href="/" class="pageFoward">강우 데이터</a></div>
                    <div class="listContent"><a href="/flooding" class="pageFoward nowForward">침수 데이터</a></div>
                    <div class="listContent"><a href="/incomingAndOutgoing" class="pageFoward">입출차 정보</a></div>
                </div>
            </div>
            <div class="sectionBox02">
                <div class="searchContainer01">
                    <div class="titleContiner01">
                        <div class="titleBox">
                            <div class="titleName">데이터검색</div>
                            <div class="typeBox">
                                <div class="searchType"><button type="button" class="rainfall active" id="minRainfall"># 10분</button></div>
                                <div class="searchType"><button type="button" class="rainfall" id="dayRainfall"># 일간</button></div>
                                <div class="searchType"><button type="button" class="rainfall" id="monthRainfall"># 월간</button></div>
                                <div class="searchType"><button type="button" class="rainfall" id="yearRainfall"># 연간</button></div>
                                <div class="searchType"><button type="button" class="rainfall" id="dateRainfall"># 기간별</button></div>
                            </div>
                        </div>
                    </div>
                    <div class="titleContiner02">
                        <div class="subTitleBox">
                            <div class="subTitle">
                            ▶ 데이터검색  &gt; 강우데이터  &gt; 시간별강우
                            </div>
                        </div>
                    </div>
                </div>
                <div class="searchContainer02">
                    <div class="measure">(단위 : mm)</div>
                    <div class="selectDate">
                    </div>
                </div>
                <div class="tableContainer"></div>
            </div>
        </section>
    </main> --%>
<header>
    <div class="headContent">
        <div><a href="/login"><div class="logoBox"><img class="logo" src="/resources/img/logo.png" alt=""></a></div></div>
        <div><h1>하천차단 대시보드</h1></div>
    </div>
</header>
<hr>
<main>
    <section>
        <div class="contentsContainer">
            <div>
                <form action="/userLogin" method="post" id="loginFrm">
                    <div class="loginContainer">
                        <div>
                            <%-- <div><a href="/"><div class="logoBox"><img class="slogan" src="/resources/img/slogan.png" alt=""></a></div></div> --%>
                            <div class="loginText">LOGIN</div>
                        </div>
                        <div>
                            <div class="constentsCon">
                                <div class="textCon">
                                    <%-- <div class="textContainer">
                                        IP : 
                                    </div>
                                    <div class="textContainer">
                                        PORT : 
                                    </div> --%>
                                    <div class="textContainer">
                                        ID : 
                                    </div>
                                    <div class="textContainer">
                                        PW : 
                                    </div>
                                </div>
                                <div class="inputCon">
                                    <%-- <div>
                                        <input type="text" name="serverip" id="user_ip" placeholder="ip">
                                    </div>
                                    <div>
                                        <input type="number" name="port" id="user_port" placeholder="port">
                                    </div> --%>
                                    <div>
                                        <input type="text" name="user_id" id="id" placeholder="id">
                                    </div>
                                    <div>
                                        <input type="password"  name="user_pw" id="pw" placeholder="password" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button id="loginSubmit">login</button>
                        </div> 
                    </div>
                </form>
            </div>
            <div>
                <button type="button" class="settingButton" id="settingBtn">설정</button>
            </div>
        </div>
    </section>

</main>

<hr>
    <%-- <jsp:include page="/WEB-INF/views/footer.jsp"/> --%>
    <c:if test="${not empty message}">
        <script>
            Swal.fire({
                text: "${message}",
                icon: 'info',
                confirmButtonText: 'OK'
            });
        </script>
    </c:if>
    <script>
    </script>

    <script src="/resources/js/login.js"></script>
    <script src="/resources/js/dbSetting.js"></script>
    <%-- <script src="/resources/js/modal.js"></script> --%>
</body>
</html>