<?php
if (!defined('AURACMS_admin')) {
    Header("Location: ../index.php");
    exit;
}
include "includes/excel_reader2.php";
$admin='';
if (!cek_login()){
    header("location: index.php");
    exit;
} else{
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable({
    "iDisplayLength":50});
} );
</script>
js;
$script_include[] = $JS_SCRIPT;
	
//$index_hal=1;	
$admin .='<section class="content-header">
          <h1>
            Users
            <small>Mengatur Users / Pengguna</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=user&mod=yes"><i class="fa fa-plug"></i>Home</a></li>
			<li>Settings</li>
            <li class="active">User</li>
          </ol>
        </section>';
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=user&mod=yes" >
<i class="fa fa-users">&nbsp;</i> User <span class="badge bg-green"></span></a>
<a class="btn btn-default btn-flat" href="./admin.php?pilih=user&mod=yes&aksi=add" >
<i class="fa fa-plus">&nbsp;</i> Tambah</span></a>
<a class="btn btn-default btn-flat" href="./admin.php?pilih=user&mod=yes&aksi=resetallpassword" >
<i class="fa fa-unlock">&nbsp;</i> Reset All Password</span></a>
<a class="btn btn-default btn-flat" href="./admin.php?pilih=user&mod=yes&aksi=import" >
<i class="fa fa-users">&nbsp;</i> Import Guru</span></a>
<a class="btn btn-default btn-flat" href="./cetakkartuguru.php"target="new" >
<i class="fa fa-credit-card">&nbsp;</i>Cetak Kartu Guru <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';
if ($_GET['aksi'] == 'hapus' && is_numeric($_GET['id'])){
	$id = int_filter ($_GET['id']);
	$user = getuserguru($id);
$hasil = $koneksi_db->sql_query( "SELECT * FROM kursus_setting  where guru='$user'" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$idkursus     = $data['id'];  
$hapus = $koneksi_db->sql_query("DELETE FROM `soal` WHERE `ujian`='$idkursus'"); 
}
$hapus = mysql_query ("DELETE FROM `ujian` WHERE `guru`='$user'");	
$hapus = mysql_query ("DELETE FROM `kursus_setting` WHERE `guru`='$user'");	
$hapus = mysql_query ("DELETE FROM `useraura` WHERE `UserId`='$id' AND `user`!='admin'");	
if ($hapus){
$admin.='<div class="callout callout-success">Data Berhasil Dihapus Dengan ID = '.$id.'</div>';	
}else {
$admin.='<div class="callout callout-danger">Data Gagal dihapus Dengan ID = '.$id.'</div>';	
}	
}

if (isset ($_POST['edit_users']) && is_numeric($_GET['id'])){
	$id = int_filter ($_GET['id']);
	$level = $_POST['level'];
	$tipe = $_POST['tipe'];
	$nama = $_POST['nama'];
	$email = $_POST['email'];
if ($error) {
$admin.='<div class="callout callout-danger">'.$error.'</div>';
} else {
$up = mysql_query ("UPDATE `useraura` SET `level`='$level',`tipe`='$tipe',`nama`='$nama',`email`='$email' WHERE `UserId`='$id'");	
$admin.='<div class="callout callout-success">Data Berhasil Diupdate Dengan ID = '.$id.'</div>';	
}
}

if ($_GET['aksi'] == 'add'){
	
	
if (isset($_POST['add_users'])){
$urutan = cleantext($_POST['urutan']);	
$user = cleantext($_POST['user']);	
$level = cleantext($_POST['level']);	
$tipe = cleantext($_POST['tipe']);
$password = cleantext($_POST['password']);
$nama = cleantext($_POST['nama']);
$email = cleantext($_POST['email']);
if (empty($_POST['nama']))  $error .= "Error: Formulir nama belum diisi , silahkan ulangi.<br />";
if (empty($_POST['user']))  $error .= "Error: Formulir user belum diisi , silahkan ulangi.<br />";
if (empty($_POST['password']))  $error .= "Error: Formulir Password belum diisi , silahkan ulangi.<br />";
if (!$user || preg_match("/[^a-zA-Z0-9_-]/", $user)) $error .= "Error: Karakter Username tidak diizinkan kecuali a-z,A-Z,0-9,-, dan _<br />";
if (strlen($user) > 50) $error .= "Username Terlalu Panjang Maksimal 50 Karakter<br />";
if (strrpos($user, " ") > 0) $error .= "Username Tidak Boleh Menggunakan Spasi";
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT user FROM useraura WHERE user='$user'")) > 0) $error .= "Error: Username ".$user." sudah terdaftar , silahkan ulangi.<br />";
if ($error){
        $admin.='<div class="callout callout-danger">'.$error.'</div>';
}else{
$query = mysql_query ("INSERT INTO `useraura` (`user`,`password`,`level`,`tipe`,`nama`,`password2`,`urutan`,`email`) VALUES ('$user',md5('$password'),'$level','$tipe','$nama','$password','$urutan','$email')");	
$admin .= '<div class="callout callout-success">Data Berhasil Di add</div>';
}
	
}	
	
	

$ss = mysql_query ("SHOW FIELDS FROM useraura");
while ($as = mysql_fetch_array ($ss)){
	 $arrs = $as['Type'];
	
	if (substr($arrs,0,4) == 'enum' && $as['Field'] == 'level') break;
}

if (isset ($_GET['offset']) && isset ($_GET['pg']) && isset ($_GET['stg'])) {
$qss = "&pg=$pg&stg=$stg&offset=$offset";
}	
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';

$admin.= "<form method='post' action='#'>
<table  class='table table-condensed'>
  <tr>
    <td width='30%' valign='top'>Urutan </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='urutan' size='20' class='form-control'required/></td>
  </tr> 
  <tr>
    <td width='30%' valign='top'>User </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='user' size='20' class='form-control'required/></td>
  </tr> 
  <tr>
    <td width='30%' valign='top'>Password </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='password' class='form-control'size='20' required/></td>
  </tr>
  <tr>
    <td width='30%' valign='top'>Nama Lengkap </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='nama' size='20' class='form-control'required/></td>
  </tr>
  <tr>
    <td width='30%' valign='top'>Email </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='email' size='20' class='form-control'/></td>
  </tr>   ";
  
  
$sel = '<select name="level" class="form-control">';
//$arrs = ''.substr ($arrs,4);
//$arr = eval( '$arr5 = array'.$arrs.';' );
$arr5 = array ('Guru','Administrator');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}

$sel .= '</select>';  
  
$sel2 = '<select name="tipe"class="form-control">';
$arr2 = array ('aktif','pasif');
foreach ($arr2 as $kk=>$vv){
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
}
$sel2 .= '</select>'; 
/**********************************************************/   
$admin .= "<tr>
    <td width='30%' valign='top'>Level </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'>$sel</td>
  </tr>";

$admin .= "<tr>
    <td width='30%' valign='top'>Status</td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'>$sel2</td>
  </tr>";  
 
$admin .= "<tr><td width='30%'>&nbsp;</td>
    <td width='1%'>&nbsp;</td>
    <td width='69%'><br /><input type='submit' value='Simpan' name='add_users' class='btn btn-success'/></td>
  </tr>
</table></form>";	
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';	
	
	
}

if ($_GET['aksi'] == 'edit'){
global $qss;
$id = int_filter($_GET['id']);
$s = mysql_query ("SELECT * FROM `useraura` WHERE `UserId`='$id'");	
$data = mysql_fetch_array($s);
$user = $data['user'];	
$level = $data['level'];	
$tipe = $data['tipe'];
$nama = $data['nama'];
$email = $data['email'];
$ss = mysql_query ("SHOW FIELDS FROM useraura");
while ($as = mysql_fetch_array ($ss)){
	 $arrs = $as['Type'];
if (substr($arrs,0,4) == 'enum' && $as['Field'] == 'level') break;
}

if (isset ($_GET['offset']) && isset ($_GET['pg']) && isset ($_GET['stg'])) {
$qss = "&amp;pg=$pg&amp;stg=$stg&amp;offset=$offset";
}	
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Edit</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= "<form method='post' action='admin.php?pilih=user&amp;mod=yes&amp;id=$id$qss'>
<table  class='table table-condensed'>
  <tr>
    <td width='30%' valign='top'>User </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='user' size='20' class='form-control'value='$user' disabled='disabled' /></td>
  </tr>";
$admin .= "
  <tr>
    <td width='30%' valign='top'>Nama Lengkap </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='nama' size='20' class='form-control'value='$nama' /></td>
  </tr>";  
$admin .= "
  <tr>
    <td width='30%' valign='top'>Email </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'><input type='text' name='email' size='20' class='form-control'value='$email' /></td>
  </tr>";   
$sel = '<select name="level"class="form-control">';
$arr5 = array ('Administrator','Guru');
foreach ($arr5 as $k=>$v){
	if ($level == $v){
	$sel .= '<option value="'.$v.'" selected="selected">'.$v.'</option>';
	}else {
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	}
}
$sel .= '</select>';  
  
$sel2 = '<select name="tipe"class="form-control">';
$arr2 = array ('aktif','pasif');
foreach ($arr2 as $kk=>$vv){
	if ($tipe == $vv){
	$sel2 .= '<option value="'.$vv.'" selected="selected">'.$vv.'</option>';
	}else {
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	
	}
}

$sel2 .= '</select>';    
/**********************************************************/  
  
$admin .= "<tr>
    <td width='30%' valign='top'>Level </td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'>$sel</td>
  </tr>";

$admin .= "<tr>
    <td width='30%' valign='top'>Status</td>
    <td width='1%' valign='top'>:</td>
    <td width='69%' valign='top'>$sel2</td>
  </tr>";  


$admin .= "<tr><td width='30%'>&nbsp;</td>
    <td width='1%'>&nbsp;</td>
    <td width='69%'><br /><input type='submit' value='Simpan' name='edit_users' class='btn btn-success'/></td>
  </tr>
</table></form>";	
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if (!in_array($_GET['aksi'],array('add','edit','hint','addhint','editpassword','photo','resetallpassword','import','listkelas','tambahkelas','listguru','tambahguru'))){

$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level <>'Siswa' and user<>'superadmin'" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar Users</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .="<form method='post' action=''>";
$admin.='
<table id="example1" class="table table-striped table-bordered dt-responsive nowrap">
<thead><tr>
    <td align="center"><b>No</b></td>
    <td align="center"><b>User</b></td>
    <td align="center"><b>Nama</b></td>
    <td align="center"><b>Email</b></td>
    <td align="center"><b>Level</b></td>
    <td align="center" width="30%"><b>Actions</b></td>
  </tr></thead><tbody>';

while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$photo = $data['photo'];
if($photo){
$linkphoto = '<a href="?pilih=user&amp;mod=yes&amp;aksi=photo&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-success">Photo</span></a>';
}else{
$linkphoto = '<a href="?pilih=user&amp;mod=yes&amp;aksi=photo&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-default">Photo</span></a>';
}
	$admin.='
  <tr>
      <td>'.$data['urutan'].'</td>  
    <td>'.$data['user'].'</td>
    <td>'.$data['nama'].'</td>
    <td>'.$data['email'].'</td>	
    <td>'.$data['level'].'</td>
    <td>
     <a href="?pilih=user&amp;mod=yes&amp;aksi=hapus&amp;id='.$data['UserId'].$qss.'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus User Ini ?\')"><span class="btn btn-danger">Hapus</span></a>
	 <a href="?pilih=user&amp;mod=yes&amp;aksi=edit&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-warning">Edit</span></a>
	 <a href="?pilih=user&amp;mod=yes&amp;aksi=editpassword&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-primary">Password</span></a>
	 '.$linkphoto.'
	 </td>
  </tr>';  
}
$admin .= '<tbody></table>';
$admin .="</form>";
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if($_GET['aksi'] == 'editpassword'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$password 		= $_POST['password'];

	$error 	= '';
	if (!$password)  	$error .= "Error: Silahkan Isi password<br />";
	if ($error){
		$admin .= '<div class="callout callout-danger">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `useraura` SET `password`=md5('$password'),`password2`='$password' WHERE `UserId`='$id'" );
		if($hasil){
			$admin .= '<div class="callout callout-success"><b>Password Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=user&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="callout callout-danger"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `useraura` WHERE `UserId`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Edit password</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline">
<table class="table table-condensed">
	<tr>
		<td>Username</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['user'].'" disabled class="form-control"></td>
	</tr>
	<tr>
		<td>Nama</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" disabled class="form-control"></td>
	</tr>
	<tr>
		<td>Password</td>
		<td>:</td>
		<td><input type="password" name="password" class="form-control"></td>
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

if($_GET['aksi'] == 'photo'){
$id = int_filter ($_GET['id']);
if (isset($_POST['submit'])){
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);
include "includes/hft_image.php";

$username  		= $_POST['username'];
$namafile_name 	= $_FILES['gambar']['name'];
$extension = end(explode('.', $_FILES['gambar']['name']));
$error 	= '';
if ($extension!='jpg')  	$error .= "Error: Format ekstensi jpg<br />";
if ($error){
$admin.='<div class="callout callout-danger">'.$error.'</div>';

}else{

if (!empty ($namafile_name)){

    $files = $_FILES['gambar']['name'];
    $tmp_files = $_FILES['gambar']['tmp_name'];
    $tempnews 	= 'mod/user/temp/';
    $namagambar = $username .'.jpg';
    $uploaddir = $tempnews . $namagambar; 
    $uploads = move_uploaded_file($tmp_files, $uploaddir);
	if (file_exists($uploaddir)){
		@chmod($uploaddir,0644);
	}
	$tnews 		= 'mod/user/photo/';
    $small 	= $tnews . $namagambar;
	create_thumbnail ($uploaddir, $small, $new_width = 100, $new_height = 'auto', $quality = 85);
if ($jumlah){
$seftitle = $seftitle.$jumlah;
}
    //masukkan data
    //$tgl= date('Y-m-d H:i:s');
    $hasil = $koneksi_db->sql_query( "update useraura set photo ='$namagambar'where user='$username'" );
    if($hasil){
    $admin.='<div class="callout callout-success">Berhasil Update Photo ...</div>';

unlink($uploaddir);
}
}
}
}

$query 		= mysql_query ("SELECT * FROM `useraura` WHERE `UserId`='$id'");
$data 		= mysql_fetch_array($query);
$username = $data['user'];
$photo = $data['photo'];
if($photo){
$photo = '<img src="mod/user/photo/'.$photo.'">';
}else{
$photo = '<img src="mod/user/photo/default-photo.jpg">';
}
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Picture Users</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action=""class="form-inline" enctype ="multipart/form-data">
<table class="table table-striped table-hover">
	<tr>
		<td></td>
		<td></td>
		<td>'.$photo.'</td>
	</tr>
	<tr>
		<td>Nama</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" disabled class="form-control"></td>
	</tr>
	<tr>
		<td>Photo</td>
		<td>:</td>
		<td><input type="file" name="gambar" class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="hidden" name="username" value="'.$username.'">
		<input type="submit" value="Upload" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if ($_GET['aksi'] == 'resetallpassword'){
	if(isset($_POST['submit'])){
	$level 		= $_POST['level'];

	$error 	= '';
	if ($error){
		$admin .= '<div class="callout callout-danger">'.$error.'</div>';
	}else{
		$hasil2 = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level ='$level'" );
		while ($data = $koneksi_db->sql_fetchrow($hasil2)) {
		$id=$data['UserId'];	
		$user=$data['user'];	
		$passwordbaru=$user.'*';
		$passwordguru=$data['urutan'];
		if($level=='Siswa'){
		$hasil  = mysql_query( "UPDATE `useraura` SET `password`=md5('$passwordbaru'),`password2`='$passwordbaru' WHERE `UserId`='$id'" );
		}else{
			$hasil  = mysql_query( "UPDATE `useraura` SET `password`=md5('$passwordguru'),`password2`='$passwordguru' WHERE `UserId`='$id'" );
			}
		}
		if($hasil){
			$admin .= '<div class="callout callout-success"><b>Password Berhasil di Reset.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=user&amp;mod=yes&aksi=resetallpassword" />';	
		}else{
			$admin .= '<div class="callout callout-danger"><b>Gagal di Update.</b></div>';
		}
	}

}

$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Reset Password</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$sel = '<select name="level" class="form-control">';
$arr5 = array ('Guru','Siswa');
foreach ($arr5 as $k=>$v){
	$sel .= '<option value="'.$v.'">'.$v.'</option>';	
	
}

$sel .= '</select>';  
$admin .= '
<form method="post" action=""class="form-inline">
<table class="table table-condensed">
	<tr>
		<td>Level</td>
		<td>:</td>
		<td>'.$sel.'</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Reset" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';	
}

if($_GET['aksi']=="import"){
if(isset($_POST['submit'])){
 
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
 
 $cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jumlah = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jumlah ){
 
   //$cell->val( baris,kolom )
 
$username = $cell->val( $i,1 );
$password = $cell->val( $i,2 );
$nama  = $cell->val( $i,3 );
$urutan  = $cell->val( $i,4 );
$tahunajaran=$idtahunajarandefault;
$password3 = md5("$password");
$nama=addslashes($nama);
if($username<>'' and $password<>''){
$sql ="INSERT INTO `useraura` (`user`,`password`,`nama`,`password2`,`tahunajaran`,`level`,`urutan`) VALUES ('$username','$password3','$nama','$password','$tahunajaran','Guru','$urutan')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}
}else{
$gagal++;	
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Data Guru Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";


}

$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Import Guru</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">';
$admin .='<tr>
		<td>Tahun Ajaran</td>
		<td>:</td>
		<td><input type="text" name="tahunajaran" value="'.$tahunajarandefault.'" size="30" class="form-control"readonly></td>
	</tr>';
$admin.=' <tr>
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td>Contoh File Excel </td>
	<td>:</td>
	<td><a href="mod/importsiswa/admin/importguru.xls">importguru.xls</a></td>
 </tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="import" class="btn btn-success"></td>
 </tr>
 </table>
 </form>';
 $admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
/***********************************/
$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level ='Guru'" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar Users</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .="<form method='post' action=''>";
$admin.='
<table id="example1" class="table">
<thead><tr>
    <td align="center"><b>No</b></td>
    <td align="center"><b>User</b></td>
    <td align="center"><b>Password</b></td>
	<td align="center"><b>Nama</b></td>
    <td align="center"><b>Level</b></td>
    <td align="center" width="30%"><b>Actions</b></td>
  </tr></thead><tbody>';

while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$photo = $data['photo'];
if($photo){
$linkphoto = '<a href="?pilih=user&amp;mod=yes&amp;aksi=photo&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-success">Photo</span></a>';
}else{
$linkphoto = '<a href="?pilih=user&amp;mod=yes&amp;aksi=photo&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-default">Photo</span></a>';
}
	$admin.='
  <tr>
  <td>'.$data['urutan'].'</td>
    <td>'.$data['user'].'</td>
    <td>'.$data['password2'].'</td>
    <td>'.$data['nama'].'</td>
    <td>'.$data['level'].'</td>
    <td>
     <a href="?pilih=user&amp;mod=yes&amp;aksi=hapus&amp;id='.$data['UserId'].$qss.'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus User Ini ?\')"><span class="btn btn-danger">Hapus</span></a>
	 <a href="?pilih=user&amp;mod=yes&amp;aksi=edit&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-warning">Edit</span></a>
	 <a href="?pilih=user&amp;mod=yes&amp;aksi=editpassword&amp;id='.$data['UserId'].$qss.'"><span class="btn btn-primary">Password</span></a>
	 '.$linkphoto.'
	 </td>
  </tr>';  
}
$admin .= '<tbody></table>';
$admin .="</form>";
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';			  
}

if (in_array($_GET['aksi'],array('listkelas'))){

$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level <>'Siswa' and level<>'Administrator' order by urutan asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar Users</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .="<form method='post' action=''>";
$admin.='
<table id="example1" class="table">
<thead><tr>
    <td align="center"><b>No</b></td>
    <td align="center"><b>User</b></td>
    <td align="center"><b>Nama</b></td>
    <td align="center"><b>Level</b></td>
    <td align="center" width="10%"><b>Actions</b></td>
  </tr></thead><tbody>';

while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$user = $data['user'];
$query         = $koneksi_db->sql_query ("SELECT * FROM guru_isi WHERE guru='$user'");
$jumlahkelas         = $koneksi_db->sql_numrows($query);
if($jumlahkelas>'0'){
$tomboltambah = '<a href="?pilih=user&amp;mod=yes&amp;aksi=tambahkelas&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-primary">Tambah ('.$jumlahkelas.')</a>';	
}else{
$tomboltambah = '<a href="?pilih=user&amp;mod=yes&amp;aksi=tambahkelas&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-danger">Tambah ('.$jumlahkelas.')</a>';	
}
	$admin.='
  <tr>
      <td>'.$data['urutan'].'</td>
    <td>'.$data['user'].'</td>
    <td>'.$data['nama'].'</td>
    <td>'.$data['level'].'</td>
    <td>'.$tomboltambah.'</td>
  </tr>';  
}
$admin .= '<tbody></table>';
$admin .="</form>";
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if($_GET['aksi']=="tambahkelas"){
$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
if(isset($_POST['submit'])){
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);
$kelas 		= $_POST['kelas'];
$guru 		= $_POST['guru'];

	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT guru FROM guru_isi WHERE guru='$guru' and kelas='$kelas'  and id<>'$id'")) > 0) $error .= "Error: Kelas ".$kelas." sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
	$hasil  = mysql_query( "INSERT INTO `guru_isi` (`kelas`,`guru`) VALUES ('$kelas','$guru')" );
		if($hasil){
		$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
	//	unlink($uploaddir);
		unset($kelas);
		}
	}
}

$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah Mata Pelajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline"enctype ="multipart/form-data">
<table class="table table-striped table-hover">
<tr>
		<td>Guru</td>
		<td>:</td>
		<td>
<select name="guru" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM useraura where level='Guru' and UserId='$iduser' limit 1");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['user'].'" '.$pilihan.'>'.$datas['urutan'].'. '.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
	<tr>
		<td>Kelas</td>
		<td>:</td>
		<td>
<select name="kelas" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM kelas where tahunajaran='$idtahunajarandefault' order by id asc");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'">'.$datas['kelas'].'</option>';
}
$admin .='</select></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Tambah" name="submit"class="btn btn-success" >&nbsp;<a href="?pilih=user&amp;mod=yes&amp;aksi=listkelas" onclick="return confirm(\'Apakah Anda Yakin Ingin kembali ?\')"><span class="btn btn-warning">Kembali</span></a> </td>
	</tr>
</table>
</form>';	
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Kelas</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table class="table  table-hover">
<thead><tr>
<th>No</th>
<th>Kelas</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
$hasil = $koneksi_db->sql_query("SELECT * FROM guru_isi where guru='$guruuser' order by id asc");
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$tahunajaran=$data['tahunajaran'];
$kelas=$data['kelas'];
$kelaskat=$data['kelaskat'];
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.getkelas($kelas).'</td>
<td><a href="?pilih=user&amp;mod=yes&amp;aksi=delkelas&iduser='.$iduser.'&guruuser='.$guruuser.'&amp;idkelas='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> </td>
</tr>';
$no++;
}
$admin .= '</tbody></table>';
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if($_GET['aksi']== 'delkelas'){    
	global $koneksi_db;    
$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
$idkelas     = int_filter($_GET['idkelas']); 
$hasil = $koneksi_db->sql_query("DELETE FROM guru_isi WHERE id = '$idkelas'");
if($hasil){    
$admin.='<div class="alert alert-success fade in">Kelas berhasil dihapus! .</div>';$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=user&mod=yes&aksi=tambahkelas&iduser='.$iduser.'&guruuser='.$guruuser.'" />';    
}
}

if (in_array($_GET['aksi'],array('listguru'))){

$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level <>'Siswa' and level<>'Administrator' order by urutan asc" );
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar Users</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .="<form method='post' action=''>";
$admin.='
<table id="example1" class="table">
<thead><tr>
    <td align="center"><b>No</b></td>
    <td align="center"><b>User</b></td>
    <td align="center"><b>Nama</b></td>
    <td align="center"><b>Level</b></td>
    <td align="center" width="10%"><b>Actions</b></td>
  </tr></thead><tbody>';

while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$user = $data['user'];
$query         = $koneksi_db->sql_query ("SELECT * FROM guru_dinilai WHERE guru='$user'");
$jumlahdinilai         = $koneksi_db->sql_numrows($query);
if($jumlahdinilai>'0'){
$tomboltambah = '<a href="?pilih=user&amp;mod=yes&amp;aksi=tambahguru&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-primary">Tambah ('.$jumlahdinilai.')</a>';	
}else{
$tomboltambah = '<a href="?pilih=user&amp;mod=yes&amp;aksi=tambahguru&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-danger">Tambah ('.$jumlahdinilai.')</a>';	
}
	$admin.='
  <tr>
      <td>'.$data['urutan'].'</td>
    <td>'.$data['user'].'</td>
    <td>'.$data['nama'].'</td>
    <td>'.$data['level'].'</td>
    <td>'.$tomboltambah.'</td>
  </tr>';  
}
$admin .= '<tbody></table>';
$admin .="</form>";
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if($_GET['aksi']=="tambahguru"){
$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
if(isset($_POST['submit'])){
define("GIS_GIF", 1);
define("GIS_JPG", 2);
define("GIS_PNG", 3);
define("GIS_SWF", 4);
$dinilai 		= $_POST['dinilai'];
$guru 		= $_POST['guru'];

	$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT dinilai FROM guru_dinilai WHERE guru='$guru' and dinilai='$dinilai'  and id<>'$id'")) > 0) $error .= "Error:  sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
	$hasil  = mysql_query( "INSERT INTO `guru_dinilai` (`dinilai`,`guru`) VALUES ('$dinilai','$guru')" );
		if($hasil){
		$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
	//	unlink($uploaddir);
		unset($dinilai);
		}
	}
}

$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah Mata Pelajaran</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '
<form method="post" action="" class="form-inline"enctype ="multipart/form-data">
<table class="table table-striped table-hover">
<tr>
		<td>Guru</td>
		<td>:</td>
		<td>
<select name="guru" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM useraura where level='Guru' and UserId='$iduser' limit 1");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['user'].'" '.$pilihan.'>'.$datas['urutan'].'. '.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
	<tr>
		<td>Di Nilai Oleh</td>
		<td>:</td>
		<td>
<select name="dinilai" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM useraura where level='Guru' and UserId <> '$iduser' order by urutan asc");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['user'].'" '.$pilihan.'>'.$datas['urutan'].'. '.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Tambah" name="submit"class="btn btn-success" >&nbsp;<a href="?pilih=user&amp;mod=yes&amp;aksi=listguru" onclick="return confirm(\'Apakah Anda Yakin Ingin kembali ?\')"><span class="btn btn-warning">Kembali</span></a> </td>
	</tr>
</table>
</form>';	
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Guru yang Menilai</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<table class="table  table-hover">
<thead><tr>
<th>No</th>
<th>User</th>
<th>Nama</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no = 1;
$hasil = $koneksi_db->sql_query("SELECT * FROM guru_dinilai where guru='$guruuser' order by id asc");
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$dinilai=$data['dinilai'];
$hasil2 = $koneksi_db->sql_query( "SELECT * FROM `useraura`where user='$dinilai'" );
$data2 = $koneksi_db->sql_fetchrow($hasil2);
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.$data2['user'].'</td>
<td>'.$data2['nama'].'</td>
<td><a href="?pilih=user&amp;mod=yes&amp;aksi=delguru&iduser='.$iduser.'&guruuser='.$guruuser.'&amp;iddinilai='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> </td>
</tr>';
$no++;
}
$admin .= '</tbody></table>';
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if($_GET['aksi']== 'delguru'){    
	global $koneksi_db;    
$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
$iddinilai     = int_filter($_GET['iddinilai']); 
$hasil = $koneksi_db->sql_query("DELETE FROM guru_dinilai WHERE id = '$iddinilai'");
if($hasil){    
$admin.='<div class="alert alert-success fade in">Kelas berhasil dihapus! .</div>';$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=user&mod=yes&aksi=tambahguru&iduser='.$iduser.'&guruuser='.$guruuser.'" />';    
}
}


$admin.='</section>';
}
echo $admin;
?>
