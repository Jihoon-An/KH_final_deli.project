<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
  <title>DELI</title>
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">

  <!--jQuery-->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

  <!-- daumPostcode -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- kakaoMap -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>

  <!-- bootstrap CSS only -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <!-- bootstrap JavaScript Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <!-- sweetalert -->
  <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- dataTables -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
  <script type="text/javascript" charset="utf8"
          src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

  <!-- font-awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

  <!-- StyleSheet-->
  <link rel="stylesheet" href="/resources/css/main/findAccount.css" type="text/css">
  <link rel="stylesheet" href="/resources/css/main/home.css" type="text/css">
  <link rel="stylesheet" href="/resources/css/main/memberMain.css" type="text/css">
  <link rel="stylesheet" href="/resources/css/main/memberSignUp.css" type="text/css">
  <link rel="stylesheet" href="/resources/css/main/ownerSignUp.css" type="text/css">
</head>
<body>




