<?php
/**
 * Nafiweb v2.3
 * http://www.nafiweb.com
 * December 03, 2007 07:29:56 AM 
 * Author: Nafiweb - reky@nafiweb.com +6285732037068
 *
Disclaimer
- Dilarang memperjualbelikan aplikasi dengan alasan apapun!
- Dilarang memperbanyak/menyebarkan aplikasi tanpa izin.
- Seluruh Kode di dalam aplikasi merupakan hak nafiweb.com. Dilarang keras mengubah, menggandakan, menyebarkan, mencetak sebagian atau seluruh isi aplikasi ini, dengan cara dan tujuan apapun.
**/
	class microTimer {
    function start() {
        global $starttime;
        $mtime = microtime ();
        $mtime = explode (' ', $mtime);
        $mtime = $mtime[1] + $mtime[0];
        $starttime = $mtime;
    }
    function stop() {
        global $starttime;
        $mtime = microtime ();
        $mtime = explode (' ', $mtime);
        $mtime = $mtime[1] + $mtime[0];
        $endtime = $mtime;
        $totaltime = round (($endtime - $starttime), 5);
        return $totaltime;
    }
}

$timer = new microTimer;
$timer->start();

include 'includes/session.php';
@header("Content-type: text/html; charset=utf-8;");
ob_start("ob_gzhandler");

define('AURACMS_MODULE', true);
define('AURACMS_CONTENT', true);
define('AURACMS_admin', true);
include "includes/config.php";
include "includes/mysql.php";
include "includes/configsitus.php";
include "includes/template.php";
global $judul_situs,$theme;


$old_modules = !isset($old_modules) ? null : $old_modules;
$_GET['aksi'] = !isset($_GET['aksi']) ? null : $_GET['aksi'];
$cek = '';
if (!cek_login ()){
   	$cek ='<table width="100%" border="0" cellspacing="0" cellpadding="0" class="middle"><tr><td><table width="100%" class="bodyline"><tr><td align="left"><img src="images/warning.gif" border="0"></td><td align="center"><font class="option">You Must Login First If Not Yet Have Account Please Register</font></td><td align="right"><img src="images/warning.gif" border="0"></td></tr></table></td></tr></table>';
   	header ("location:index.php");
	    exit;

}else{

if (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Administrator"){

include "includes/security.php";

if ($old_modules == 1) {
      //  if (!ini_get("register_globals")) @import_request_variables('GPC');
}  

ob_start();
if(!isset($_GET['pilih'])){
	include 'content/dashboard.php';
	} else if (@$_GET['mod'] == 'yes'
			&& file_exists('mod/'.$_GET['pilih'].'/admin/admin_'.$_GET['pilih'].'.php') 
			&& !preg_match("/[\.\/]/",$_GET['pilih'])) {
				include 'mod/'.$_GET['pilih'].'/admin/admin_'.$_GET['pilih'].'.php';	
			} else if (!isset($_GET['mod']) 
			&& file_exists('admin/'.$_GET['pilih'].'.php') 
			&& !preg_match("/[\.\/]/",$_GET['pilih'])) {
				include 'admin/'.$_GET['pilih'].'.php';	
				}
	else {
	include 'content/dashboard.php';	
	}

$content = ob_get_contents();
ob_end_clean();

if ($_GET['aksi'] == 'logout') {
logout ();
}


}
else if (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Guru"){
	
include "includes/security.php";	

ob_start();
if(!isset($_GET['pilih'])){
	include 'content/dashboard.php';
		}else if (@$_GET['mod'] == 'yes' 
				  && file_exists('mod/'.$_GET['pilih'].'/guru/guru_'.$_GET['pilih'].'.php') 
				  && !preg_match("/[\.\/]/",$_GET['pilih'])){
						include 'mod/'.$_GET['pilih'].'/guru/guru_'.$_GET['pilih'].'.php';	
					}else {
	include 'content/dashboard.php';	
					}
$content = ob_get_contents();
ob_end_clean();
if ($_GET['aksi'] == 'logout') {
logout ();
}
}
else if (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Siswa"){
	
include "includes/security.php";	

ob_start();
if(!isset($_GET['pilih'])){
	include 'content/dashboard.php';
		}else if (@$_GET['mod'] == 'yes' 
				  && file_exists('mod/'.$_GET['pilih'].'/siswa/siswa_'.$_GET['pilih'].'.php') 
				  && !preg_match("/[\.\/]/",$_GET['pilih'])){
						include 'mod/'.$_GET['pilih'].'/siswa/siswa_'.$_GET['pilih'].'.php';	
					}else {
	include 'content/dashboard.php';	
					}
$content = ob_get_contents();
ob_end_clean();

}
else{
	$cek.='<table width="100%" border="0" cellspacing="0" cellpadding="0" class="middle"><tr><td><table width="100%" class="bodyline"><tr><td align="left"><img src="images/warning.gif" border="0"></td><td align="center"><font class="option">Access Denied!.... Your Level Not Much For Access This File</font></td><td align="right"><img src="images/warning.gif" border="0"></td></tr></table></td></tr></table>';
}
}

///// left side /////////////////////
ob_start();
//Blok Menu
include "content/menuadmin.php";
//include "content/menu.php";
echo "<!-- modul //-->";
//modul(0);
echo "<!-- blok kiri //-->";
//blok(0);
echo "<!-- akhir blok //-->";
$leftside = ob_get_contents();
ob_end_clean(); 
///// left side /////////////////////


///// right side /////////////////////
if (!isset($index_hal)){
ob_start();
//include "content/cari.php";
echo "<!-- modul -->";
//modul(1);
echo "<!-- blok kanan -->";
//blok(1);
$rightside = ob_get_contents();
ob_end_clean(); 
} else {
$style_include[] = '
<style type="text/css">
/*<![CDATA[*/
#main {
float: left;
margin-left: 0;
padding: 0;
width:72%;
}
/*]]>*/
</style>
';	
}
///// right side /////////////////////
///// ceklogin /////////////////////
ob_start();
include "content/ceklogin.php";
$ceklogin = ob_get_contents();
ob_end_clean(); 
///// adminprofile /////////////////////
ob_start();
include "content/adminprofile.php";
$adminprofile = ob_get_contents();
ob_end_clean();
///// useraccount /////////////////////
ob_start();
include "content/useraccount.php";
$useraccount = ob_get_contents();
ob_end_clean();
///// menuadmin /////////////////////
ob_start();
include "content/menuadmin.php";
$menuadmin = ob_get_contents();
ob_end_clean();

echo $cek;
$style_include_out = !isset($style_include) ? '' : implode("",$style_include);
$script_include_out = !isset($script_include) ? '' : implode("",$script_include);
$rightside = !isset($rightside) ? '' : $rightside;
$leftside = !isset($leftside) ? '' : $leftside;
$ceklogin = !isset($ceklogin) ? '' : $ceklogin;
$adminprofile = !isset($adminprofile) ? '' : $adminprofile;
$useraccount = !isset($useraccount) ? '' : $useraccount;
$menuadmin = !isset($menuadmin) ? '' : $menuadmin;

$define = array ('menuadmin'    => $menuadmin,
'useraccount'    => $useraccount,
				'adminprofile'    => $adminprofile,
				'leftside'    => $leftside,
				 'ceklogin'    => $ceklogin,
				 'url'     => $url_situs,
				 'content'     => $content,
				 'rightside'  => $rightside,
				 'judul_situs' => $judul_situs,
				 'style_include' => $style_include_out,
				 'script_include' => $script_include_out,
				 'meta_description' => $_META['description'],
				 'meta_keywords' => $_META['keywords'],
				 'timer' => $timer->stop()
                );
                
if (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Siswa"){
$tpl = new template ('themes/siswa/siswa.html');
}else{
$tpl = new template ('themes/administrator/administrator.html');
}
$tpl-> define_tag($define);
$tpl-> cetak();	
?>