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
            <small>Mengatur Jam</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=jam&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Master</li>
            <li class="active">Jam</li>
          </ol>
        </section>';			
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=jam&mod=yes" >
<i class="fa fa-clock-o">&nbsp;</i> Jam <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';		

$temp = 'mod/jam/temp/';
$thumb = 'mod/jam/';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `jam` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">jam berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=jam&mod=yes" />';    
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
$kode 		= $_POST['kode'];
$mulai 		= $_POST['mulai'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `jam` SET `kode`='$kode', `mulai`='$mulai'  WHERE `id`='$id'" );
	
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=jam&amp;mod=yes" />';	
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `jam` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$guru= $data['guru'];
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Edit jam</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline" enctype ="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0"class="table table-striped table-hover">
	<tr>
		<td>Jam Ke</td>
		<td>:</td>
		<td><input type="number" name="kode" value="'.$data['kode'].'" size="25"class="form-control"></td>
	</tr>
	<tr>
	<td>Mulai</td>
	<td>:</td>
	<td><input type="text" name="mulai" value="'.$data['mulai'].'" size="25"class="form-control"></td>
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
$kode 		= $_POST['kode'];
$mulai 		= $_POST['mulai'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
	$hasil  = mysql_query( "INSERT INTO `jam` (`kode`,`mulai`) VALUES ('$kode','$mulai')" );
		if($hasil){
		$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
	//	unlink($uploaddir);
		unset($mulai);
		unset($selesai);
		unset($kode);
		}
	}
}
$kode     		= !isset($kode) ? '' : $kode;
$mulai     		= !isset($mulai) ? '' : $mulai;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah Jam</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline"enctype ="multipart/form-data">
<table class="table table-striped table-hover">
	<tr>
		<td>Jam Ke</td>
		<td>:</td>
		<td><input type="number" name="kode" value="'.$kode.'" size="30" class="form-control" required></td>
	</tr>
	<tr>
		<td>Mulai</td>
		<td>:</td>
		<td><input type="text" name="mulai" value="'.$mulai.'" size="30" class="form-control" required></td>
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
$hasil = $koneksi_db->sql_query( "SELECT * FROM jam order by kode asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Jam</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table id="example1" class="table table-striped table-hover">
<thead><tr>
<th>Jam Ke</th>
<th>Mulai</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$mulai=$data['mulai'];
$selesai=$data['selesai'];
$kode=$data['kode'];
$admin .='<tr>
<td>'.$kode.'</td>
<td>'.$mulai.'</td>
<td><a href="?pilih=jam&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=jam&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
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