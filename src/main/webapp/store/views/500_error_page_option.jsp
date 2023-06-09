<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
  <!--  All snippets are MIT license http://bootdey.com/license -->
  <title>500 error</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<c:url value="/store/js/jquery-1_10_2_min.js"/> "></script>
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="<c:url value="/store/js/bootstrap-3_3_6-min.js"/> "></script>
    <meta http-equiv="Content-Security-Policy" content="
    script-src 'self //code.jquery.com/jquery-3.2.1.slim.min.js //cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js //maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'
    stye-src './store/css/style.css //maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css //maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css';
    frame-ancestors 'none'">
  <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="page-404">
  <div class="outer">
    <div class="middle">
      <div class="inner">
        <!--BEGIN CONTENT-->
        <div class="inner-circle"><i class="fa fa-home"></i><span>500</span></div>
        <span class="inner-status">Oops! You're lost</span>
        <span class="inner-detail">
                    We can not find the page you're looking for.
                    <a href="<%=request.getContextPath()%>/home" class="btn btn-info mtl"><i class="fa fa-home"></i>&nbsp;
                        Return home
                    </a>
                </span>
      </div>
    </div>
  </div>
</div>

<style type="text/css">
  .clearfix:before,
  .clearfix:after {
    display: table;

    content: ' ';
  }
  .clearfix:after {
    clear: both;
  }
  body {
    background: #f0f0f0 !important;
  }
  .page-404 .outer {
    position: absolute;
    top: 0;

    display: table;

    width: 100%;
    height: 100%;
  }
  .page-404 .outer .middle {
    display: table-cell;

    vertical-align: middle;
  }
  .page-404 .outer .middle .inner {
    width: 300px;
    margin-right: auto;
    margin-left: auto;
  }
  .page-404 .outer .middle .inner .inner-circle {
    height: 300px;

    border-radius: 50%;
    background-color: #ffffff;
  }
  .page-404 .outer .middle .inner .inner-circle:hover i {
    color: #39bbdb!important;
    background-color: #f5f5f5;
    box-shadow: 0 0 0 15px #39bbdb;
  }
  .page-404 .outer .middle .inner .inner-circle:hover span {
    color: #39bbdb;
  }
  .page-404 .outer .middle .inner .inner-circle i {
    font-size: 5em;
    line-height: 1em;

    float: right;

    width: 1.6em;
    height: 1.6em;
    margin-top: -.7em;
    margin-right: -.5em;
    padding: 20px;

    -webkit-transition: all .4s;
    transition: all .4s;
    text-align: center;

    color: #f5f5f5!important;
    border-radius: 50%;
    background-color: #39bbdb;
    box-shadow: 0 0 0 15px #f0f0f0;
  }
  .page-404 .outer .middle .inner .inner-circle span {
    font-size: 11em;
    font-weight: 700;
    line-height: 1.2em;

    display: block;

    -webkit-transition: all .4s;
    transition: all .4s;
    text-align: center;

    color: #e0e0e0;
  }
  .page-404 .outer .middle .inner .inner-status {
    font-size: 20px;

    display: block;

    margin-top: 20px;
    margin-bottom: 5px;

    text-align: center;

    color: #39bbdb;
  }
  .page-404 .outer .middle .inner .inner-detail {
    line-height: 1.4em;

    display: block;

    margin-bottom: 10px;

    text-align: center;

    color: #999999;
  }

</style>

<script type="text/javascript">

</script>
</body>
</html>