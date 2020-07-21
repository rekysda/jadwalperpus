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
            Transaksi
            <small>Mengatur Jadwal Perpus</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=jadwalperpus&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Transaksi</li>
            <li class="active">Jadwal Perpus</li>
          </ol>
        </section>';			
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=jadwalperpus&mod=yes" >
<i class="fa fa-clock-o">&nbsp;</i> Jadwal Perpus <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';		
if($_GET['aksi']== 'hapus'){    
	global $koneksi_db;    
	$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("delete from `jadwalperpus` WHERE status='3'  and `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">jadwal perpus berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=jadwalperpus&mod=yes&aksi=tambahjadwal&iduser='.$iduser.'&guruuser='.$guruuser.'" />';    
	}
}

if($_GET['aksi']== 'batal'){    
	global $koneksi_db;    
	$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("Update `jadwalperpus` set status='3' WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">jadwal perpus berhasil dibatalkan! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=jadwalperpus&mod=yes&aksi=tambahjadwal&iduser='.$iduser.'&guruuser='.$guruuser.'" />';    
	}
}

if($_GET['aksi']==""){
if($_SESSION['LevelAkses']=="Administrator"){
$sessionusername = $_SESSION['UserName'];
$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level <>'Siswa' and level<>'Administrator' order by urutan asc" );
}else if($_SESSION['LevelAkses']=="Guru"){
$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where level <>'Siswa' and level<>'Administrator' and user='$sessionusername' order by urutan asc" );
}

$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar Users</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .="<form method='post' action=''>";
$admin.='
<table id="example1" class="table table-striped table-bordered dt-responsive nowrap">
<thead><tr>
    <td align="left"><b>User</b></td>
    <td align="left"><b>Nama</b></td>
 <td align="left"><b>Email</b></td>	
    <td align="left" width="10%"><b>Actions</b></td>
  </tr></thead><tbody>';

while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$user = $data['user'];
$query         = $koneksi_db->sql_query ("SELECT * FROM jadwalperpus WHERE guru='$user'");
$jumlahjadwal         = $koneksi_db->sql_numrows($query);
if($jumlahjadwal>'0'){
$tomboltambah = '<a href="?pilih=jadwalperpus&amp;mod=yes&amp;aksi=tambahjadwal&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-primary">Tambah ('.$jumlahjadwal.')</a>';	
}else{
$tomboltambah = '<a href="?pilih=jadwalperpus&amp;mod=yes&amp;aksi=tambahjadwal&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-danger">Tambah ('.$jumlahjadwal.')</a>';	
}
	$admin.='
  <tr>
    <td>'.$data['user'].'</td>
    <td>'.$data['nama'].'</td>
	<td>'.$data['email'].'</td>
    <td>'.$tomboltambah.'</td>
  </tr>';  
}
$admin .= '<tbody></table>';
$admin .="</form>";
$admin .= '</div><!-- /.box-body -->
              </div><!-- /.box -->';
}

if($_GET['aksi']=="tambahjadwal"){
$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
if(isset($_POST['submit'])){
$guru     		= $_POST['guru'];
$jam     		= $_POST['jam'];
$kepentingan     		= $_POST['kepentingan'];
$mulai = getfieldtabel('mulai','jam','id',$jam);
$selesai = getfieldtabel('selesai','jam','id',$jam);
$tgl1     		= $_POST['tgl1']. " $mulai";
$namaguru = getfieldtabel('nama','useraura','UserId',$iduser);
$namajam = '( Jam Ke'.getfieldtabel('kode','jam','id',$jam).')';
$keterangan     		= " $namajam - $namaguru - $kepentingan";
$status = $statusjadwaladmindefault;
$error 	= '';
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT * FROM jadwalperpus WHERE tgl1='$tgl1' and jam ='$jam'and status ='2'")) > 0) $error = "Error: Jadwal Pemakaian Labkom sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="alert alert-danger">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `jadwalperpus`  VALUES ('','$tgl1','$status','$keterangan','$guru','$jam')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($tgl1);
		unset($tgl2);
		$admin .= '
<div class="alert alert-warning">
Batas waktu pemesanan maksimal 1 Minggu sebelum pemakaian		
</div>';
	//	$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=jadwalperpus&mod=yes&aksi=tambahjadwal&iduser='.$iduser.'&guruuser='.$guruuser.'" />';  
	}

}	
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Tambah Jadwal Perpus</h3>
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
$hasil = $koneksi_db->sql_query("SELECT * FROM useraura where level='Guru' and user ='$guruuser'");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['user']==$guruuser)?"selected":'';
$admin .= '<option value="'.$datas['user'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>';

$admin .='<tr>
		<td>Jam Ke</td>
		<td>:</td>
		<td>
<select name="jam" class="form-control"required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM jam order by kode");
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['guru']==$guruuser)?"selected":'';
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['kode'].'</option>';
}
$admin .='</select></td>
	</tr>';
$admin .='<tr>
		<td>Tgl Penggunaan</td>
		<td>:</td>
		<td><input type="text" name="tgl1" id="tgl1" value="'.$tgl1.'"  size="30" class="form-control"required>&nbsp;</td>
	</tr>';	
	$admin .='<tr>
		<td>Kepentingan</td>
		<td>:</td>
		<td><input type="text" name="kepentingan" id="kepentingan" value="'.$kepentingan.'"  size="30" class="form-control"required>&nbsp;</td>
	</tr>';	
$admin .='<tr>
		<td></td>
		<td></td>
		<td>
		<input type="hidden" value="'.$iduser.'" name="iduser">
		<input type="hidden" value="'.$guruuser.'" name="guruuser">
		<input type="submit" value="Tambah" name="submit"class="btn btn-success" >&nbsp;<a href="./admin.php?pilih=jadwalperpus&mod=yes" class="btn btn-warning">Kembali</a>&nbsp;<a href="./fullcalendar/" target="_blank" class="btn btn-primary">Lihat Versi kalender</a></td>
	</tr>
</table>
</form>';	
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';	
}	

/********************************************************/
if($_GET['aksi']=="tambahjadwal" or $_GET['aksi']=="edit"){
$iduser = int_filter($_GET['iduser']);
$guruuser = ($_GET['guruuser']);
/************************************/
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Jadwal Perpus</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
if($_SESSION['LevelAkses']=="Guru"){
$admin.='<b>Catatan : </b>Pembatalan Pemesanan Labkom hanya dapat di lakukan 2(dua) hari sebelum Tanggal Pelaksanaan, Lebih dari itu harap menghubungi pihak Admin';	
}
$admin.='
<table id="example"class="table table-striped table-bordered dt-responsive nowrap">
    <thead>
        <tr>
        <th>Guru</th>
        <th>Tgl</th>
        <th>JamKe</th>
        <th>Keterangan</th>	
		<th>Status</th>			
        <th>Aksi</th>
        </tr>
    </thead>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM jadwalperpus where guru = '$guruuser' order by tgl1 asc" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) {
$guru=$data['guru'];
$jam=$data['jam'];
$tgl1=$data['tgl1'];
$status=$data['status'];
$keterangan=$data['keterangan'];
$selisih = beda_waktu($tgl1, date('Y-m-d'), '%d');
$tglskrg=date('Y-m-d');
if($tglskrg<$tgl1 or $tglskrg=$tgl1){
if($_SESSION['LevelAkses']=="Administrator"){
$selisih = beda_waktu($tgl1, date('Y-m-d'), '%d');
if($status<'3'){
$tombolbatal ='<a href="?pilih=jadwalperpus&mod=yes&aksi=batal&id='.$data['id'].'&iduser='.$iduser.'&guruuser='.$guruuser.'" onclick="return confirm(\'Apakah Anda Yakin Ingin Membatalkan Data Ini ?\')"><span class="btn btn-warning">Batal</span></a>';
}else{
$tombolbatal ='<a href="?pilih=jadwalperpus&mod=yes&aksi=hapus&id='.$data['id'].'&iduser='.$iduser.'&guruuser='.$guruuser.'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a>';	
	
}
}else{
$selisih = beda_waktu($tgl1, date('Y-m-d'), '%d');
if($selisih<1){
$tombolbatal ='<a href="?pilih=jadwalperpus&mod=yes&aksi=batal&id='.$data['id'].'&iduser='.$iduser.'&guruuser='.$guruuser.'" onclick="return confirm(\'Apakah Anda Yakin Ingin Membatalkan Data Ini ?\')"><span class="btn btn-warning">Batal</span></a>';	
}else{
$tombolbatal ='<button type="button" class="btn btn-warning disabled">Batal</button>';	
}
}
$admin .='<tr>
<td>'.getfieldtabel('nama','useraura','UserId',$iduser).'
</td>
<td>'.tanggalindoshort($tgl1).'</td>
<td>'.getfieldtabel('kode','jam','id',$jam).'</td>
<td>'.($keterangan).'</td>
<td>'.getstatus($status).'</td>
<td>'.$tombolbatal.'</td>
</tr>';
}
}
$admin .= '</tbody></table>';
$admin .= '</div>';
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
}
/************************************/


}

$admin .='</section>';
echo $admin;

?>