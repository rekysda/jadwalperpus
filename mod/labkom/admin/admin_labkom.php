<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}

//$index_hal = 1;
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable({
    "iDisplayLength":50});
} );
</script>
js;
$script_include[] = $JS_SCRIPT;

$admin .='<section class="content-header">
          <h1>
            Master
            <small>Mengatur Labkom</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=labkom&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Master</li>
            <li class="active">Labkom</li>
          </ol>
        </section>';			
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=labkom&mod=yes" >
<i class="fa fa-flask">&nbsp;</i> Labkom <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';		

$temp = 'mod/labkom/temp/';
$thumb = 'mod/labkom/';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `labkom` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">labkom berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=labkom&mod=yes" />';    
	}
}
if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);
include "includes/hft_image.php";
$labkom 		= $_POST['labkom'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `labkom` SET `labkom`='$labkom' WHERE `id`='$id'" );
	
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=labkom&amp;mod=yes" />';	
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `labkom` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$labkom= $data['labkom'];
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Edit</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline" enctype ="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0"class="table table-striped table-hover">
	<tr>
		<td>labkom</td>
		<td>:</td>
		<td><input type="text" name="labkom" value="'.$data['labkom'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
}

if($_GET['aksi']==""){

if(isset($_POST['submit'])){
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);
$labkom 		= $_POST['labkom'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
	$hasil  = mysql_query( "INSERT INTO `labkom` (`labkom`) VALUES ('$labkom')" );
		if($hasil){
		$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
	//	unlink($uploaddir);
		unset($labkom);
		}
	}
}
$labkom     		= !isset($labkom) ? '' : $labkom;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline"enctype ="multipart/form-data">
<table class="table table-striped table-hover">
	<tr>
		<td>labkom</td>
		<td>:</td>
		<td><input type="text" name="labkom" value="'.$labkom.'" size="30" class="form-control" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Tambah" name="submit"class="btn btn-success" ></td>
	</tr>
</table>
</form>';	
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
}

/************************************/
$hasil = $koneksi_db->sql_query( "SELECT * FROM labkom order by labkom asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">labkom</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table id="example1" class="table table-striped table-hover">
<thead><tr>
<th>Nama</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$labkom=$data['labkom'];
$admin .='<tr>
<td>'.$labkom.'</td>
<td><a href="?pilih=labkom&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=labkom&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
</tr>';
$no++;
}
$admin .= '</tbody></table>';
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
/************************************/
}

$admin .='</section>';
echo $admin;

?>