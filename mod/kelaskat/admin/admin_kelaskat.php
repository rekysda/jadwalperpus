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
            Kategori Kelas
            <small>Mengatur Kategori Kelas</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=kelaskat&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Master</li>
            <li class="active">Kategori Kelas</li>
          </ol>
        </section>';
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=kelas&mod=yes" >
<i class="fa fa-users">&nbsp;</i> Kelas <span class="badge bg-green"></span></a>
<a class="btn btn-default btn-flat" href="./admin.php?pilih=kelaskat&mod=yes" >
<i class="fa fa-users">&nbsp;</i> Kategori Kelas <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']); 
	$hasil = $koneksi_db->sql_query("DELETE FROM `kelaskat` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="alert alert-success fade in">Kat Kelas berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=kelaskat&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$kelaskat 		= $_POST['kelaskat'];

	$error 	= '';
	if (!$kelaskat)  	$error .= "Error: Silahkan Isi Kat Kelas<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT kelaskat FROM kelaskat WHERE kelaskat='$kelaskat' and id<>'$id'")) > 0) $error .= "Error: Kat Kelas ".$kelaskat." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `kelaskat` SET `kelaskat`='$kelaskat' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=kelaskat&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `kelaskat` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Kat Kelas</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline">
<table border="0" cellspacing="0" cellpadding="0"class="table table-striped table-hover">
	<tr>
		<td>Kat Kelas</td>
		<td>:</td>
		<td><input type="text" name="kelaskat" value="'.$data['kelaskat'].'" size="25"class="form-control"></td>
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
	$kelaskat 		= $_POST['kelaskat'];
	$error 	= '';
	if (!$kelaskat)  	$error .= "Error: Silahkan Isi Kat Kelas<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT kelaskat FROM kelaskat WHERE kelaskat='$kelaskat'")) > 0) $error .= "Error: Kat Kelas ".$kelaskat." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `kelaskat` (`kelaskat`) VALUES ('$kelaskat')" );
		if($hasil){
			$admin .= '<div class="alert alert-success fade in"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b> Gagal di Buat.</b></div>';
		}
		unset($kelas);
	}

}
$kelaskat     		= !isset($kelaskat) ? '' : $kelaskat;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Kat Kelas</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline">
<table class="table  table-hover">
	<tr>
		<td>Kat Kelas</td>
		<td>:</td>
		<td><input type="text" name="kelaskat" value="'.$kelaskat.'" size="30" class="form-control"></td>
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
$hasil = $koneksi_db->sql_query( "SELECT * FROM kelaskat order by kelaskat asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Kat Kelas</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table id="example1" class="table  table-hover">
<thead><tr>
<th>No</th>
<th>Kat Kelas </th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$kelaskat=$data['kelaskat'];
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.$kelaskat.'</td>
<td><a href="?pilih=kelaskat&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=kelaskat&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
</tr>';
$no++;
}
$admin .= '</tbody></table>';
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}
$admin .='</section>';
echo $admin;

?>