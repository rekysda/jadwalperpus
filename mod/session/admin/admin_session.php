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
            Session
            <small>Mengatur Session</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=session&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Master</li>
            <li class="active">Session</li>
          </ol>
        </section>';
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=session&mod=yes" >
<i class="fa fa-users">&nbsp;</i> Session <span class="badge bg-green"></span></a>
<a class="btn btn-default btn-flat" href="./admin.php?pilih=session&mod=yes&aksi=sessionsiswa" >
<i class="fa  fa-clock-o">&nbsp;</i> Session Siswa<span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';
if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']); 	
	$hasil = $koneksi_db->sql_query("DELETE FROM `session` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="alert alert-success fade in">Session berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=session&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$session 		= $_POST['session'];
	$error 	= '';
	if (!$session)  	$error .= "Error: Silahkan Isi Nama session<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT session FROM session WHERE session='$session' and id<>'$id'")) > 0) $error .= "Error: session ".$session." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$tengah .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `session` SET `session`='$session' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=session&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `session` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Session</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline">
<table border="0" cellspacing="0" cellpadding="0"class="table table-striped table-hover">
	<tr>
		<td>Session</td>
		<td>:</td>
		<td><input type="text" name="session" value="'.$data['session'].'" size="25"class="form-control" required></td>
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
	$session 		= $_POST['session'];
	$error 	= '';
	if (!$session)  	$error .= "Error: Silahkan Isi session<br />";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT session FROM session WHERE session='$session'")) > 0) $error .= "Error: Session ".$session." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="alert alert-block alert-danger fade in">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `session` (`session`) VALUES ('$session')" );
		if($hasil){
			$admin .= '<div class="alert alert-success fade in"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="alert alert-block alert-danger fade in"><b> Gagal di Buat.</b></div>';
		}
		unset($session);
	}

}

$session     		= !isset($session) ? '' : $session;
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Session</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline">
<table class="table  table-hover">
	<tr>
		<td>Session</td>
		<td>:</td>
		<td><input type="text" name="session" value="'.$session.'" size="30" class="form-control"required></td>
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

if (in_array($_GET['aksi'],array('','edit','del'))){
/************************************/
$hasil = $koneksi_db->sql_query( "SELECT * FROM session order by session asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Session</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table id="example1" class="table  table-hover">
<thead><tr>
<th>No</th>
<th>Session</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$session=$data['session'];
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.$session.'</td>
<td><a href="?pilih=session&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=session&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
</tr>';
$no++;
}
$admin .= '</tbody></table>';
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if (in_array($_GET['aksi'],array('sessionsiswa'))){
	if(isset($_POST['submit'])){
	$session 		= $_POST['session'];
	$kelas 		= $_POST['kelas'];
  
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
 $hasil = $koneksi_db->sql_query("SELECT * FROM kelas_isi where kelas='$kelas'");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$username=$datas['siswa'];
$sql2 ="INSERT INTO `session_isi`VALUES ('','$session','$kelas','$username')";
$hasil2 = mysql_query( $sql2 );
if($hasil2){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
	
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Session Siswa Kelas ".getkelas($kelas).", Session <b>".getsession($session)."</b> Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";


}
	if(isset($_POST['hapussiswasession'])){
	$kelas 		= $_POST['kelas'];
	$hasil = $koneksi_db->sql_query("DELETE FROM `session_isi` WHERE `kelas`='$kelas'");    
	if($hasil){    
		$admin.='<div class="alert alert-success fade in">Session Siswa Kelas  berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=session&mod=yes&aksi=sessionsiswa" />';    
	}
	}

/************************************/
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Import Session Siswa</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
  <tr>
		<td>Session</td>
		<td>:</td>
		<td>
<select name="session" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM session ORDER BY session");
$admin .= '<option value="">== Pilih Session ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['session'].'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
		<td>Kelas</td>
		<td>:</td>
		<td>
<select name="kelas" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM kelas where tahunajaran='$tahunajarandefault' ORDER BY kelas");
$admin .= '<option value="">== Pilih Kelas ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$sessionkelas=getsessionkelas($datas['id']);
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['kelas'].' '.$sessionkelas.'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="Import Siswa" class="btn btn-success"></td>
 </tr>
 </table>
 </form>';
  $admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
			  
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Hapus Session Siswa</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
			  
 $admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
		<td>Kelas</td>
		<td>:</td>
		<td>
<select name="kelas" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM kelas where tahunajaran='$tahunajarandefault' ORDER BY kelas");
$admin .= '<option value="">== Pilih Kelas ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$sessionkelas=getsessionkelas($datas['id']);
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['kelas'].' '.$sessionkelas.'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="hapussiswasession" type="submit" value="Hapus" class="btn btn-danger"onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Seluruh Session Kelas Ini ?\')"></td>
 </tr>
 </table>
 </form>';
 
 $admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
			  
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar Session Siswa</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin.='
<table id="example1" class="table table-striped table-bordered" cellspacing="0">
<thead>
<tr>
<th>Session</th>
<th>Username</th>
<th>Nama</th>
<th>Kelas</th>
</tr>
</thead>';
$admin.='<tbody>';
$sql = "SELECT * FROM `session_isi` order by session asc";
$query = mysql_query( $sql );
while ($data = mysql_fetch_array($query)) { 
$id = $data['id'];
$session=$data['session'];
$siswa=$data['siswa'];
$absen=$data['absen'];
$admin.='<tr>
<td>'.getsession($session).'</td>
<td>'.$siswa.'</td>
<td>'.getnamasiswa($siswa).'</td>
<td>'.getkelasisi($siswa).'</td>';
$admin.='
</tr>';
}
$admin .= '</tbody></table>';
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
}
$admin .='</section>';
}

echo $admin;

?>