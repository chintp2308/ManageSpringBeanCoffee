<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="loadGroupTableUser" value="/api/home/table-user-group"></c:url>
<c:url var="loadDataTableUser" value="/api/home/data-table-user"></c:url>
<c:url var="updateStatusTable" value="/api/home/update-status-table"></c:url>
<c:url var="deleteTableUser" value="/api/home/delete-table-user"></c:url>
<c:url var="loadCategory" value="/api/home/load-category"></c:url>
<c:url var="loadProduct" value="/api/home/data-product"></c:url>
<c:url var="urlImgProduct" value="/template/web/img/product/"></c:url>
<c:url var="urlImgCategory" value="/template/web/img/category/"></c:url>
<c:url var="putOrderTable" value="/api/home/put-order-table"></c:url>
<c:url var="initDataTableOrder" value="/api/home/init-data-table-order"></c:url>
<c:url var="initDataHeaderTableOrder" value="/api/home/init-data-header-table-order"></c:url>
<c:url var="deleteItemOrder" value="/api/home/delete-item-order"></c:url>
<c:url var="putQantityItemOrder" value="/api/home/put-quantity-item-order"></c:url>
<c:url var="putOrder" value="/api/home/put-order"></c:url>
<c:url var="checkOrderTable" value="/api/home/check-order"></c:url>

<style>
    .wrapper {
        height: 35px;
        min-width: 100px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: #FFF;
        border-radius: 12px;
        border: var(--tblr-border-width) var(--tblr-border-style) var(--tblr-border-color);;

    }

    .wrapper span {
        width: 100%;
        text-align: center;
        font-size: 15px;
        font-weight: 600;
        cursor: pointer;
        user-select: none;
    }

    .wrapper span.num {
        font-size: 15px;
        border-right: 2px solid rgba(0, 0, 0, 0.2);
        border-left: 2px solid rgba(0, 0, 0, 0.2);
        pointer-events: none;
    }

    .offcanvas-end {
        width: 120vw; /* Thay đổi kích thước theo nhu cầu của bạn */
        max-width: 600px; /* Đặt kích thước tối đa nếu cần */
    }
</style>
<div id="loading" class="page page-center">
      <div class="container container-slim py-4">
        <div class="text-center">
          <div class="mb-3">
            <a href="." class="navbar-brand navbar-brand-autodark"><img src="<c:url value='/template/admin/static/img/cover.png' />" height="36" alt=""></a>
          </div>
          <div id="textLoading" class="text-secondary mb-3">Đang chuẩn bị dữ liệu...</div>
          <div class="progress progress-sm">
            <div class="progress-bar progress-bar-indeterminate"></div>
          </div>
        </div>
      </div>
    </div>
<div id="content" class="page" hidden>
    <div class="page-wrapper">
        <!-- Page body -->
        <div class="page-body">
            <div class="container-xl">
                <div class="row row-deck row-cards">

                    <div class="col-md-12 col-lg-7">
                        <div class="card">
                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs nav-fill" data-bs-toggle="tabs">
                                    <li class="nav-item">
                                        <a href="#tabs-home-7" class="nav-link active"
                                           data-bs-toggle="tab">
                                            <!-- Download SVG icon from http://tabler-icons.io/i/home -->
                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24"
                                                 height="24"
                                                 viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                                 stroke-linecap="round"
                                                 stroke-linejoin="round">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                <path d="M5 12l-2 0l9 -9l9 9l-2 0"/>
                                                <path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"/>
                                                <path d="M9 21v-6a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v6"/>
                                            </svg>
                                            Phòng Bàn</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#tabs-profile-7" class="nav-link"
                                           data-bs-toggle="tab">
                                            <!-- Download SVG icon from http://tabler-icons.io/i/user -->
                                            <svg xmlns="http://www.w3.org/2000/svg" class="icon me-2" width="24"
                                                 height="24"
                                                 viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                                 stroke-linecap="round"
                                                 stroke-linejoin="round">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                                                <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"/>
                                                <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"/>
                                            </svg>
                                            Thực Đơn</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content">
                                    <div class="tab-pane active show" id="tabs-home-7">

                                        <div style="min-height: 500px;">

                                            <div class="mb-3">
                                                <div id="loadGroupTableUser"
                                                     class="form-selectgroup form-selectgroup-pills">
                                                    <label class="form-selectgroup-item">
                                                        <input type="radio" name="groupTableUser" value="All"
                                                               class="form-selectgroup-input" checked>
                                                        <span class="form-selectgroup-label">Tất Cả</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="groupStatusTable"
                                                           value="2" checked="">
                                                    <span class="form-check-label">Tất Cả</span>
                                                </label>
                                                <label class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="groupStatusTable"
                                                           value="1">
                                                    <span class="form-check-label">Sử Dụng</span>
                                                </label>
                                                <label class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="groupStatusTable"
                                                           value="0">
                                                    <span class="form-check-label">Còn Trống</span>
                                                </label>
                                            </div>


                                            <div class="row" id="tableListTableUser">


                                            </div>
                                        </div>

                                        <div class="card-footer d-flex align-items-center">
                                            <p id="txtPage" class="m-0 text-secondary">Showing <span>1</span> to
                                                <span>8</span> of <span>16</span> entries</p>

                                            <nav class="pagination m-0 ms-auto" aria-label="Page navigation">
                                                <ul class="pagination" id="pagination-tableuser"></ul>
                                            </nav>
                                        </div>

                                    </div>


                                    <div class="tab-pane" id="tabs-profile-7">
                                        <div style="min-height: 500px;">
                                            <div class="mb-3">
                                                <div id="loadCategory" class="form-selectgroup">

                                                    <label class="form-selectgroup-item">
                                                        <input id="selectAll" type="checkbox"
                                                               class="form-selectgroup-input" checked>
                                                        <span class="form-selectgroup-label">Tất Cả</span>
                                                    </label>

                                                </div>

                                                <div class="input-icon col-3 mt-3">
                                                    <input type="text" id="searchProduct" name="search"
                                                           class="form-control" placeholder="Search…">
                                                </div>


                                            </div>

                                            <div class="row" id="loadProduct">

                                            </div>
                                        </div>

                                        <div class="card-footer d-flex align-items-center">
                                            <p id="txtProduct" class="m-0 text-secondary">Showing <span>1</span> to
                                                <span>8</span> of <span>16</span> entries</p>

                                            <nav class="pagination m-0 ms-auto" aria-label="Page navigation">
                                                <ul class="pagination" id="pagination-product"></ul>
                                            </nav>
                                        </div>


                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <div class="col-md-6 col-lg-5">
                        <div class="card">

                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs" id="tabList" data-bs-toggle="tabs">
                                    <!-- Dynamic tabs will be added here -->
                                </ul>
                            </div>
                            <div class="card-body">
                                <div class="tab-content" id="tabContent">
                                    <!-- Dynamic tab content will be added here -->
                                </div>
                            </div>


<div class="card-footer d-flex align-items-center mt-3">
    <div class="d-flex justify-content-between w-100 p-2">
       <!--  <button type="button" class="btn btn-info">Thông Báo</button> -->
        <button type="button" class="btn btn-primary">Chuyển Bàn</button>
        <button type="button" class="btn btn-secondary">Gộp Bàn</button>
        <button id="buttonCheckOut" type="button" class="btn btn-success">Tính Tiền</button>
    </div>
</div>



                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


</div>

<div style=" width: 100vw;" class="offcanvas offcanvas-end " tabindex="-1" id="offcanvasEnd"
     aria-labelledby="offcanvasEndLabel">

    <div class="offcanvas-header">
        <h2 class="offcanvas-title" id="offcanvasEndLabel">Hóa Đơn</h2>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>

    <div class="offcanvas-body">
        <div class="card card-lg">
            <div class="card-body">
                <div class="row">
                    <div class="col-6">
                        <p class="h3">Cửa Hàng</p>
                        <address>
                            Cafe Vui Vẽ<br>
                        </address>
                    </div>
                    <div class="col-6 text-end">
                        <p class="h3">Khách Hàng</p>
                        <address>
                            Khách Ruột<br>
                        </address>
                    </div>
                    <div class="col-12 my-5">
                        <h3>Hóa Đơn Mua Hàng</h3>
                    </div>
                </div>
                <table class="table table-transparent table-responsive">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 1%"></th>
                        <th>Sản Phẩm</th>
                        <th class="text-center" style="width: 1%">Số Lượng</th>
                        <th class="text-end" style="width: 1%">Đơn Giá</th>
                        <th class="text-end" style="width: 1%">Tổng Giá</th>
                    </tr>
                    </thead>
                    <tbody id="loadBill">

                    </tbody>
                </table>
                
              	<div class="col-12 my-5">
                    <h3>Hình Thức Thanh Toán</h3>
                    <div class="mb-3">
                    
<div class="form-selectgroup d-flex justify-content-between">
    <label class="form-selectgroup-item">
        <input type="radio" name="payment" value="1" class="form-selectgroup-input" checked="">
        <span class="form-selectgroup-label">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-cash"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M7 9m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v6a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z"/><path d="M14 14m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"/><path d="M17 9v-2a2 2 0 0 0 -2 -2h-10a2 2 0 0 0 -2 2v6a2 2 0 0 0 2 2h2"/></svg>
            Tiền Mặt
        </span>
    </label>
    <label class="form-selectgroup-item">
        <input type="radio" name="payment" value="2" class="form-selectgroup-input" disabled="true">
        <span class="form-selectgroup-label">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-credit-card-pay"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 19h-6a3 3 0 0 1 -3 -3v-8a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v4.5"/><path d="M3 10h18"/><path d="M16 19h6"/><path d="M19 16l3 3l-3 3"/><path d="M7.005 15h.005"/><path d="M11 15h2"/></svg>
            Chuyển Khoản
        </span>
    </label>
    <label class="form-selectgroup-item">
        <input type="radio" name="payment" value="3" class="form-selectgroup-input" disabled="true">
        <span class="form-selectgroup-label">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon me-1" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M3 3m0 2a2 2 0 0 1 2 -2h14a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-14a2 2 0 0 1 -2 -2z"></path></svg>
            Kết Hợp
        </span>
    </label>
</div>

                      </div>
               </div>

            </div>
        </div>
    </div>

<div class="p-2 d-flex justify-content-end">
    <button type="button" class="btn btn-primary  me-2" data-bs-dismiss="offcanvas">Hủy</button>
    <button type="button" class="btn btn-secondary  me-2">In Tạm Tính</button>
    <button id="paymentButton" type="button" class="btn btn-success  me-2">Thanh Toán</button>
</div>

</div>

<script>

    var currentIndexPageProduct = 1;
    var limitPageProduct = 6;
    var currentIndexPageTable = 1;
    var limitPageTable = 10;

    function message_toastr(type, content) {
        toastr.options = {
            "closeButton": true,
            "debug": true,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr[type](content);
    }

    function message_toastr(type, content, title) {
        // Cấu hình các tùy chọn cho toastr
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Gọi toastr với các tham số được truyền vào
        toastr[type](content, title);
    }

    function activateTab(tabId) {
        const $targetTab = $('#tabList').find(`a[href="#${tabId}"]`);
        if ($targetTab.length) {
            $targetTab.tab('show');
        }
    }

    function setupEventItemOrder() {
        $('.list-group.list-group-flush.list-group-hoverable').each(function () {
            var $tableOrder = $(this);
            var $delete = $tableOrder.find('.delete-item-order');

            $delete.on('click', function () {
                Swal.fire({
                    title: "Xóa Sản Phẩm ?",
                    text: "Bạn muốn xóa sản phẩm này ra khỏi bàn ?",
                    icon: "info",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Xác Nhận"
                }).then((result) => {
                    if (result.isConfirmed) {
                        var id = $(this).data('id');
                        deleteItemOrder(id);
                    }
                });


            });
        });

        $('.wrapper').each(function () {
            var $wrapper = $(this);
            var $minus = $wrapper.find('.minus');
            var $num = $wrapper.find('.num');
            var $plus = $wrapper.find('.plus');

            $minus.on('click', function () {
                var tableOrderId = $(this).data('id');
                var currentVal = parseInt($num.text(), 10);
                if (currentVal > 1) { // Ensure value doesn't go below 0
                    //$num.text(currentVal - 1);
                    putQantityItemOrder(tableOrderId, currentVal - 1, $num);
                }
            });

            $plus.on('click', function () {
                var tableOrderId = $(this).data('id');

                var currentVal = parseInt($num.text(), 10);

                putQantityItemOrder(tableOrderId, currentVal + 1, $num);
            });

        });
    }

    function loadPaginationTableUser(totalPages, currentPage, limit) {
        $('#pagination-tableuser').twbsPagination('destroy');
        $(function () {
            window.pagObj = $('#pagination-tableuser').twbsPagination({
                totalPages: totalPages,
                visiblePages: 3,
                startPage: currentPage,
                first: '<',
                prev: 'Trước',
                next: 'Tiếp',
                last: '>',
                onPageClick: function (event, page) {

                    if (currentIndexPageTable == page) {

                    } else {
                        loadDataTableUser(page, limit);
                        currentIndexPageTable = page;
                    }

                }
            })
        });
    }

    function loadGroupTableUser() {
        $.ajax({
            url: '${loadGroupTableUser}',
            method: 'get',
            success: function (response, textStatus, jqXHR) {
                // Kiểm tra mã trạng thái HTTP
                if (response.code === 200) {

                    var data = response.data;
                    var radioGroup = $('#loadGroupTableUser');

                    $.each(data, function (index, item) {
                        var label = '<label class="form-selectgroup-item">' +
                            '<input type="radio" name="groupTableUser" value="' + item + '" class="form-selectgroup-input">' +
                            '<span class="form-selectgroup-label">' + item + '</span>' +
                            '</label>';
                        radioGroup.append(label); // Append the new radio button
                    });

                } else {
                    // Xử lý các mã trạng thái khác nếu cần
                    alert('Dữ liệu không hợp lệ. Mã trạng thái: ' + response.message);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Xử lý lỗi phản hồi HTTP
                alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }


    function loadDataTableUser(page, limit) {

        var valueGroupTableUser = $('input[name="groupTableUser"]:checked').val();

        var valueGroupStatusTable = $('input[name="groupStatusTable"]:checked').val();

        /*  alert(valueGroupTableUser +' - '+ valueGroupStatusTable);  */

        $.ajax({
            url: '${loadDataTableUser}',
            method: 'get',
            data: {
                page: page,
                limit: limit,
                tableUserGroup: valueGroupTableUser,
                tableUserStatus: valueGroupStatusTable
            },
            success: function (response, textStatus, jqXHR) {
                // Kiểm tra mã trạng thái HTTP
                if (jqXHR.status === 200) {
                    // Xóa dữ liệu cũ
                    $('#tableListTableUser').empty();

                    // Lấy danh sách dữ liệu
                    var totalPages = response.data.totalPage;
                    var currentPage = response.data.page;
                    var limit = response.data.limit;

                    $('#txtPage').html('Trang ' + currentPage + ' đến ' + totalPages + ' trên tổng ' + response.data.totalItem + ' bàn');

                    var listResult = response.data.listResult;


                    $.each(listResult, function (index, item) {


                        var tableHtml = '<div class="col-6 col-sm-3 mt-3">' +
                            '<label class="form-selectgroup-item">' +
                            '<input type="checkbox" name="icons" value="' + item.userTableID + '" class="form-selectgroup-input checkbox-table-' + item.userTableID + '"' +
                            (item.tableUserStatus === 1 ? ' checked' : '') + '>' +
                            '<span class="form-selectgroup-label">' +
                            '<svg xmlns="http://www.w3.org/2000/svg" class="icon me-1" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">' +
                            '<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>' +
                            '<path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"></path>' +
                            '</svg>' + item.tableUserName + '-' + item.tableUserGroup +
                            '</span>' +
                            '</label>' +
                            '</div>';

                        $('#tableListTableUser').append(tableHtml);


                    });
                    loadPaginationTableUser(totalPages, currentPage, limit);

                } else {
                    // Xử lý các mã trạng thái khác nếu cần
                    alert('Dữ liệu không hợp lệ. Mã trạng thái: ' + jqXHR.status);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Xử lý lỗi phản hồi HTTP
                alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }

    function updateStatusTable(id, value) {

        $.ajax({
            url: '${updateStatusTable}',
            method: 'get',
            data: {
                userTableID: id,
                tableUserStatus: value
            },
            success: function (response, textStatus, jqXHR) {
                // Kiểm tra mã trạng thái HTTP
                if (jqXHR.status === 200) {


                } else {
                    // Xử lý các mã trạng thái khác nếu cần
                    alert('Dữ liệu không hợp lệ. Mã trạng thái: ' + jqXHR.status);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Xử lý lỗi phản hồi HTTP
                alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }

    function loadCategory() {
        $.ajax({
            url: '${loadCategory}',
            method: 'get',
            success: function (response, textStatus, jqXHR) {
                // Kiểm tra mã trạng thái HTTP
                if (response.code === 200) {

                    var data = response.data;
                    var loadCategory = $('#loadCategory');

                    $.each(data, function (index, item) {

                        var loadData = '<label class="form-selectgroup-item">' +
                            '<input type="checkbox" name="category" value="' + item.categoryId + '" class="form-selectgroup-input">' +
                            '<span class="form-selectgroup-label">' + item.categoryName + '</span>' +
                            '</label>';
                        loadCategory.append(loadData);
                    });

                    $('input[name="category"]').prop('checked', true);

                } else {
                    // Xử lý các mã trạng thái khác nếu cần
                    alert('Dữ liệu không hợp lệ ở danh mục. Mã trạng thái: ' + response.message);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Xử lý lỗi phản hồi HTTP
                alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }

    function setItemOrder(item, tabId) {
        $('#' + tabId + ' .list-group.list-group-flush.list-group-hoverable').append(
            '<div id="' + item.tableOrderId + '" class="list-group-item">' +
            '<div class="row align-items-center">' +
            '<div class="col-auto">' +
            '<span class="badge bg-green"></span>' +
            '</div>' +
            '<div class="col-auto">' +
            '<span class="avatar" style="background-image: url(' + '${urlImgProduct}' + item.product.productImage + ')"></span>' +
            '</div>' +
            '<div class="col text-truncate">' +
            '<div class="text-reset d-block">' + item.product.productName + '</div>' +
            '<div class="d-block text-secondary text-truncate mt-n1">' + item.product.productPrice + 'đ</div>' +
            '</div>' +
            '<div class="col-auto">' +
            '<div class="wrapper">' +
            '<span class="minus" data-id="' + item.tableOrderId + '">-</span>' +
            '<span class="num">' + item.orderQuantity + '</span>' +
            '<span class="plus" data-id="' + item.tableOrderId + '">+</span>' +
            '</div>' +
            '</div>' +
            '<div class="col-auto">' +
            '<a href="#" class="list-group-item-actions delete-item-order" data-id ="' + item.tableOrderId + '">' +
            '<svg  xmlns="http://www.w3.org/2000/svg"  width="24"  height="24"  viewBox="0 0 24 24"  fill="currentColor"  class="icon icon-tabler icons-tabler-filled icon-tabler-xbox-x"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M12 2c5.523 0 10 4.477 10 10s-4.477 10 -10 10s-10 -4.477 -10 -10s4.477 -10 10 -10m3.6 5.2a1 1 0 0 0 -1.4 .2l-2.2 2.933l-2.2 -2.933a1 1 0 1 0 -1.6 1.2l2.55 3.4l-2.55 3.4a1 1 0 1 0 1.6 1.2l2.2 -2.933l2.2 2.933a1 1 0 0 0 1.6 -1.2l-2.55 -3.4l2.55 -3.4a1 1 0 0 0 -.2 -1.4" /></svg>' +
            '</a>' +
            '</div>' +
            '</div>' +
            '</div>'
        )
    }

    function appendContentTabActive(data, activeTabId) {

        $('#' + activeTabId + ' .list-group.list-group-flush.list-group-hoverable').empty();

        data.forEach((item, index) => {
            setItemOrder(item, activeTabId);
        });

        setupEventItemOrder();

    }

    function deleteItemOrder(tableOrderId) {
        $.ajax({
            type: 'DELETE',
            url: '${deleteItemOrder}',
            data: JSON.stringify({
                tableOrderId: tableOrderId,
            }),
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (response) {
                message_toastr("success", response.message)
                $("#" + tableOrderId).remove();
            },
            error: function (xhr, status, error) {
                console.error('Error: ' + error);
                alert('Error: ' + xhr.responseText);
            },
            complete: function (jqXHR, textStatus) {
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }


    function putQantityItemOrder(tableOrderId, currentVal, $num) {
        $.ajax({
            type: 'PUT', // Hoặc 'GET' tùy theo yêu cầu
            url: '${putQantityItemOrder}', // Đường dẫn đến server-side handler
            data: JSON.stringify({
                tableOrderId: tableOrderId,
                orderQuantity: currentVal,
            }), // Dữ liệu gửi đi, có thể là JSON hoặc URL-encoded
            contentType: 'application/json; charset=utf-8', // Loại dữ liệu gửi đi
            dataType: 'json', // Loại dữ liệu mà bạn mong đợi từ server (json, html, text, etc.)
            success: function (response) {
                // Xử lý phản hồi thành công từ server
                $num.text(currentVal);
                //alert('status: ' + response.message);
            },
            error: function (xhr, status, error) {
                // Xử lý lỗi nếu có
                console.error('Error: ' + error);
                alert('Error: ' + xhr.responseText);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }

    function initDataHeaderTableOrder() {

        $.ajax({
            url: '${initDataHeaderTableOrder}',
            type: 'GET',
            contentType: 'application/json',
            success: function (response) {


                response.data.forEach((item, index) => {
                    // Khởi Tạo Header TableOrder
                    const tabId = 'tab-' + item.userTableID;

                    $('#tabList').append(
                        '<li class="nav-item">' +
                        '<a href="#' + tabId + '" class="tab-open nav-link ' +
                        (index === 0 ? 'active' : '') +
                        '" data-bs-toggle="tab" aria-selected="' + (index === 0 ? 'true' : 'false') + '" role="tab" tabindex="-1">' +
                        item.tableUserName +
                        '<svg data-tab="' + tabId + '" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="-5 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-x close">' +
                        '<path stroke="none" d="M0 0h24v24H0z" fill="none" />' +
                        '<path d="M18 6l-12 12" />' +
                        '<path d="M6 6l12 12" />' +
                        '</svg>' +
                        '</a>' +
                        '</li>'
                    );

                    $('#tabContent').append(
                        '<div id="' + tabId + '" class="tab-room-table-content tab-pane ' +
                        (index === 0 ? 'active show' : '') + '">' +
                        '<div class="col-12">' +
                        '<div class="card">' +
                        '<div class="list-group list-group-flush list-group-hoverable">' +

                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>'
                    );


                });


            },
            error: function (xhr, status, error) {
                console.error('Error sending data:', status, error);
            }
        });
    }

    function initDataTableOrder() {

        $.ajax({
            url: '${initDataTableOrder}',
            type: 'GET',
            contentType: 'application/json',
            success: function (response) {

                //	  let uniqueTables = {};


                response.data.forEach((item, index) => {
                    const tableUser = item.tableUser;
                    const product = item.product;
                    const tabId = 'tab-' + tableUser.userTableID;
                    // Load Nội Dung Của Từng Table
                    setItemOrder(item, tabId);
                });


                setupEventItemOrder();

            },
            error: function (xhr, status, error) {
                console.error('Error sending data:', status, error);
            }
        });
    }

     function loadPaginationProduct(totalPages, currentPage, limit) {
        $('#pagination-product').twbsPagination('destroy');
        $(function () {
            window.pagObj = $('#pagination-product').twbsPagination({
                totalPages: totalPages,
                visiblePages: 3,
                startPage: currentPage,
                first: '<',
                prev: 'Trước',
                next: 'Tiếp',
                last: '>',
                onPageClick: function (event, page) {
                    if (currentIndexPageProduct == page) {
                    } else {
                        loadDataTableProduct(page, limit);
                        currentIndexPageProduct = page;
                    }

                }
            })
        });
    } 

    function loadDataTableProduct(page, limit) {

        var ids = $('input[name=category]:checked').map(function () {
            return $(this).val();
        }).get();

        var search = $("#searchProduct").val();


        $.ajax({
            url: '${loadProduct}',
            method: 'get',
            traditional: true,
            data: {
                page: page,
                limit: limit,
                idcategory: ids,
                search: search
            },
            success: function (response, textStatus, jqXHR) {
                // Kiểm tra mã trạng thái HTTP
                if (jqXHR.status === 200) {
                    // Xóa dữ liệu cũ
                    $('#loadProduct').empty();

                    // Lấy danh sách dữ liệu
                    var totalPages = response.data.totalPage;
                    var currentPage = response.data.page;
                    var limit = response.data.limit;

                    $('#txtProduct').html('Trang ' + currentPage + ' đến ' + totalPages + ' trên tổng ' + response.data.totalItem + ' sản phẩm');

                    var listResult = response.data.listResult;


                    $.each(listResult, function (index, item) {

                        var tableHtml = '<div class="col-6 col-sm-4">' +
                            '<div class="add-item card card-sm mt-3" ' +
                            '" data-id="' + item.productId +
                            '" data-name="' + item.productName +
                            '" data-price="' + item.productPrice +
                            '" data-img="' + '${urlImgProduct}' + item.productImage + '">' +
                            '<a href="#" class="d-block">' +
                            '<img src="' + '${urlImgProduct}' + item.productImage + '" class="card-img-top">' +
                            '</a>' +
                            '<div class="card-body">' +
                            '<div class="d-flex align-items-center">' +
                            '<span class="avatar me-3 rounded" style="background-image: url(' + '${urlImgCategory}' + item.category.categoryImage + ')"></span>' +
                            '<div>' +
                            '<div>' + item.productName + '</div>' +
                            '<div class="text-secondary">' + item.productPrice + 'đ</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>' +
                            '</div>';

                        $('#loadProduct').append(tableHtml);

                    });
                    loadPaginationProduct(totalPages, currentPage, limit);

                } else {
                    // Xử lý các mã trạng thái khác nếu cần
                    alert('Dữ liệu không hợp lệ ở sản phẩm . Mã trạng thái: ' + jqXHR.status);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Xử lý lỗi phản hồi HTTP
                alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }

    function deleteTableOrder(userTableID) {

        $.ajax({
            url: '${deleteTableUser}',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                userTableID: userTableID
            }),
            success: function (response, textStatus, jqXHR) {
                // Kiểm tra mã trạng thái HTTP
                console.log(response.message);
                if (response.code === 200) {


                } else {
                    // Xử lý các mã trạng thái khác nếu cần
                    alert('Dữ liệu không hợp lệ. Mã trạng thái: ' + response.message);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                // Xử lý lỗi phản hồi HTTP
                alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
            }
        });
    }


    function getActiveTabId() {
        const $activeTab = $('.tab-room-table-content.active.show');
        if ($activeTab.length === 0) {
            return null;
        }
        return $activeTab.attr('id');
    }


    function deleteTable(tabTitle, tabId, value) {
        const $tabToRemove = $('#tabList').find('a[href="#' + tabId + '"]').closest('li');
        const $contentToRemove = $('#tabContent').find('#' + tabId);


        const indexToRemove = $tabToRemove.index();
        $tabToRemove.remove();
        $contentToRemove.remove();

        updateStatusTable(value, 0);
        deleteTableOrder(value);

        $('input[name="icons"][value="' + value + '"]').prop('checked', false);


        const $activeTab = $('#tabList').find('.tab-open.active.show'); // Lọc các tab đang active
        if ($activeTab.length === 0) {
            const $firstTab = $('#tabList').find('.tab-open').first();
            $firstTab.tab('show');
        }
    }

    function confirmDeleteTable(tabTitle, tabId, value) {

        Swal.fire({
            title: "Hủy " + tabTitle + " ?",
            text: "Các sản phẩm được đặt ở bàn cũng sẽ xóa theo!",
            icon: "info",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Xác Nhận"
        }).then((result) => {
            if (result.isConfirmed) {
                deleteTable(tabTitle, tabId, value);
            }else{
            	 $('input[name="icons"][value="' + value + '"]').prop('checked', true);
            }
        });

    }

</script>

<script type="text/javascript">

    $(document).ready(function () {




        <c:if test="${not empty message}">
        message_toastr('${message.type}', '${message.message}');
        </c:if>

        loadGroupTableUser();
        loadDataTableUser(currentIndexPageTable, limitPageTable);

        loadCategory()
        initDataHeaderTableOrder();

        setTimeout(function () {
            initDataTableOrder();
        }, 500);


         setTimeout(function () {
            loadDataTableProduct(currentIndexPageProduct, limitPageProduct);
        }, 200); 
        
        $('#loadGroupTableUser').on('change', 'input[name="groupTableUser"]', function () {
            loadDataTableUser(1, limitPageTable);
        });

        $(document).on('change', 'input[name="groupStatusTable"]', function () {
            loadDataTableUser(1, limitPageTable);
        });

        // Khi checkbox "Tất Cả" được checked hoặc unchecked
        $('#selectAll').on('change', function () {
            var isChecked = $(this).is(':checked');
            $('input[name="category"]').prop('checked', isChecked);
            loadDataTableProduct(currentIndexPageProduct, limitPageProduct);
        });

        // Khi bất kỳ checkbox nào khác được checked hoặc unchecked
        $(document).on('change', 'input[name="category"]', function () {
            var allChecked = $('input[name="category"]').length === $('input[name="category"]:checked').length;
            $('#selectAll').prop('checked', allChecked);
            loadDataTableProduct(currentIndexPageProduct, limitPageProduct);

        });


        $("#searchProduct").change(function () {
            var query = $("#searchProduct").val();
            console.log("Search query: " + query);
            loadDataTableProduct(currentIndexPageProduct, limitPageProduct);
        });

        // Gán sự kiện click
        $("#loadProduct").on('click', '.add-item', function () {

            const name = $(this).data('name');
            const price = $(this).data('price');
            const img = $(this).data('img');
            const activeTabId = getActiveTabId();


            if (activeTabId) {
                const productId = $(this).data('id');
                const userTableID = activeTabId.split('-')[1];
                const orderQuantity = 1;

                $.ajax({
                    url: '${putOrderTable}',
                    type: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        orderQuantity: orderQuantity,
                        userTableID: userTableID,
                        productId: productId
                    }),
                    success: function (response) {
                        const data = response.data;
                        appendContentTabActive(data, activeTabId);
                    },
                    error: function (xhr, status, error) {
                        console.error('Error sending data:', status, error);
                    }
                });

            } else {
                console.log('Active tab ID is not found');
                message_toastr("info", "Vui Lòng Thêm Bàn Trước Khi Chọn Món !")
            }

        });


        $(document).on('change', 'input[name="icons"]', function () {


            const value = $(this).val();
            const tabId = 'tab-' + value;
            const tabTitle = 'Bàn ' + value;


            if ($(this).is(':checked')) {

                message_toastr("success", "Đã Tạo " + tabTitle + " Thành Công")

                $('#tabList').append(
                    '<li class="nav-item">' +
                    '<a href="#' + tabId + '" class="tab-open nav-link ' + ($('#tabList').find('.tab-open').length === 0 ? 'active' : '') + '" data-bs-toggle="tab" aria-selected="false" role="tab" tabindex="-1">' +
                    tabTitle +
                    '<svg data-tab="' + tabId + '" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="-5 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icons-tabler-outline icon-tabler-x close">' +
                    '<path stroke="none" d="M0 0h24v24H0z" fill="none" />' +
                    '<path d="M18 6l-12 12" />' +
                    '<path d="M6 6l12 12" />' +
                    '</svg>' +
                    '</a>' +
                    '</li>'
                );

                $('#tabContent').append(
                    '<div id="' + tabId + '" class="tab-room-table-content tab-pane ' + ($('#tabList').find('.tab-open').length - 1 === 0 ? 'active show' : '') + '">' +
                    '<div class="col-12">' +
                    '<div class="card">' +
                    '<div class="list-group list-group-flush list-group-hoverable">' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>'
                );

                updateStatusTable(value, 1);


            } else {
                confirmDeleteTable(tabTitle, tabId, value);
            }

        });

        // Xử lý sự kiện click cho các nút close
        $(document).on('click', '.close', function () {
            const tabId = $(this).data('tab');
            const value = tabId.split('-')[1];
            const tabTitle = 'Bàn ' + value;

            confirmDeleteTable(tabTitle, tabId, value);
        });

        var offcanvas = new bootstrap.Offcanvas($('#offcanvasEnd')[0]);

        $('#buttonCheckOut').on('click', function () {
            // Điều kiện cần kiểm tra
            var isConditionMet = false;

            const activeTabId = getActiveTabId();

            if (activeTabId != null) {
               
                const userTableID = activeTabId.split('-')[1];
                $.ajax({
                    url: '${checkOrderTable}',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                    	userTableID: userTableID,
                    }),
                    success: function (response) {
                        const data = response.data;
                        if(data == null){
                        	  message_toastr("info", "Bàn Chưa Chọn Món Nào !");
                        }else{
                        	 $('#loadBill').empty();
                        	  $.each(data.tableOrder, function (index, item) {

                        		  var tableRow = '<tr>' +
                        	        '<td class="text-center">' + (index + 1) + '</td>' +
                        	        '<td>' +
                        	        '<p class="strong mb-1">' + item.product.productName + '</p>' +
                        	        '</td>' +
                        	        '<td class="text-center">' + item.orderQuantity + '</td>' +
                        	        '<td class="text-end">' + item.product.productPrice + 'đ</td>' +
                        	        '<td class="text-end">' + (item.orderQuantity * item.product.productPrice) + 'đ</td>' +
                        	        '</tr>';

                        	    $('#loadBill').append(tableRow);

                              });
                        	// Thêm dòng tổng số lượng
                        	  $('#loadBill').append(
                        	      '<tr>' +
                        	      '<td colspan="4" class="strong text-end">Tổng Số Lượng</td>' +
                        	      '<td class="text-end">' + data.totalQuantity + '</td>' +
                        	      '</tr>'
                        	  );

                        	  // Thêm dòng tổng tiền
                        	  $('#loadBill').append(
                        	      '<tr>' +
                        	      '<td colspan="4" class="font-weight-bold strong text-uppercase text-end">Tổng Tiền</td>' +
                        	      '<td class="font-weight-bold text-end">' + data.totalProductPrice + 'đ </td>' +
                        	      '</tr>'
                        	  );
                        	  offcanvas.show();
                        	
                        }
                       
                    },
                    error: function (xhr, status, error) {
                        console.error('Error sending data:', status, error);
                    }
                });
                
                
                
            } else {
                message_toastr("info", "Hãy Chọn Bàn Trước Khi Tính Tiền !")
            }

        });


        $(document).on('click', '#paymentButton', function () {


            const activeTabId = getActiveTabId();

            if (activeTabId != null) {
                const userTableID = activeTabId.split('-')[1];
                const paymentID = $('input[name="payment"]:checked').val();
              
                $.ajax({
                    url: '${putOrder}',
                    method: 'PUT',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        userTableID: userTableID,
                        paymentID: paymentID
                    }),
                    success: function (response, textStatus, jqXHR) {
                        // Kiểm tra mã trạng thái HTTP
                        console.log(response.message);

                        offcanvas.hide();
                        if (response.code === 200) {

                            const value = activeTabId.split('-')[1];
                            const tabTitle = 'Bàn ' + value;
                            message_toastr("success", "Thanh Toán Hóa Đơn Thành Công ! ", "Lụm Lúa Lụm Lúa !")
                            deleteTable(tabTitle, activeTabId, value);


                        } else {
                            // Xử lý các mã trạng thái khác nếu cần
                            alert('Dữ liệu không hợp lệ. Mã trạng thái: ' + response.message);
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        // Xử lý lỗi phản hồi HTTP
                        alert('Có lỗi xảy ra khi lấy dữ liệu. Mã trạng thái: ' + jqXHR.status + ', Lỗi: ' + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        // Có thể thực hiện các hành động sau khi yêu cầu hoàn tất
                        console.log('Yêu cầu hoàn tất với mã trạng thái: ' + jqXHR.status);
                    }
                });
            } else {
                alert("Chọn bàn trước khi thanh toán !")
            }


        });
       
            var countdownTime = 1.5;
            var interval = 120;
            var totalTime = countdownTime * 1000;

            var intervalId = setInterval(function() {
                totalTime -= interval;
                var seconds = (totalTime / 1000).toFixed(2);

                $('#textLoading').text('Đang chuẩn bị dữ liệu... ' + seconds + 's');

                if (totalTime <= 0) {
                    clearInterval(intervalId);
                    $('#loading').attr('hidden', true);
                    $('#content').removeAttr('hidden');
                }
            }, interval);
     


    });


</script>


</div>
</body>

</html>