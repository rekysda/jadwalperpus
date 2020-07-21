<?php
include "includes/session.php";
include "includes/config.php";
include "includes/mysql.php";
include "includes/configsitus.php";
include 'includes/qrcode.php';
ob_start();
global $koneksi_db;
?>
<html>
<head>
<title>Login :: <?php echo $judul_situs?></title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<link rel="shortcut icon" href="favicon.ico">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<!-- js -->
<script src="login/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<link href="login/css/style.css" rel="stylesheet" type="text/css" media="all" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src='https://www.google.com/recaptcha/api.js'></script>
<link href='//fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,300italic,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
</head>
<body>
<?php
$qr = new qrcode();
$login  ='';
if (isset ($_POST['submit_login']) && @$_POST['loguser'] == 1){
$login .= aura_login ();

}

if (!cek_login ()){
$actual_link = "http://$_SERVER[HTTP_HOST]";
$kode ="$actual_link/jadwalujian/apk/jadwal_Ujian_6173937.apk";	
$qr->text($kode);	
?>
	<div class="main">
		<h1>Login </h1>
		<div class="w3_login">
			<div class="w3_login_module">
				<div class="module form-module">
				  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
					<div class="tooltip">About Us</div>
				  </div>
				  <div class="form">
					<h2>Login to your account</h2>
					<form action="#" method="post"name="login" id="loginForm">
					  <input type="text" name="username" placeholder="Username" required=" ">
					  <input type="password" name="password" placeholder="Password" required=" ">
					  <input type="hidden" value="1" name="loguser" />
					  <input type="submit" name="submit_login"  value="Login">
					</form>
				  </div><div align="center"><a href='./fullcalendar/'target='new'>LIHAT JADWAL</a>
</div>
				  <div class="cta"></div>
				</div>
			</div>
			<script>
				$('.toggle').click(function(){
				  // Switches the Icon
				  $(this).children('i').toggleClass('fa-pencil');
				  // Switches the forms  
				  $('.form').animate({
					height: "toggle",
					'padding-top': 'toggle',
					'padding-bottom': 'toggle',
					opacity: "toggle"
				  }, "slow");
				});
			</script>
		</div>
		<div class="agileits_copyright">
			<p>©<script language="JavaScript" type="text/javascript">
    now = new Date
    theYear = now.getYear()
    if (theYear < 1900)
    theYear = theYear + 1900
    document.write(theYear)
</script> Tim TIK SMAK Frateran Surabaya
		</div>
	</div>
	<?php

}else{
if (isset ($_SESSION['LevelAkses'])){
header("location:admin.php?pilih=main");
exit;
}
} //akhir cek login
echo $login;
?>
</body>
</html>