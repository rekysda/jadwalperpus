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
            Mata Pelajaran
            <small>Mengatur Mata Pelajaran</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=mapel&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Master</li>
            <li class="active">Mata Pelajaran</li>
          </ol>
        </section>';			
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=mapel&mod=yes" >
<i class="fa fa-flask">&nbsp;</i> Mata Pelajaran <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';		

$temp = 'mod/mapel/temp/';
$thumb = 'mod/mapel/';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `mapel` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Mata Pelajaran berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=mapel&mod=yes" />';    
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
$mapel 		= $_POST['mapel'];
$kode 		= $_POST['kode'];
$guru 		= $_POST['guru'];
$icon = $_FILES['icon']['name'];
$icon_lama = text_filter($_POST['icon_lama']);
	$error 	= '';
	if (!$mapel)  	$error .= "Error: Silahkan Isi Nama mapel<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `mapel` SET `mapel`='$mapel',`kode`='$kode',`guru`='$guru'  WHERE `id`='$id'" );
	
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=mapel&amp;mod=yes" />';	
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `mapel` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$guru= $data['guru'];
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Edit Mata Pelajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline" enctype ="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0"class="table table-striped table-hover">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="kode" value="'.$data['kode'].'" size="25"class="form-control"></td>
	</tr>
<tr>
		<td>Guru</td>
		<td>:</td>
		<td>
<select name="guru" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM useraura where level='Guru' order by urutan asc");
$admin .= '<option value="">== Pilih Guru ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['user']==$guru)?"selected":'';
$admin .= '<option value="'.$datas['user'].'" '.$pilihan.'>'.$datas['urutan'].'.'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
	<tr>
		<td>Mapel</td>
		<td>:</td>
		<td><input type="text" name="mapel" value="'.$data['mapel'].'" size="25"class="form-control"></td>
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
$mapel 		= $_POST['mapel'];
$kode 		= $_POST['kode'];
$guru 		= $_POST['guru'];
$icon = $_FILES['icon']['name'];	
	$error 	= '';
	if (!$mapel)  	$error .= "Error: Silahkan Isi mapel<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
	$hasil  = mysql_query( "INSERT INTO `mapel` (`mapel`,`kode`,`guru`) VALUES ('$mapel','$kode','$guru')" );
		if($hasil){
		$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
	//	unlink($uploaddir);
		unset($mapel);
		unset($kode);
		}
	}
}
$mapel     		= !isset($mapel) ? '' : $mapel;
$kode     		= !isset($kode) ? '' : $kode;
$icon     		= !isset($icon) ? '' : $icon;
$guru     		= !isset($guru) ? '' : $guru;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah Mata Pelajaran-</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline"enctype ="multipart/form-data">
<table class="table table-striped table-hover">
	<tr>
		<td>Kode</td>
		<td>:</td>
		<td><input type="text" name="kode" value="'.$kode.'" size="30" class="form-control" required></td>
	</tr>
<tr>
		<td>Guru</td>
		<td>:</td>
		<td>
<select name="guru" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM useraura where level='Guru'");
$admin .= '<option value="">== Pilih Guru ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['user']==$guru)?"selected":'';
$admin .= '<option value="'.$datas['user'].'" '.$pilihan.'>'.$datas['urutan'].'.'.$datas['nama'].'('.$datas['user'].')</option>';
}
$admin .='</select></td>
	</tr>
	<tr>
		<td>Mapel</td>
		<td>:</td>
		<td><input type="text" name="mapel" value="'.$mapel.'" size="30" class="form-control" required></td>
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
$hasil = $koneksi_db->sql_query( "SELECT m.id,m.mapel,m.kode,m.guru FROM mapel m,useraura g where g.user = m.guru order by g.urutan asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Mata Pelajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table id="example1" class="table table-striped table-bordered dt-responsive nowrap">
<thead><tr>
<th>No</th>
<th>Kode</th>
<th>Guru</th>
<th>Mata Pelajaran</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$mapel=$data['mapel'];
$kode=$data['kode'];
$icon=$data['icon'];
$guru=$data['guru'];
if(!$icon){
$icon='default.jpg';
}
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.$kode.'</td>
<td>'.getnamaguru($guru).'</td>
<td>'.$mapel.'</td>
<td><a href="?pilih=mapel&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=mapel&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
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