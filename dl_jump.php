<?php


include 'includes/session.php';
define('dl', true);
include 'includes/config.php';
include 'includes/mysql.php';
//if (isset($_GET['id']) && cek_login()){

if (isset($_GET['id'])){
$id		= int_filter($_GET['id']);
$hasil	= $koneksi_db->sql_query("SELECT url,hit,id FROM `mod_download` where id='$id'");
$data	= $koneksi_db->sql_fetchrow($hasil);
$url	= $data['url'];
$hit	= $data['hit'];
$Id	= $data['id'];
$hit	=$hit+1 ;
$hasil1 = $koneksi_db->sql_query("UPDATE `mod_download` SET `hit`=hit+1 WHERE `id` = '$id'");
header ("location: $url");
exit;
}else{
header ("location: index.php");
}
/*
} else {
	echo '<h4>Anda Mesti Login, atau register jika blm punya account</h4>';
}
*/

?>