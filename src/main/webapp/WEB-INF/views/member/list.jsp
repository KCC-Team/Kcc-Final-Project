<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../common.jsp" %>

<link rel="stylesheet" href="../../../resources/member/css/list.css">

<!-- 콘텐츠 영역 -->
<main class="content" id="content">
    <div class="main_content">

        <div class="member-content">
            <div class="member-info">인력 관리</div>
        </div>

        <div class="container1">
            <div class="left-section">
                <table class="sidebar-table1">
                    <thead>
                    <tr>
                        <th>팀명</th>
                        <th>시스템/업무</th>
                        <th>인원수</th>
                    </tr>
                    </thead>
                    <tbody>


                    </tbody>
                </table>
            </div>

            <div class="main-content">
                <h2 class="header1"><span class="member-title">인력</span> 2</h2>

                <div class="team-overview">
                    <div class="team-overview-title">
                        <div class="team-title">팀 개요</div>
                        <div class="btn-group">
                            <button class="">그룹등록</button>
                            <button class="">수정</button>
                            <button class="">삭제</button>
                        </div>
                    </div>

                    <table class="overview-table">
                        <tr>
                            <td class="text-align-right">팀명</td>
                            <td colspan="3">개발팀</td>
                        </tr>
                        <tr>
                            <td class="text-align-right">상위 팀</td>
                            <td>PMS25프로젝트</td>
                            <td class="text-align-right">시스템/업무</td>
                            <td>데이터넣으셈</td>
                        </tr>
                        <tr>
                            <td colspan="4" class="text-align-center">팀 설명</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                데이터 넣으셈
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="team-members">
                    <div class="team-overview-title">
                        <div class="team-title">팀원 목록</div>
                        <div class="btn-group">
                            <button class="">참여시작</button>
                            <button class="">참여종료</button>
                            <button class="">해제</button>
                            <button class="">인력등록</button>
                        </div>
                    </div>
                    <table class="members-table">
                        <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>성명</th>
                            <th>프로젝트</br>권한</th>
                            <th>소속</th>
                            <th>직위</th>
                            <th>예정</br>시작일</th>
                            <th>예정</br>종료일</th>
                            <th>참여</br>시작일</th>
                            <th>참여</br>종료일</th>
                            <th>기술등급</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><a href="#">김동호</a></td>
                            <td>PM</td>
                            <td>S1팀</td>
                            <td>PM</td>
                            <td>2024-03-17</td>
                            <td>2024-03-17</td>
                            <td>종료</td>
                            <td>종료</td>
                            <td>중급</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><a href="#">신준목</a></td>
                            <td>사업관리자</td>
                            <td>사업관리부</td>
                            <td>사업관리부</td>
                            <td>2024-03-17</td>
                            <td>2024-03-17</td>
                            <td>종료</td>
                            <td>종료</td>
                            <td>중급</td>
                        </tr>
                        </tbody>
                    </table>

                </div>

                <div class="member-detail">
                    <div class="team-overview-title">
                        <div class="team-title">인력 상세</div>
                        <div class="btn-group">
                            <button class="">수정</button>
                            <button class="">해제</button>
                        </div>
                    </div>
                    <table class="detail-table">
                        <tr>
                            <td>성명</td>
                            <td colspan="3">홍길동</td>
                        </tr>
                        <tr>
                            <td>프로젝트 권한</td>
                            <td>팀원</td>
                            <td>기술등급</td>
                            <td>데이터넣으셈</td>
                        </tr>
                        <tr>
                            <td>직위</td>
                            <td colspan="3">데이터넣으셈</td>
                        </tr>
                        <tr>
                            <td>예정참여시작일</td>
                            <td></td>
                            <td>예정참여종료일</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>참여시작일</td>
                            <td></td>
                            <td>참여종료일</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td></td>
                            <td>내선전화</td>
                            <td></td>
                        </tr>
                    </table>

                    <div class="team-overview-title">
                        <div class="team-title">소속팀 목록</div>
                    </div>
                    <table class="team-table">
                        <tr>
                            <td>팀명</td>
                            <td>
                                <select>
                                    <option>팀A</option>
                                    <option>팀B</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>팀명</td>
                            <td>
                                <select>
                                    <option>팀A</option>
                                    <option>팀B</option>
                                </select>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>

    </div>
</main>

<script src="../../../resources/member/js/list.js"></script>

<%@ include file="../footer.jsp" %>