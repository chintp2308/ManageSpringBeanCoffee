<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="navbar navbar-expand-md navbar-dark d-print-none" data-bs-theme="light">
    <div class="container-xl">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu"
                aria-controls="navbar-menu" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
            <a href="<c:url value="/user/home"/>">
                <img src="<c:url value="/template/admin/static/img/cover.png"/>" alt="SpringBeanCoffee"
                     class="navbar-brand-image">
            </a>
        </div>
        <div class="navbar-nav flex-row order-md-last">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown"
                   aria-label="Open user menu">
                    <c:choose>
                        <c:when test="${not empty currentAccount}">
                            <div class="d-none d-lg-block px-2">
                                <div class="text-primary mb-2">${currentAccount.fullname}</div>
                                <c:choose>

                                    <c:when test="${not empty currentAccount.roles and currentAccount.roles[0] != null}">
                                        <c:if test="${currentAccount.roles[0].name == 'ROLE_ADMIN'}">
                                            <div class="small text-secondary float-end">Quản trị viên</div>
                                        </c:if>

                                        <c:if test="${currentAccount.roles[0].name == 'ROLE_EMPLOYEE'}">
                                            <div class="small text-secondary float-end">Nhân viên</div>
                                        </c:if>

                                        <c:if test="${currentAccount.roles[0].name == 'ROLE_MANAGER'}">
                                            <div class="small text-secondary float-end">Quản lý</div>
                                        </c:if>

                                    </c:when>
                                    <c:otherwise>
                                        <div class="small text-secondary float-end">Chưa có vai trò</div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="d-none d-lg-block px-2">
                                <div class="text-primary mb-2">Không có tài khoản hiện tại</div>
                                <div class="text-secondary float-end">Khách</div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <span class="avatar" style="background-image: url(<c:url
                            value="/template/admin/static/img/user-avatar-default.jpg"/>)"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow" data-bs-theme="light">
                    <a href="<c:url value='/auth/logout' />" class="dropdown-item">Đăng xuất</a>
                </div>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbar-menu">
            <div class="d-flex flex-column flex-md-row flex-fill align-items-stretch align-items-md-center">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/home" />">
                        <span class="nav-link-icon d-md-none d-lg-inline-block">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                               stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                               class="icon"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path
                                  d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path
                                  d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path
                                  d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"></path></svg>
                        </span>
                            <span class="navbar-text">Trang chủ</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/order" />">
                        <span class="nav-link-icon d-md-none d-lg-inline-block">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                               stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                               class="icon icon-tabler icons-tabler-outline icon-tabler-shopping-cart"><path
                                  stroke="none" d="M0 0h24v24H0z" fill="none"/><path
                                  d="M6 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"/><path
                                  d="M17 19m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"/><path d="M17 17h-11v-14h-2"/><path
                                  d="M6 5l14 1l-1 7h-13"/></svg>
                        </span>
                            <span class="navbar-text">Đặt món</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/schedule" />">
                        <span class="nav-link-icon d-md-none d-lg-inline-block">
                         <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                              class="icon icon-tabler icons-tabler-outline icon-tabler-calendar"><path stroke="none"
                                                                                                       d="M0 0h24v24H0z"
                                                                                                       fill="none"/><path
                                 d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z"/><path
                                 d="M16 3v4"/><path d="M8 3v4"/><path d="M4 11h16"/><path d="M11 15h1"/><path
                                 d="M12 15v3"/></svg>
                        </span>
                            <span class="navbar-text">Lịch làm việc</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</header>
