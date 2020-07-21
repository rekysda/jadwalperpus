<?php
//include"admin/admin_situs.php";
if (!defined('AURACMS_CONTENT')) {
	Header("Location: ../index.php");
	exit;
}
global $koneksi_db;
$username = $_SESSION['UserName'];
$hasil =  $koneksi_db->sql_query( "SELECT * FROM useraura WHERE user='$username'" );
$data = $koneksi_db->sql_fetchrow($hasil);
$nama=$data['nama'];
$level=$_SESSION['LevelAkses'];
$mapel = getmapelguru($username);
$admin .='<section class="content-header">
          <h1>
           Dashboard
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Dashboard</li>
            <li class="active">Halaman Awal</li>
          </ol>
        </section>';
if (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Guru"){		
$admin .='
<section class="content">';	
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Info User</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .='&nbsp;<b>User :</b> '.$username.'<br>';
$admin .='&nbsp;<b>Nama  :</b> '.$nama.'<br>';
$admin .='&nbsp;<b>Level :</b> '.$level.'<br>';
$admin .='&nbsp;<b>Mapel :</b> '.$mapel.'<br>';
$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
$admin .='</section>';
/******************************************/
$admin .='
<section class="content">';	
if($_SESSION['LevelAkses']=="Guru"){
$hasil = $koneksi_db->sql_query( "SELECT * FROM `useraura`where user='$username' order by urutan asc" );
}

$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Daftar '.$sessionusername.'</h3>
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
$query         = $koneksi_db->sql_query ("SELECT * FROM jadwalujian WHERE guru='$user'");
$jumlahjadwal         = $koneksi_db->sql_numrows($query);
if($jumlahjadwal>'0'){
$tomboltambah = '<a href="?pilih=jadwalujian&amp;mod=yes&amp;aksi=tambahjadwal&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-primary">Tambah ('.$jumlahjadwal.')</a>';	
}else{
$tomboltambah = '<a href="?pilih=jadwalujian&amp;mod=yes&amp;aksi=tambahjadwal&amp;iduser='.$data['UserId'].'&guruuser='.$data['user'].'"class="btn btn-danger">Tambah ('.$jumlahjadwal.')</a>';	
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
$admin .='</section>';
}
		
echo $admin;
?>