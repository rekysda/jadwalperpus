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
            Tahun Ajaran
            <small>Mengatur Tahun Ajaran</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=tahunajaran&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Master</li>
            <li class="active">Tahun Ajaran</li>
          </ol>
        </section>';
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=tahunajaran&mod=yes" >
<i class="fa fa-users">&nbsp;</i> Tahun Ajaran <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']); 	
	$hasil = $koneksi_db->sql_query("DELETE FROM `tahunajaran` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="alert alert-success fade in">Tahun Ajaran berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahunajaran&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$tahunajaran 		= $_POST['tahunajaran'];
	$keterangan 		= $_POST['keterangan'];
	$error 	= '';
	if (!$tahunajaran)  	$error .= "Error: Silahkan Isi Tahun Ajaran<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT tahunajaran FROM tahunajaran WHERE tahunajaran='$tahunajaran' and id<>'$id'")) > 0) $error .= "Error: tahunajaran ".$tahunajaran." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `tahunajaran` SET `tahunajaran`='$tahunajaran',`keterangan`='$keterangan' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="alert alert-block alert-success fade in"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahunajaran&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `tahunajaran` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$tahunajaran 		= $data['tahunajaran'];
$keterangan 		= $data['keterangan'];
$tahunajaran     		= !isset($tahunajaran) ? '' : $tahunajaran;
$keterangan     		= !isset($keterangan) ? '' : $keterangan;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tahun Ajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline">
<table class="table  table-hover">
	<tr>
		<td>Tahun Ajaran</td>
		<td>:</td>
		<td><input type="text" name="tahunajaran" value="'.$tahunajaran.'" size="30" class="form-control"required></td>
	</tr>
		<tr>
		<td>Keterangan</td>
		<td>:</td>
		<td><input type="text" name="keterangan" value="'.$keterangan.'" size="30" class="form-control"required></td>
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

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
	$tahunajaran 		= $_POST['tahunajaran'];
	$keterangan 		= $_POST['keterangan'];
	$error 	= '';
	if (!$tahunajaran)  	$error .= "Error: Silahkan Isi tahunajaran<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT tahunajaran FROM tahunajaran WHERE tahunajaran='$tahunajaran'")) > 0) $error .= "Error: tahunajaran ".$tahunajaran." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `tahunajaran` VALUES ('','$tahunajaran','$keterangan','disable')" );
		if($hasil){
			$admin .= '<div class="alert alert-block alert-success fade in"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b> Gagal di Buat.</b></div>';
		}
		unset($tahunajaran);
		unset($keterangan);
	}

}
$tahunajaran     		= !isset($tahunajaran) ? '' : $tahunajaran;
$keterangan     		= !isset($keterangan) ? '' : $keterangan;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tahun Ajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline">
<table class="table  table-hover">
	<tr>
		<td>Tahun Ajaran</td>
		<td>:</td>
		<td><input type="text" name="tahunajaran" value="'.$tahunajaran.'" size="30" class="form-control"required></td>
	</tr>
		<tr>
		<td>Keterangan</td>
		<td>:</td>
		<td><input type="text" name="keterangan" value="'.$keterangan.'" size="30" class="form-control"required></td>
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

if($_GET['aksi'] == 'default'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$status 		= $_POST['status'];
	$error 	= '';
	if ($error){
		$tengah .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `tahunajaran` SET `status`='$status' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="alert alert-block alert-success fade in"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=tahunajaran&amp;mod=yes&aksi=default&id='.$id.'" />';	
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `tahunajaran` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$id 		= $data['id'];
$tahunajaran 		= $data['tahunajaran'];
$status 		= $data['status'];
$tahunajaran     		= !isset($tahunajaran) ? '' : $tahunajaran;
$keterangan     		= !isset($keterangan) ? '' : $keterangan;
$sel2 = '<select name="status"class="form-control">';
$arr2 = array ('aktif','disable');
foreach ($arr2 as $kk=>$vv){
	if ($status == $vv){
	$sel2 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
	}
}

$sel2 .= '</select>';  
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tahun Ajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline">
<table class="table  table-hover">
	<tr>
		<td>Tahun Ajaran</td>
		<td>:</td>
		<td><input type="text" name="tahunajaran" value="'.$tahunajaran.'" size="30" class="form-control"readonly></td>
	</tr>
		<tr>
		<td>Status</td>
		<td>:</td>
		<td>'.$sel2.'</td>
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
$hasil = $koneksi_db->sql_query( "SELECT * FROM tahunajaran order by tahunajaran desc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tahun Ajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table id="example1" class="table  table-hover">
<thead><tr>
<th>No</th>
<th>Tahun Ajaran</th>
<th>Keterangan</th>
<th>Status</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$tahunajaran=$data['tahunajaran'];
$keterangan=$data['keterangan'];
$status=$data['status'];
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.$tahunajaran.'</td>
<td>'.$keterangan.'</td>
<td>'.$status.'</td>
<td><a href="?pilih=tahunajaran&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=tahunajaran&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a>&nbsp;<a href="?pilih=tahunajaran&amp;mod=yes&amp;aksi=default&amp;id='.$data['id'].'"><span class="btn btn-primary">Status</span></a></td>
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