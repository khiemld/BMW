<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Document</title>
    <link rel="shortcut icon" href="./store/icon/paper-plane.ico">
    <meta http-equiv="Content-Security-Policy" content="
    script-src 'self //code.jquery.com/jquery-3.2.1.slim.min.js //cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js //maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'
    stye-src './store/css/style.css //maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css //maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css';
    frame-ancestors 'none'">
    <link href="<c:url value = "/store/css/order.css" />" rel="stylesheet" type="text/css">
</head>
<body>
<div class="container">
    <div class="title">
        <h2>Đặt hàng</h2>
    </div>
    <div class="d-flex">
        <form action="processOrder" method="post">
            <label>
                <span class="fname">Họ tên<span class="required">*</span></span>
                <input type="text" name="name">
            </label>
            <label>
                <span class="fname">Địa chỉ<span class="required">*</span></span>
                <input type="text" name="address">
            </label>
            <label>
                <span class="fname">Số điện thoại<span class="required">*</span></span>
                <input type="text" name="phone">
            </label>

            <div class="payment">
                <h3>Phương thức thanh toán</h3>
                <c:forEach items="${listPay}" var="i">
                    <div>
                        <input type="radio" name="payment" value="${i.id}"> ${i.name}
                    </div>
                </c:forEach>
            </div>

            <div class="delivery">
                <h3>Phương thức giao hàng</h3>
                <c:forEach items="${listDelivery}" var="i">
                    <div>
                        <input type="radio" name="delivery" value="${i.id}"> ${i.name}
                    </div>
                </c:forEach>
            </div>

            <input type="hidden" name="uid" value="${sessionScope.acc.id}">
            <button type="submit">Place Order</button>
        </form>
        <div class="Yorder">
            <table>
                <tr>
                    <th colspan="2">Đơn hàng</th>
                </tr>
                <c:forEach items="${listItem}" var="i">
                    <tr>
                        <td>${i.product.name} x ${i.quantity}</td>
                        <td>
                            <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${i.price}"/> đ
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td>Subtotal</td>
                    <td>
                        <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${total}"/> đ
                    </td>
                </tr>
            </table><br>

        </div>
        </div><!-- Yorder -->
    </div>
</div>

</body>
</html>