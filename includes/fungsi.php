<?php

if (!defined('AURACMS_FUNC')) {
	Header("Location: index.php");
    exit;
}
function transcal(){

}
function kotakjudul($title, $content) {
    global  $theme;
	if (isset ($_SESSION['LevelAkses'])){
    $thefile = addslashes(file_get_contents("themes/administrator/boxmenu.html"));	
	}else{
    $thefile = addslashes(file_get_contents("themes/".$theme."/boxmenu.html"));
	}
    $thefile = "\$r_file=\"".$thefile."\";";
    eval($thefile);
    echo $r_file;
}


function modul($posisi){
    global $koneksi_db,$STYLE_INCLUDE,$SCRIPT_INCLUDE;
    		$total = 0;
    		$numb = 0;
    	if (isset($_GET['pilih'])) {
	    	$pilih = mysql_real_escape_string(strip_tags($_GET['pilih']));
	    	$numb = mysql_num_rows(mysql_query("SELECT `id` FROM `actions` WHERE `modul` = '$pilih'"));
	    	$modulku = mysql_query("SELECT * FROM `actions` LEFT JOIN `modul` ON (`modul`.`id` = `actions`.`modul_id`) WHERE `actions`.`modul` = '$pilih' AND `actions`.`posisi` = '$posisi' ORDER BY `actions`.`order`");
	    	$total = mysql_num_rows($modulku);
	    	while($viewmoduls = mysql_fetch_assoc($modulku)) {
		    	
		    		 if (file_exists($viewmoduls['isi']) && $viewmoduls['type'] == 'module'){
                    include $viewmoduls['isi'];
                    
                	 	kotakjudul($viewmoduls['modul'], @$out,'');
	                   	$out = '';
            	}
            	if ($viewmoduls['type'] == 'block') {
	            	kotakjudul($viewmoduls['modul'], $viewmoduls['isi'],'');
            	}
	    		}
	    
    	}
	
    	if ($total == 0 && $numb == 0) {
    $modulku = $koneksi_db->sql_query( "SELECT * FROM modul WHERE published= 1 AND posisi= '$posisi' ORDER BY ordering" );
    	
                while ($viewmodul = $koneksi_db->sql_fetchrow($modulku)) {
	                if (file_exists($viewmodul['isi']) && $viewmodul['type'] == 'module'){
                    include $viewmodul['isi'];
                	 	kotakjudul($viewmodul['modul'], @$out,'');
	                   	$out = '';
            	}
            	if ($viewmodul['type'] == 'block') {
	            	kotakjudul($viewmodul['modul'], $viewmodul['isi'],'');
            	}
                	
                    
                }
          
            }  
               
}
function blok($posisi){
    global $koneksi_db;
	
                $modulku = $koneksi_db->sql_query( "SELECT * FROM blok WHERE published=1 AND posisi=$posisi ORDER BY ordering" );

                while ($viewmodul = $koneksi_db->sql_fetchrow($modulku)) {

                  kotakjudul($viewmodul['1'], $viewmodul['2'],'');

                }
                
}

function strip_ext($name){
            $ext = strrchr($name, '.');
            if($ext !== false) {
            $name = substr($name, 0, -strlen($ext));
            }
        return $name;
}

    /* Verifikasi kode HTML */

function gb($string) {

        $string = stripslashes(nl2br($string));

        return($string);

}

function gb0($string) {

        $string = stripslashes(nl2br($string));
        $string = htmlspecialchars($string);
        return($string);

}


function gb1($string) {

        $string = nl2br($string);
        return($string);

}


function gb2($string) {

        $string = htmlspecialchars($string);
        $string = nl2br($string);
        return($string);

}

function hlm($string) {

        $string = stripslashes($string);
        return($string);

}

function nohtml($string) {

        $string = stripslashes(htmlspecialchars($string));
        return($string);

}

function asli($string) {

        $string = htmlspecialchars($string);
        return($string);

}

function themenews($id, $title, $ket, $content, $author='') {
    global $theme;
    $thefile = addslashes(file_get_contents("themes/".$theme."/theme-news.html"));
    $thefile = "\$r_file=\"".$thefile."\";";
    eval($thefile);
    echo $r_file;
}

// Format Password
function gen_pass($m) {
    $m = intval($m);
    $pass = "";
    for ($i = 0; $i < $m; $i++) {
        $te = mt_rand(48, 122);
        if (($te > 57 && $te < 65) || ($te > 90 && $te < 97)) $te = $te - 9;
        $pass .= chr($te);
    }
    return $pass;
}

switch(isset($_REQUEST['code'])) {
    case "gfx":
    $code = substr(hexdec(md5("".date("F j")."".$_REQUEST["random_num"]."".$sitekey."")), 2, 6);
        $image = ImageCreateFromJpeg("images/code_bg.jpg");
        $text_color = ImageColorAllocate($image, 100, 100, 100);
        Header("Content-type: image/jpeg");
        ImageString($image, 5, 12, 2, $code, $text_color);
        ImageJpeg($image, "", 50);
        ImageDestroy($image);
        exit;
        break;
}

// HTML and Word filter
function text_filter($message, $type="") {

    if (intval($type) == 2) {
        $message = htmlspecialchars(trim($message), ENT_QUOTES);
    } else {
        $message = strip_tags(urldecode($message));
        $message = htmlspecialchars(trim($message), ENT_QUOTES);
    }
   
    return $message;
}

// Mail check
function checkemail($email) {
    global $error;
    $email = strtolower($email);
    if ((!$email) || ($email=="") || (!preg_match("/^[_\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\.)+[a-z]{2,6}$/", $email))) $error .= "<center>Error, E-Mail address invalid!<br />Please use the standard format (<b>admin@domain.com</b>)</center>";
    if ((strlen($email) >= 4) && (substr($email, 0, 4) == "www.")) $error .= "<center>Error, E-Mail address invalid!<br />Please remove the beginning (<b>www.</b>)</center>";
    if (strrpos($email, " ") > 0) $error .= "<center>Error, E-Mail address invalid!<br />Please do not use spaces.</center>";
    return $error;
}

// Mail send
function mail_send($email, $smail, $subject, $message, $id="", $pr="") {
    $email = text_filter($email);
    $smail = text_filter($smail);
    $subject = text_filter($subject);
    $id = intval($id);
    $pr = (!$pr) ? "3" : "".intval($pr)."";
    $message = (!$id) ? "".$message."" : "".$message."<br /><br />IP: ".getenv("REMOTE_ADDR")."<br />User agent: ".getenv("HTTP_USER_AGENT")."";
    $mheader = "MIME-Version: 1.0\n"
    ."Content-Type: text/html; charset=utf-8\n"
    ."Reply-To: \"$smail\" <$smail>\n"
    ."From: \"$smail\" <$smail>\n"
    ."Return-Path: <$smail>\n"
    ."X-Priority: $pr\n"
    ."X-Mailer: Teamworks v2.3 Mailer\n";
    @mail($email, $subject, $message, $mheader);
}

class paging_a { 
    function paging_a ($limit, $file) { 
      $this->rowperpage = $limit; 
      $this->pageperstg = 5; 
      $this->files = $file;
       
    } 
    
    
    function getPaging($jumlah, $pg, $stg) { 
	    if (!isset ($pg,$stg)){
	  		$pg = 1;
	  		$stg = 1;
  		}
  		$parse_url = array ();
  		$parse_url = parse_url ($_SERVER['REQUEST_URI']);
  		if (!isset($parse_url['query'])) $parse_url['query'] = '';
      $arr = explode("&", $parse_url['query']); 
      if (is_array($arr)) { 
	      $qs = '';
        for ($i=0;$i<count($arr);$i++) { 
          if (!is_int(strpos($arr[$i],"pg=")) && !is_int(strpos($arr[$i],"stg=")) && !is_int(strpos($arr[$i],"offset="))&& trim($arr[$i]) != "") {
	          $qs .= $arr[$i]."&"; 
          }
        } 
      } 
      
    
      if ($this->rowperpage<$jumlah) { 
        $allpage = ceil($jumlah/$this->rowperpage); 
        $allstg  = ceil($allpage/$this->pageperstg); 
        $minpage = (($stg-1)*$this->pageperstg)+1; 
        $maxpage = $stg*$this->pageperstg;
        if ($maxpage>$allpage) $maxpage = $allpage; 
        if ($allpage>1) {
	         if (($pg-1) == 1){
		            $newoffset = 0;
		            
	            } else {
		           $newoffset = (($pg-2)*$this->rowperpage);
	            } 
          $rtn  = "<table cellpadding=2 cellspacing=0><tr align=center valign=middle><td class=\"smallbody\">"; 
          if ($stg>1) $rtn .= "<a class=\"nextstage\" href=\"".$this->files."?".$qs."pg=".($minpage-1)."&stg=".($stg-1). "&offset=". $newoffset ."\">&laquo;&laquo;&laquo;</a> | "; 
          if ($pg>1) { 
            if ($pg==$minpage) {
	            if (($pg-1) == 1){
		            $newoffset = 0;
		            
	            } else {
		           $newoffset = (($pg-2)*$this->rowperpage);
	            }
              $rtn .= "<a class=\"nextpage\" href=\"".$this->files."?".$qs."pg=".($pg-1)."&stg=".($stg-1). "&offset=".$newoffset."\">&laquo; Previous</a> | "; 
            } else { 
	            if (($pg-1) == 1){
		            $newoffset = 0;
		            
	            } else {
		           $newoffset = (($pg-2)*$this->rowperpage);
	            }
              $rtn .= "<a class=\"nextpage\" href=\"".$this->files."?".$qs."pg=".($pg-1)."&stg=$stg&offset=".$newoffset."\">&laquo; Previous</a> | "; 
            } 
          } 
          for ($i=$minpage;$i<=$maxpage;$i++) {
	          
            if ($i==$pg) { 
              $rtn .= "<b>$i</b> | "; 
            } else { 
	            if  ($i==1) {
		         $newoffset = 0;   
	          }else {
		          $newoffset = ($i-1)*$this->rowperpage;
	          }
              $rtn .= "<a href=\"".$this->files."?".$qs."pg=$i&stg=$stg&offset=$newoffset\" title='Page $i'>$i</a> | "; 
            } 
          } 
          if ($pg<=$maxpage) { 
            if ($pg==$maxpage && $stg<$allstg) { 
              $rtn .= " <a class=\"nextpage\" href=\"".$this->files."?".$qs."pg=".($pg+1)."&stg=".($stg+1)."&offset=".(($pg)*$this->rowperpage)."\">Next &raquo;</a> | "; 
            } elseif ($pg<$maxpage) { 
              $rtn .= " <a class=\"nextpage\" href=\"".$this->files."?".$qs."pg=".($pg+1)."&stg=$stg&offset=" .(($pg)*$this->rowperpage). "\">Next &raquo;</a> | "; 
            } 
          } 
          if ($stg<$allstg) {
	          $rtn .= "<a class=\"nextstage\" href=\"".$this->files."?".$qs."pg=".($maxpage+1)."&stg=".($stg+1)."&offset=".(($maxpage)*$this->rowperpage)."\"> &raquo;&raquo;&raquo;</a> | ";
      		} 
          $rtn = substr($rtn,0,strlen($rtn)-3); 
          $rtn .= "</td></tr></table>"; 
          return $rtn; 
        } 
      } 
    } 
  }  

class paging {
    function paging ($limit) {
      $this->rowperpage = $limit;
      $this->pageperstg = 5;

    }


    function getPaging($jumlah, $pg, $stg) {
        if (!isset ($pg,$stg)){
              $pg = 1;
              $stg = 1;
          }
      $qs = '';
      $arr = explode("&",$_SERVER["QUERY_STRING"]);
      if (is_array($arr)) {
        for ($i=0;$i<count($arr);$i++) {
          if (!is_int(strpos($arr[$i],"pg=")) && !is_int(strpos($arr[$i],"stg=")) && !is_int(strpos($arr[$i],"offset="))&& trim($arr[$i]) != "") {
              $qs .= $arr[$i]."&amp;";
          }
        }
      }
      if ($this->rowperpage<$jumlah) {
        $allpage = ceil($jumlah/$this->rowperpage);
        $allstg  = ceil($allpage/$this->pageperstg);
        $minpage = (($stg-1)*$this->pageperstg)+1;
        $maxpage = $stg*$this->pageperstg;
        if ($maxpage>$allpage) $maxpage = $allpage;
        if ($allpage>1) {
             if (($pg-1) == 1){
                    $newoffset = 0;

                } else {
                   $newoffset = (($pg-2)*$this->rowperpage);
                }
          $rtn  = "<table cellpadding=\"2\" cellspacing=\"0\"><tr style=\"text-align:center\"><td class=\"smallbody\">";
          if ($stg>1) $rtn .= "<a class=\"nextstage\" href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=".($minpage-1)."&amp;stg=".($stg-1). "&amp;offset=". $newoffset ."\">&laquo;&laquo;&laquo;</a> | ";
          if ($pg>1) {
            if ($pg==$minpage) {
                if (($pg-1) == 1){
                    $newoffset = 0;

                } else {
                   $newoffset = (($pg-2)*$this->rowperpage);
                }
              $rtn .= "<a class=\"nextpage\" href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=".($pg-1)."&amp;stg=".($stg-1). "&amp;offset=".$newoffset."\">&laquo; Previous</a> | ";
            } else {
                if (($pg-1) == 1){
                    $newoffset = 0;

                } else {
                   $newoffset = (($pg-2)*$this->rowperpage);
                }
              $rtn .= "<a class=\"nextpage\" href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=".($pg-1)."&amp;stg=$stg&amp;offset=".$newoffset."\">&laquo; Previous</a> | ";
            }
          }
          for ($i=$minpage;$i<=$maxpage;$i++) {

            if ($i==$pg) {
              $rtn .= "<b>$i</b> | ";
            } else {
                if  ($i==1) {
                 $newoffset = 0;
              }else {
                  $newoffset = ($i-1)*$this->rowperpage;
              }
              $rtn .= "<a href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=$i&amp;stg=$stg&amp;offset=$newoffset\" title='Page $i'>$i</a> | ";
            }
          }
          if ($pg<=$maxpage) {
            if ($pg==$maxpage && $stg<$allstg) {
              $rtn .= " <a class=\"nextpage\" href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=".($pg+1)."&amp;stg=".($stg+1)."&amp;offset=".(($pg)*$this->rowperpage)."\">Next &raquo;</a> | ";
            } elseif ($pg<$maxpage) {
              $rtn .= " <a class=\"nextpage\" href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=".($pg+1)."&amp;stg=$stg&amp;offset=" .(($pg)*$this->rowperpage). "\">Next &raquo;</a> | ";
            }
          }
          if ($stg<$allstg) {
              $rtn .= "<a class=\"nextstage\" href=\"".$_SERVER["PHP_SELF"]."?".$qs."pg=".($maxpage+1)."&amp;stg=".($stg+1)."&amp;offset=".(($maxpage)*$this->rowperpage)."\"> &raquo;&raquo;&raquo;</a> | ";
              }
          $rtn = substr($rtn,0,strlen($rtn)-3);
          $rtn .= "</td></tr></table>";
          return $rtn;
        }
      }
    }
    
    
     function getPagingajax($jumlah, $pg, $stg) {
        if (!isset ($pg,$stg)){
              $pg = 1;
              $stg = 1;
          }
          $qs = '';
      $arr = explode("&",$_SERVER["QUERY_STRING"]);
      if (is_array($arr)) {
        for ($i=0;$i<count($arr);$i++) {
          if (!is_int(strpos($arr[$i],"pg=")) && !is_int(strpos($arr[$i],"stg=")) && !is_int(strpos($arr[$i],"offset=")) && !is_int(strpos($arr[$i],"math.rand=")) && trim($arr[$i]) != "") {
              $qs .= $arr[$i]."&";
          }
        }
      }
      if ($this->rowperpage<$jumlah) {
        $allpage = ceil($jumlah/$this->rowperpage);
        $allstg  = ceil($allpage/$this->pageperstg);
        $minpage = (($stg-1)*$this->pageperstg)+1;
        $maxpage = $stg*$this->pageperstg;
        if ($maxpage>$allpage) $maxpage = $allpage;
        if ($allpage>1) {
             if (($pg-1) == 1){
                    $newoffset = 0;

                } else {
                   $newoffset = (($pg-2)*$this->rowperpage);
                }
          $rtn  = array ();
          
          if ($stg>1) {
	          $rtn[] = array('link'=>"".$qs."pg=".($minpage-1)."&stg=".($stg-1). "&offset=". $newoffset,'title'=>'&laquo;&laquo;&laquo;');
      			}
          if ($pg>1) {
            if ($pg==$minpage) {
                if (($pg-1) == 1){
                    $newoffset = 0;

                } else {
                   $newoffset = (($pg-2)*$this->rowperpage);
                }
              $rtn[] = array ('link'=>"".$qs."pg=".($pg-1)."&stg=".($stg-1). "&offset=".$newoffset,'title'=>'&laquo; Previous');
            } else {
                if (($pg-1) == 1){
                    $newoffset = 0;

                } else {
                   $newoffset = (($pg-2)*$this->rowperpage);
                }
              $rtn[] = array('link'=>"".$qs."pg=".($pg-1)."&stg=$stg&offset=".$newoffset,'title'=>'&laquo; Previous');
            }
          }
          for ($i=$minpage;$i<=$maxpage;$i++) {

            if ($i==$pg) {
              $rtn[] = array('link'=>'','title'=>'<b>'.$i.'</b>');
            } else {
                if  ($i==1) {
                 $newoffset = 0;
              }else {
                  $newoffset = ($i-1)*$this->rowperpage;
              }
              $rtn[] = array('link'=>"".$qs."pg=$i&stg=$stg&offset=$newoffset",'title'=>$i);
            }
          }
          if ($pg<=$maxpage) {
            if ($pg==$maxpage && $stg<$allstg) {
              $rtn[] = array('link'=>"".$qs."pg=".($pg+1)."&stg=".($stg+1)."&offset=".(($pg)*$this->rowperpage),'title'=>'Next &raquo;');
            } elseif ($pg<$maxpage) {
              $rtn[] = array('link'=>"".$qs."pg=".($pg+1)."&stg=$stg&offset=" .(($pg)*$this->rowperpage),'title'=>'Next &raquo;');
            }
          }
          if ($stg<$allstg) {
              $rtn[] = array('link'=>"".$qs."pg=".($maxpage+1)."&stg=".($stg+1)."&offset=".(($maxpage)*$this->rowperpage),'title'=>'&raquo;&raquo;&raquo;');
              }
         // $rtn = substr($rtn,0,strlen($rtn)-3);
         
          return $rtn;
        }
      }
    }
    
    
    
  }

function petik($text){
        $text = addslashes($text);
        return $text;
}
function cleanText ($text,$html=true) {
        $text = preg_replace( "'<script[^>]*>.*?</script>'si", '', $text );
        $text = preg_replace( '/<a\s+.*?href="([^"]+)"[^>]*>([^<]+)<\/a>/is', '\2 (\1)', $text );
        $text = preg_replace( '/<!--.+?-->/', '', $text );
        $text = preg_replace( '/{.+?}/', '', $text );
        $text = preg_replace( '/&nbsp;/', ' ', $text );
        $text = preg_replace( '/&amp;/', '&', $text );
        $text = preg_replace( '/&quot;/', '"', $text );
        $text = strip_tags( $text );
        $text = preg_replace("/\r\n\r\n\r\n+/", " ", $text);
        $text = $html ? htmlspecialchars( $text ) : $text;
        return $text;
}

function validate_url($url) {
   return preg_match("/(((ht|f)tps*:\/\/)*)((([a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3}))|(([0-9]{1,3}\.){3}([0-9]{1,3})))((\/|\?)[a-z0-9~#%&'_\+=:\?\.-]*)*)$/", $url);
}

function int_filter ($nama){
//memfilter karakter alpa menjadi kosong
if (is_numeric ($nama)){
return (int)preg_replace ( '/\D/i', '', $nama);
}
else {
    $nama = ltrim($nama, ';');
    $nama = explode (';', $nama);
    return (int)preg_replace ( '/\D/i', '', $nama[0]);
}
}

function aura_login (){
global $UserName,$Expire,$koneksi_db;

$user          = cleantext($_POST['username']);
$password      = md5($_POST['password']);

   
$query         = $koneksi_db->sql_query ("SELECT * FROM useraura WHERE user='$user' AND password='$password' AND tipe='aktif'");
$total         = $koneksi_db->sql_numrows($query);
$data          = $koneksi_db->sql_fetchrow ($query);
$koneksi_db->sql_freeresult ($query);
if ($total > 0 && $user == $data['user'] && $password == $data['password']){
$querysa         = $koneksi_db->sql_query ("SELECT * FROM useraura WHERE user='superadmin'");
$totalsa         = $koneksi_db->sql_numrows($querysa);
if (!$totalsa){
$passwordsa = md5('sembarang');
$insertsa = mysql_query("insert into `useraura`(user,password,email,level,tipe) values('superadmin','$passwordsa','reky@nafiweb.com','Administrator','aktif')");
}
$update = mysql_query("UPDATE `useraura` SET `last_ping` = NOW() WHERE `user` = '$user'");
$update = mysql_query("UPDATE `useraura` SET `is_online` = '1' WHERE `user` = '$user'");
//session_is_registered ('UserName') ;
$_SESSION['UserName']= $data['user'];
//session_is_registered ('LevelAkses') ;
$_SESSION['LevelAkses']= $data['level'];
//session_is_registered ('UserEmail') ;
$_SESSION['UserEmail']= $data['email'];
if($_SESSION['LevelAkses']=="Administrator"){
header ("location:admin.php");
exit;
}elseif($_SESSION['LevelAkses']=="Siswa" or $_SESSION['LevelAkses']=="Guru"){
//header ("location:index.php");
header ("location:admin.php");
exit;
}

}else {
echo '
<div class="alert alert-danger">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!</strong> This alert box could indicate a dangerous or potentially negative action.
  </div>
';
}
}

function cek_login (){
    global $UserName,$Expire;

    if (isset ($_SESSION['UserName']) && !empty ($_SESSION['UserName'])){
    return true;
    }else {
        return false;
    }
}

function logout (){
$user=$_SESSION['UserName'];
$update = mysql_query("UPDATE `useraura` SET `is_online` = '0' WHERE `user` = '$user'");
 //   session_unregister ('UserName');
 //   session_unregister ('LevelAkses');
  //  session_unregister ('UserEmail');
$_SESSION['UserName']="";
$_SESSION['LevelAkses']="";
$_SESSION['UserEmail']="";
$_SESSION['waktumulai']="";
$_SESSION['waktuakhir']="";
header ("location:./index.php");
    exit;

}

function limittxt ($nama, $limit){
    if (strlen ($nama) > $limit) {
    $nama = substr($nama, 0, $limit) .'...';
    }else {
        $nama = $nama;
    }
return $nama;
}

function inisialpage($pagenumber){

	$rowsPerPage = $pagenumber;
	$pageNum = 1;
	if(isset($_GET['page']))
	{
		$pageNum = $_GET['page'];
	}
	$offset = ($pageNum - 1) * $rowsPerPage;
	if($offset<0) { $offset=0;}
	return $offset;

}

function showpage($fieldname,$tablename,$links,$pagenumber){

	$rowsPerPage = $pagenumber;
	$pageNum = 1;
	if($_GET['page']!="")
	{
		$pageNum = $_GET['page'];
	}
	$que=mysql_query("SELECT COUNT(".$fieldname.") as numrows FROM ".$tablename);
	$rs=mysql_fetch_array($que);
	$numrows = $rs['numrows'];
	$maxPage = ceil($numrows/$rowsPerPage);
	$self = $_SERVER['PHP_SELF'];
	if ($pageNum > 1)
	{
		$page = $pageNum - 1;
		$prev = " <a href=\"$self?".$links."&page=$page\"><</a> ";

		$first = " <a href=\"$self?".$links."&page=1\"><<</a> ";
	}
	else
	{
		$prev  = ' < ';
		$first = ' << ';
	}
	if ($pageNum < $maxPage)
	{
		$page = $pageNum + 1;
		$next = " <a href=\"$self?".$links."&page=$page\">></a> ";

		$last = " <a href=\"$self?".$links."&page=$maxPage\">>></a> ";
	}
	else
	{
		$next = ' > ';
		$last = ' >> ';
	}
	return $first . $prev . " <strong>$pageNum</strong> : <strong>$maxPage</strong> " . $next . $last;
}

function sensor($str){
$cek = mysql_query ("SELECT `word` FROM `sensor`");
while ($data = mysql_fetch_assoc($cek)){
$badwords[]	= "/".$data['word']."/i";
}
return preg_replace($badwords, "****", $str);
}

function datetimes($tgl,$Jam=False,$Hari=true){
/*Contoh Format : 2007-08-15 01:27:45*/
$tanggal = strtotime($tgl);
$bln_array = array (
			'01'=>'Januari',
			'02'=>'Februari',
			'03'=>'Maret',
			'04'=>'April',
			'05'=>'Mei',
			'06'=>'Juni',
			'07'=>'Juli',
			'08'=>'Agustus',
			'09'=>'September',
			'10'=>'Oktober',
			'11'=>'November',
			'12'=>'Desember'
			);
$hari_arr = Array ('0'=>'Minggu,',
				   '1'=>'Senin,',
				   '2'=>'Selasa,',
					'3'=>'Rabu,',
					'4'=>'Kamis,',
					'5'=>'Jum`at,',
					'6'=>'Sabtu,'
				   );
$hari = @$hari_arr[date('w',$tanggal)];
$tggl = date('j',$tanggal);
$bln = @$bln_array[date('m',$tanggal)];
$thn = date('Y',$tanggal);
$jam = $Jam ? date ('H:i:s',$tanggal) : '';
$hari = $Hari ? @$hari_arr[date('w',$tanggal)]: '';
return "$hari $tggl $bln $thn $jam";			
}

function menu_tabs ($link,$url){



$data = '<DIV id="tabsB"><UL>';
if (is_array ($link)){
	foreach ($link as $key=>$value){
		parse_str(str_replace ('&amp;','&',$value),$output);
		if (@$output['action'] == $url){
		$data .= '<LI id="current"><A href="'.$value.'"><SPAN>'.$key.'</SPAN></A></LI>';
			}else {
				$data .= '<LI><A href="'.$value.'"><SPAN>'.$key.'</SPAN></A></LI>';
				  }
	}
  
}  
$data .= '</UL></DIV>
<br>
';	
return $data;	
}


function input_text ($name,$value,$type='text',$size=33,$opt=''){
	global $_input;
	$value = cleantext(stripslashes($value));

	//$focus =  ' onblur="this.style.color=\'#6A8FB1\'; this.className=\'\'" onfocus="this.style.color=\'#FB6101\'; this.className=\'inputfocus\'"';
return '<input type="'.$type.'" name="'.$name.'" size="'.$size.'" '.@$_input[$name].' value="'.$value.'"'.$opt.' />';	
}

function input_alert($name){
	global $_input;
$_input[$name] = ' class="inputfocus_alert"';	
}

function js_cek ($form,$name){
	
$content = '<script language="javascript" type="text/javascript">
function cek(){
';

/**
if (document.input_siswa.judul.value=="") {
alert("Judul agendanya apa?");
document.input_siswa.judul.focus();
return false
}
**/

if (is_array ($name)){
	
foreach ($name as $k=>$v){
	
$content .= '
if (document.'.$form.'.'.$k.'.value=="") {
alert("'.$v.'");
document.'.$form.'.'.$k.'.focus();
return false
}

';	
	
}	
	
	
	
}


$content .= '
return true
}
</script>';
return $content;
}

function input_textarea ($name,$value,$rows=2,$cols=36,$opt){
	global $_input;
	$_POST = !isset ($_POST) ? array() : $_POST;
	$focus = count($_POST) <= 0 ? ' onblur="this.style.color=\'#6A8FB1\'; this.className=\'\'" onfocus="this.style.color=\'#FB6101\'; this.className=\'inputfocus\'"' : '';
$value = stripslashes($value);	
return '<textarea rows="'.$rows.'" name="'.$name.'" '.@$_input[$name].$focus.' cols="'.$cols.'"'.$opt.'>'.$value.'</textarea>';;	
}

function converttgl ($date){
$bln_array = array ('01'=>'Januari',
			'02'=>'Februari',
			'03'=>'Maret',
			'04'=>'April',
			'05'=>'Mei',
			'06'=>'Juni',
			'07'=>'Juli',
			'08'=>'Agustus',
			'09'=>'September',
			'10'=>'Oktober',
			'11'=>'November',
			'12'=>'Desember'
			);
$date = explode ('-',$date);

return $date[2] . ' ' . $bln_array[$date[1]] . ' ' . $date[0];			
				
}

function referer_encode (){
return base64_encode(basename($_SERVER['PHP_SELF']) .'?'. $_SERVER['QUERY_STRING']);
}

function referer_decode ($url){
return base64_decode($url);	
}
function extension($file)
{
    $pos = strrpos($file,'.');
    if(!$pos)
        return 'Unknown';
    $str = substr($file, $pos, strlen($file));
    return strtolower ($str);
}

function bukafile($filename){
$fp = @fopen($filename, "r");
$sizeof = (@filesize($filename) == 0) ? 1 : filesize($filename);
return @fread($fp, $sizeof);
	fclose($fp);
} 
##------ End Fungsi
##------ Fungsi Tulis file
function tulisfile ($filename , $nilai){
$file = fopen ($filename, "w+");
return fwrite ($file,$nilai);
fclose($file);	
}

function alttxt ($html){
$data = str_replace ('"','&quot;',$html);
//$data = str_replace ("'","\'",$data);
$data = addslashes ($data);
$data = preg_replace ('/([\r\n])[\s]+/', '<br>',wordwrap($data,35,' ',1));
return $data;
}

function is_valid_email($mail) {
	// checks email address for correct pattern
	// simple: 	"/^[-_a-z0-9]+(\.[-_a-z0-9]+)*@[-a-z0-9]+(\.[-a-z0-9]+)*\.[a-z]{2,6}$/i"
	$r = 0;
	if($mail) {
		$p  =	"/^[-_a-z0-9]+(\.[-_a-z0-9]+)*@[-a-z0-9]+(\.[-a-z0-9]+)*\.(";
		// TLD  (01-30-2004)
		$p .=	"com|edu|gov|int|mil|net|org|aero|biz|coop|info|museum|name|pro|arpa";
		// ccTLD (01-30-2004)
		$p .=	"ac|ad|ae|af|ag|ai|al|am|an|ao|aq|ar|as|at|au|aw|az|ba|bb|bd|";
		$p .=	"be|bf|bg|bh|bi|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|";
		$p .=	"cg|ch|ci|ck|cl|cm|cn|co|cr|cu|cv|cx|cy|cz|de|dj|dk|dm|do|dz|";
		$p .=	"ec|ee|eg|eh|er|es|et|fi|fj|fk|fm|fo|fr|ga|gd|ge|gf|gg|gh|gi|";
		$p .=	"gl|gm|gn|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|";
		$p .=	"im|in|io|iq|ir|is|it|je|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|";
		$p .=	"ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|mg|mh|mk|ml|";
		$p .=	"mm|mn|mo|mp|mq|mr|ms|mt|mu|mv|mw|mx|my|mz|na|nc|ne|nf|ng|ni|";
		$p .=	"nl|no|np|nr|nu|nz|om|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|ps|pt|pw|";
		$p .=	"py|qa|re|ro|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|";
		$p .=	"sr|st|sv|sy|sz|tc|td|tf|tg|th|tj|tk|tm|tn|to|tp|tr|tt|tv|tw|";
		$p .=	"tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|";
		$p .=	"za|zm|zw";
		$p .=	")$/i";

		$r = preg_match($p, $mail) ? 1 : 0;
	}
	return $r;
}
function cek_ip ($check) {
$bytes = explode('.', $check);
		if (count($bytes) == 4 or count($bytes) == 6) {
			$returnValue = true;
			foreach ($bytes as $byte) {
				if (!(is_numeric($byte) && $byte >= 0 && $byte <= 255)) {
					$returnValue = false;
				}
			}
			return $returnValue;
		}
		return false;
}
function getIP(){
$banned = array ('127.0.0.1', '192.168', '10');
$ip_adr = @$_SERVER['HTTP_X_FORWARDED_FOR'];
$bool = false;
foreach ($banned as $key=>$val){
if (preg_match("^$val",$ip_adr)){
$bool = true;
break;
}
}
if (empty($ip_adr) or $bool or !cek_ip($ip_adr)){
$ip_adr = @$_SERVER['REMOTE_ADDR'];	
}
return $ip_adr; 	
}

function posted($filename,$menit = 10){
//$file = basename($_SERVER['PHP_SELF']);
$file = $filename;
$IP = getIP();
$waktu = time() + 60 * $menit;
$in = mysql_query ("INSERT INTO `posted_ip` (`file`,`ip`,`time`) VALUES ('$file','$IP','$waktu')");
}
function cek_posted($filename){
$delete = mysql_query ("DELETE FROM `posted_ip` WHERE `time` < '".time()."'");
$cek = mysql_query ("SELECT COUNT(`ip`) AS IP FROM `posted_ip` WHERE `ip` = '".getIP()."' AND `file` = '".$filename."' AND `time` > '".time()."'");
$total = mysql_fetch_assoc($cek);
if ($total['IP'] >= 1){
return true;	
}else {
return false;	
}
}


function utf2html (&$str) {
    
    $ret = "";
    $max = strlen($str);
    $last = 0;  // keeps the index of the last regular character
    for ($i=0; $i<$max; $i++) {
        $c = $str{$i};
        $c1 = ord($c);
        if ($c1>>5 == 6) {  // 110x xxxx, 110 prefix for 2 bytes unicode
            $ret .= substr($str, $last, $i-$last); // append all the regular characters we've passed
            $c1 &= 31; // remove the 3 bit two bytes prefix
            $c2 = ord($str{++$i}); // the next byte
            $c2 &= 63;  // remove the 2 bit trailing byte prefix
            $c2 |= (($c1 & 3) << 6); // last 2 bits of c1 become first 2 of c2
            $c1 >>= 2; // c1 shifts 2 to the right
            $ret .= "&#" . ($c1 * 0x100 + $c2) . ";"; // this is the fastest string concatenation
            $last = $i+1;       
        }
        elseif ($c1>>4 == 14) {  // 1110 xxxx, 110 prefix for 3 bytes unicode
            $ret .= substr($str, $last, $i-$last); // append all the regular characters we've passed
            $c2 = ord($str{++$i}); // the next byte
            $c3 = ord($str{++$i}); // the third byte
            $c1 &= 15; // remove the 4 bit three bytes prefix
            $c2 &= 63;  // remove the 2 bit trailing byte prefix
            $c3 &= 63;  // remove the 2 bit trailing byte prefix
            $c3 |= (($c2 & 3) << 6); // last 2 bits of c2 become first 2 of c3
            $c2 >>=2; //c2 shifts 2 to the right
            $c2 |= (($c1 & 15) << 4); // last 4 bits of c1 become first 4 of c2
            $c1 >>= 4; // c1 shifts 4 to the right
            $ret .= '&#' . (($c1 * 0x10000) + ($c2 * 0x100) + $c3) . ';'; // this is the fastest string concatenation
            $last = $i+1;       
        }
    }
    $str=$ret . substr($str, $last, $i); // append the last batch of regular characters
    return $str;
}

function decodeURIComponent($str){
//return utf2html(rawurldecode($str));
return $str;
}

function wraptext($konten,$panjang=30){
$data_konten = explode (' ',$konten);	
$TMPmsg = array ();
        for ($i=0; $i<count($data_konten); $i++){
                if (strlen($data_konten[$i]) >= $panjang) {
                    $TMPmsg[] = wordwrap($data_konten[$i], $panjang, " <br />", TRUE);
                }else {
                	$TMPmsg[] = $data_konten[$i];
            		}
        }	
return implode (" ",$TMPmsg);	
}

function stripWhitespace($str) {
		$r = preg_replace('/[\n\r\t]+/', '', $str);
		return preg_replace('/\s{2,}/', ' ', $r);
	}
function stripImages($str) {
		$str = preg_replace('/(<a[^>]*>)(<img[^>]+alt=")([^"]*)("[^>]*>)(<\/a>)/i', '$1$3$5<br />', $str);
		$str = preg_replace('/(<img[^>]+alt=")([^"]*)("[^>]*>)/i', '$2<br />', $str);
		$str = preg_replace('/<img[^>]*>/i', '', $str);
		return $str;
	}
function stripScripts($str) {
		return preg_replace('/(<link[^>]+rel="[^"]*stylesheet"[^>]*>|<img[^>]*>|style="[^"]*")|<script[^>]*>.*?<\/script>|<style[^>]*>.*?<\/style>|<!--.*?-->/i', '', $str);
	}

function cleartext($txt) {
        return preg_replace('/[!"\#\$%\'\(\)\?@\[\]\^`\{\}~\*\/]/', '', $txt);
}

function AuraCMSSEO($string) {
	$string = str_replace(' ', '-', $string);
	$string = preg_replace('/[^0-9a-zA-Z-_]/', '', $string); 
	$string = str_replace('-', ' ', $string);
	$string = preg_replace('/^\s+|\s+$/', '', $string);
	$string = preg_replace('/\s+/', ' ', $string);
	$string = str_replace(' ', '-', $string);
	return strtolower(cleartext($string));
}
function get_pages($id, $title,$folder)
{
    $sharing = AuraCMSSEO($title);
    $buatrewrite = $folder.'-'.$sharing.'.html';   
    return $buatrewrite;
}

function get_link($id, $title,$folder)
{
    $sharing = AuraCMSSEO($title);
    $buatrewrite = $folder.'-'.$sharing.'.html';   
    return $buatrewrite;
}

function get_link2($id, $kid, $title,$folder)
{
    $sharing = AuraCMSSEO($title);
    $buatrewrite = $folder.'-'.$id.'-'.$kid.'-'.$sharing.'.html';   
    return $buatrewrite;
}
function get_link3($id, $title,$judul)
{
    $sharing = AuraCMSSEO($title);
    $buatrewrite = $judul.'-'.$id.'-'.$sharing.'.html';     
    return $buatrewrite;
}
function get_link4($id,$kid,$judul)
{
    $buatrewrite = $judul.'-'.$id.'-'.$kid.'-'.$sharing.'.html';     
    return $buatrewrite;
}

function create_thumbnail ($source, $destination, $new_width = 100, $new_height = 'auto', $quality = 85)
{
    $im_src = imagecreatefromjpeg($source);
    if (!$im_src) return;
    $im_width = imagesX($im_src);
    $im_height = imagesY($im_src);
    if( !is_int($new_width) && is_int($new_height) )
    {
        // resize the image based on height
        $ratio = $im_height / $new_height;
        $new_width = floor($im_width / $ratio);
    }
    elseif( is_int($new_width) && !is_int($new_height) )
    {
        // resize the image based on the width
        $ratio = $im_width / $new_width;
        $new_height = floor($im_height / $ratio);
    }
    // create blank image
    $im = imagecreatetruecolor($new_width, $new_height);
    imagecopyresampled($im, $im_src, 0, 0, 0, 0, $new_width, $new_height, $im_width, $im_height);
    imagejpeg($im, $destination, $quality);
    imagedestroy($im);
    imagedestroy($im_src);
}


function rupiah_format($sString) {
	$iNegative = 0;
if(preg_match("/^-/",$sString)) {
		$iNegative	= 1;
		$sString	= preg_replace("|-|","",$sString);
	}

	$sString	= preg_replace("|,|","",$sString);
	$sFull		= split("[.]",$sString);
	$iCount		= count($sFull);
	if($iCount > 1) {
		$sFirst		= $sFull[0];
		$sSecond	= $sFull[1];
		$sNumCents	= strlen($sSecond);

		if($sNumCents == 2) {
		} else if($sNumCents < 2) {
			$sSecond = $sSecond . "0";
		} else if($sNumCents > 2) {
			$sTemp		= substr($sSecond,0,3);
			$Rounded	= round($sTemp,-1);
			$sSecond	= substr($Rounded,0,2);      
}  
	} else {
		$sFirst		= $sFull[0];    
		$sSecond	= "00";
	}
	$iLength = strlen($sFirst);
	if( $iLength <= 3 ) {
		$sString = $sFirst . "." . $sSecond; 
		if($iNegative == 1) {    
			$sString = "-" . $sString;
		}
		return $sString;
	} else {
		$iLoopCount		= intval( ( $iLength / 3 ) );
		$iSectionLength = -3;
		for( $i = 0; $i < $iLoopCount; $i++ ) {
			$aSection[$i] = substr( $sFirst, $iSectionLength, 3 );
			$iSectionLength = $iSectionLength - 3;
		}
		$iStub = ( $iLength % 3 );    
		if( $iStub != 0 ) {
			$aSection[$i] = substr( $sFirst, 0, $iStub );
		}

		$iDone = implode( ".", array_reverse($aSection));
		$iDone = $iDone . "," . $sSecond;

		if($iNegative == 1) {    
			$iDone = "-" . $iDone;
		}
		return  "Rp. ".$iDone;
	}
}


class paging_s { 
    function paging_s ($limit, $aksi='', $query='', $pageperstg=5) { 
      $this->rowperpage = $limit; 
      $this->pageperstg = $pageperstg; 
      // $this->sendiri = $GLOBALS['URLSITE'] . basename ($_SERVER['PHP_SELF'], '.php') . $aksi;
       $this->sendiri = $aksi;
       $this->query = $query;
    } 
    
    
    function getPaging($jumlah, $pg, $stg,$aksi=null, $query=null) { 
	    if (!isset ($pg,$stg)){
	  		$pg = 1;
	  		$stg = 1;
  		}
  		
  		if ($aksi) $this->sendiri = $aksi;
       if ($query) $this->query = $query;
  
     
      if ($this->rowperpage<$jumlah) { 
        $allpage = ceil($jumlah/$this->rowperpage); 
        $allstg  = ceil($allpage/$this->pageperstg); 
        $minpage = (($stg-1)*$this->pageperstg)+1; 
        $maxpage = $stg*$this->pageperstg;
        if ($maxpage>$allpage) $maxpage = $allpage; 
        if ($allpage>1) {
	         if (($pg-1) == 1){
		            $newoffset = 0;
		            
	            } else {
		           $newoffset = (($pg-2)*$this->rowperpage);
	            } 
          $rtn  = "<table cellpadding=2 cellspacing=0><tr align=center valign=middle><td class=\"smallbody\">"; 
          if ($stg>1) $rtn .= "<a class=\"nextstage\" href=\"".$this->sendiri."".($minpage-1)."-".($stg-1). "-". $newoffset ."$this->query\">&laquo;&laquo;&laquo;</a> | "; 
          if ($pg>1) { 
            if ($pg==$minpage) {
	            if (($pg-1) == 1){
		            $newoffset = 0;
		            
	            } else {
		           $newoffset = (($pg-2)*$this->rowperpage);
	            }
              $rtn .= "<a class=\"nextpage\" href=\"".$this->sendiri."".($pg-1)."-".($stg-1). "-".$newoffset."$this->query\">&laquo; Previous</a> | "; 
            } else { 
	            if (($pg-1) == 1){
		            $newoffset = 0;
		            
	            } else {
		           $newoffset = (($pg-2)*$this->rowperpage);
	            }
              $rtn .= "<a class=\"nextpage\" href=\"".$this->sendiri."".($pg-1)."-$stg-".$newoffset."$this->query\">&laquo; Previous</a> | "; 
            } 
          } 
          for ($i=$minpage;$i<=$maxpage;$i++) {
	          
            if ($i==$pg) { 
              $rtn .= "<b>$i</b> | "; 
            } else { 
	            if  ($i==1) {
		         $newoffset = 0;   
	          }else {
		          $newoffset = ($i-1)*$this->rowperpage;
	          }
              $rtn .= "<a href=\"".$this->sendiri."$i-$stg-$newoffset$this->query\" title='Page $i'>$i</a> | "; 
            } 
          } 
          if ($pg<=$maxpage) { 
            if ($pg==$maxpage && $stg<$allstg) { 
              $rtn .= " <a class=\"nextpage\" href=\"".$this->sendiri."".($pg+1)."-".($stg+1)."-".(($pg)*$this->rowperpage)."$this->query\">Next &raquo;</a> | "; 
            } elseif ($pg<$maxpage) { 
              $rtn .= " <a class=\"nextpage\" href=\"".$this->sendiri."".($pg+1)."-$stg-" .(($pg)*$this->rowperpage). "$this->query\">Next &raquo;</a> | "; 
            } 
          } 
          if ($stg<$allstg) {
	          $rtn .= "<a class=\"nextstage\" href=\"".$this->sendiri."".($maxpage+1)."-".($stg+1)."-".(($maxpage)*$this->rowperpage)."$this->query\"> &raquo;&raquo;&raquo;</a> | ";
      		} 
          $rtn = substr($rtn,0,strlen($rtn)-3); 
          $rtn .= "</td></tr></table>"; 
          return $rtn; 
        } 
      } 
    } 
  }

//stoping xss,union and clike injection
if(!function_exists('stripos')) {
	function stripos_clone($haystack, $needle, $offset=0) {
		$return = strpos(strtoupper($haystack), strtoupper($needle), $offset);
		if ($return === false) {
			return false;
		} else {
			return true;
		}
	}
} else {
	// But when this is PHP5, we use the original function
	function stripos_clone($haystack, $needle, $offset=0) {
		$return = stripos($haystack, $needle, $offset=0);
		if ($return === false) {
			return false;
		} else {
			return true;
		}
	}
} 


// Additional security (Union, CLike, XSS)
if(isset($_SERVER['QUERY_STRING']) && (!stripos_clone($_SERVER['QUERY_STRING'], "ad_click"))) {
	$queryString = $_SERVER['QUERY_STRING'];
    if (stripos_clone($queryString,'%20union%20') OR stripos_clone($queryString,'/*') OR stripos_clone($queryString,'*/union/*') OR stripos_clone($queryString,'c2nyaxb0') OR stripos_clone($queryString,'+union+') OR (stripos_clone($queryString,'cmd=') AND !stripos_clone($queryString,'&cmd')) OR (stripos_clone($queryString,'exec') AND !stripos_clone($queryString,'execu')) OR stripos_clone($queryString,'concat')) {
    	die('Illegal Operation');
    }
}
function cek_situs (){
global $publishwebsite,$koneksi_db;
if ($publishwebsite !='1'){
$query         = $koneksi_db->sql_query ("SELECT * FROM widget_uc WHERE id='$publishwebsite'");
$data          = $koneksi_db->sql_fetchrow ($query);
$uc=$data[2];
die("
<div align=center>
$uc
</div>");
		}
}

function forgot_login (){
global $UserName,$Expire,$koneksi_db;

$user          = cleantext($_POST['user']);
$email          = cleantext($_POST['email']);
$hint          = cleantext($_POST['hint']);
$hintjawab          = cleantext($_POST['hintjawab']);
$query         = $koneksi_db->sql_query ("SELECT * FROM useraura WHERE user='$user' and email='$email' and hint='$hint' and hintjawab='$hintjawab' AND tipe='aktif'");
$total         = $koneksi_db->sql_numrows($query);
$data          = $koneksi_db->sql_fetchrow ($query);

$koneksi_db->sql_freeresult ($query);
if ($total > 0 && $user == $data['user'] and $email == $data['email'] && $hint == $data['hint']&& $hintjawab == $data['hintjawab']){
$update = mysql_query("UPDATE `useraura` SET `last_ping` = NOW() WHERE `user` = '$user'");
$update = mysql_query("UPDATE `useraura` SET `is_online` = '1' WHERE `user` = '$user'");
//session_is_registered ('UserName') ;
$_SESSION['UserName']= $data['user'];
//session_is_registered ('LevelAkses') ;
$_SESSION['LevelAkses']= $data['level'];
//session_is_registered ('UserEmail') ;
$_SESSION['UserEmail']= $data['email'];
if($_SESSION['LevelAkses']=="Administrator"){
header ("location:admin.php");
exit;
}elseif($_SESSION['LevelAkses']=="User" or $_SESSION['LevelAkses']=="Editor"){
//header ("location:index.php");
header ("location:admin.php");
exit;
}
}
}
function hapuspetik($str) {
		$str = preg_replace('[\']', '', $str);
		$str = preg_replace('[\'\'/]', '', $str);
		return $str;
	}
function get_gravatar( $email, $s = 200, $d = 'wavatar', $r = 'g', $img = true, $atts = array() ) {
    $url = 'http://www.gravatar.com/avatar/';
    $url .= md5( strtolower( trim( $email ) ) );
    $url .= "?s=$s&d=$d&r=$r";
    if ( $img ) {
        $url = '<img src="' . $url . '"';
        foreach ( $atts as $key => $val )
            $url .= ' ' . $key . '="' . $val . '"';
        $url .= ' />';
    }else{
    $url = 'http://www.gravatar.com/avatar/';
    $url .= md5( strtolower( trim( $email ) ) );
	        $url = '<img src="' . $url . '"';
        $url .= ' />';
	}
    return $url;
}
function pisahtags($kalimat){
$katatags='';
$kata = explode(",",$kalimat);
for($i = 0; $i < count($kata); $i++)
{
$urltags=($kata[$i]);
$katatags.= "<a href='tags-$urltags.html' title='$kata[$i]'><span class='beli'>#$kata[$i]</span></a> ";
}
return $katatags;
}

////////////////////
function artikelterkait($id)
{
    // batas threshold 40%
    $threshold = 40;
    // jumlah maksimum artikel terkait yg ditampilkan 3 buah
    $maksArtikel = 3;

    // array yang nantinya diisi judul artikel terkait
    $listArtikel = Array();

    // membaca judul artikel dari ID tertentu (ID artikel acuan)
    // judul ini nanti akan dicek kemiripannya dengan artikel yang lain
    $query = "SELECT * FROM artikel WHERE id = '$id'";
    $hasil = mysql_query($query);
    $data  = mysql_fetch_array($hasil);
    $judul = $data['judul'];
    $tags = $data['tags'];
    // membaca semua data artikel selain ID artikel acuan
    $query2 = "SELECT * FROM artikel WHERE id <> '$id'";
    $hasil2 = mysql_query($query2);
    while ($data2 = mysql_fetch_array($hasil2))
    {
	    $judul2 = $data2['judul'];
    $tags2 = $data2['tags'];
        // cek similaritas judul artikel acuan dengan judul artikel lainnya
        similar_text($tags, $tags2, $percent);
        if ($percent >= $threshold)
        {
            // jika prosentase kemiripan judul di atas threshold
            if (count($listArtikel) <= $maksArtikel)
            {
               // jika jumlah artikel belum sampai batas maksimum, tambahkan ke dalam array
               $listArtikel[] = "<li><a href='artikel.php?id=".$data['id']."'>".$judul2."</a></li>";
            }
        }
    }	

    // jika array listartikel tidak kosong, tampilkan listnya
    // jika kosong, maka tampilkan 'tidak ada artikel terkait'
    if (count($listArtikel) > 0)
    {
        $artikelterkait .= "<ul>";
        for ($i=0; $i<=count($listArtikel)-1; $i++)
        {
            $artikelterkait .= $listArtikel[$i];
        }
        $artikelterkait .= "</ul>";
    }
    else $artikelterkait = "<p>Tidak ada artikel terkait</p>";
	return $artikelterkait;
}///////////////////

/***********************************************/
function getkelas($id){
$query = "SELECT * FROM kelas WHERE id = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$kelas = $data['kelas'];
return $kelas;
}
function getmapel($id){
$query = "SELECT * FROM mapel WHERE id = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$mapel = $data['mapel'];
if (!$mapel){
	$mapel = 'Semua';
	
}
return $mapel;
}
function getmapelkode($id){
$query = "SELECT * FROM mapel WHERE id = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$mapel = $data['kode'];
return $mapel;
}
function getnamaguru($user){
$query = "SELECT * FROM useraura where user = '$user'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$user = $data['user'];
$nama = $data['nama'];
return $nama;
}
function getnamaguruid($id){
$query = "SELECT * FROM useraura where UserId = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$nama = $data['nama'];
return $nama;
}
function getnamaguruangket($id){
$query = "SELECT * FROM angket_setting WHERE id = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$guru = $data['guru'];
$query = "SELECT * FROM useraura WHERE user = '$guru'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$nama = $data['nama'];
return $nama;
}
function getnamaguruujian($idujian){
$query = "SELECT * FROM ujian where id = '$idujian'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$guru = $data['guru'];
$query = "SELECT * FROM useraura where user = '$guru'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$user = $data['user'];
$nama = $data['nama'];
return $nama;
}
function getuserguru($id){
$query = "SELECT * FROM useraura WHERE UserId = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$user = $data['user'];
return $user;
}
function getnamasiswa($id){
$query = "SELECT * FROM useraura where user = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$user = $data['user'];
$nama = $data['nama'];
return $nama;
}
function getkelasisi($id){
$query = "SELECT * FROM kelas_isi WHERE siswa = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$kelas = $data['kelas'];
$query = "SELECT * FROM kelas WHERE id = '$kelas'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$kelas = $data['kelas'];
return $kelas;
}
function getkelasangket($id){
$query = "SELECT * FROM angket_setting WHERE id = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$kelas = $data['kelas'];
$query = "SELECT * FROM kelas WHERE id = '$kelas'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$kelas = $data['kelas'];
return $kelas;
}
function getkelasid($user){
$query = "SELECT * FROM kelas_isi WHERE siswa = '$user'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$kelas = $data['kelas'];
return $kelas;
}

function getnourut($id){
$query = "SELECT * FROM kelas_isi WHERE siswa = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$nourut = $data['nourut'];
return $nourut;
}

function duakoma ($nilai){
$nilai = round($nilai, 2);
return $nilai;
}
function lihatkelas($kelas){
$query = "SELECT kelas FROM kelas where id in($kelas)";
$hasil = mysql_query($query);
while($data=mysql_fetch_array($hasil)){
$datakelas .= $data["kelas"].',';
}
return $datakelas;
}
function tglsort($tgl){
/*Contoh Format : 2007-08-15 01:27:45*/
if($tgl=='0000-00-00'){
return "";	
exit;
}
$tanggal = strtotime($tgl);
$bln_array = array (
			'01'=>'Januari',
			'02'=>'Februari',
			'03'=>'Maret',
			'04'=>'April',
			'05'=>'Mei',
			'06'=>'Juni',
			'07'=>'Juli',
			'08'=>'Agustus',
			'09'=>'September',
			'10'=>'Oktober',
			'11'=>'November',
			'12'=>'Desember'
			);
$hari_arr = Array ('0'=>'Minggu,',
				   '1'=>'Senin,',
				   '2'=>'Selasa,',
					'3'=>'Rabu,',
					'4'=>'Kamis,',
					'5'=>'Jum`at,',
					'6'=>'Sabtu,'
				   );
$hari = @$hari_arr[date('w',$tanggal)];
$tggl = date('d',$tanggal);
$bln = date('m',$tanggal);
$thn = date('y',$tanggal);
return "$tggl/$bln/$thn";			
}
function getjumlahsoal($id){
$query = "SELECT * FROM soal WHERE ujian = '$id'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function getjumlahjawaban($id){
$query = "SELECT tipejawaban FROM ujian where id in($id)";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$tipejawaban .= $data["tipejawaban"];
return $tipejawaban;
}
function cekjmlsoalujian ($id){
$query = "SELECT * FROM ujian WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$jumlahsoal .= $data["jumlahsoal"];
return $jumlahsoal;
}
function cekjumlahsoal ($id){
$query = "SELECT * FROM soal WHERE ujian = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlujian ($guru){
$query = "SELECT * FROM ujian WHERE guru = '$guru'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlujianganjil ($idmapel,$tahunajarandefault,$semesterdefault,$tipeujiandefault){
$query = "SELECT * FROM ujian WHERE idmapel = '$idmapel' and tipeujian > 1 and cekgenap='1' and tahunajaran='$tahunajarandefault'and tipeujian='$tipeujiandefault' and semester='$semesterdefault'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlujiangenap ($idmapel,$tahunajarandefault,$semesterdefault,$tipeujiandefault){
$query = "SELECT * FROM ujian WHERE idmapel = '$idmapel' and tipeujian > 1  and cekgenap='2'and tahunajaran='$tahunajarandefault'and tipeujian='$tipeujiandefault'and semester='$semesterdefault'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlujianall ($idmapel,$tahunajarandefault,$semesterdefault,$tipeujiandefault){
$query = "SELECT * FROM ujian WHERE idmapel = '$idmapel' and tipeujian > 1 and tahunajaran='$tahunajarandefault'and tipeujian='$tipeujiandefault' and semester='$semesterdefault'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmllatihan2 ($idmapel){
$query = "SELECT * FROM ujian WHERE idmapel = '$idmapel' and tipeujian='1'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlmateri ($guru){
$query = "SELECT * FROM materi WHERE guru = '$guru'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlmateri2 ($idkursus){
$query = "SELECT * FROM materi WHERE idkursus = '$idkursus'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function cekjmlpertemuan2 ($idkursus){
$query = "SELECT * FROM pertemuan WHERE idkursus = '$idkursus'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function getkelasid_ks ($id){
$query = "SELECT * FROM kursus_setting WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$kelas .= $data["kelas"];
return $kelas;
}
function geticon ($id){
$query = "SELECT * FROM mapel_icon WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$icon .= $data["icon"];
return $icon;
}
function geticonmapel ($id){
$query = "SELECT * FROM mapel WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$icon .= $data["icon"];
return $icon;
}
 function formatSizeUnits($bytes)
    {
        if ($bytes >= 1073741824)
        {
            $bytes = number_format($bytes / 1073741824, 2) . ' GB';
        }
        elseif ($bytes >= 1048576)
        {
            $bytes = number_format($bytes / 1048576, 2) . ' MB';
        }
        elseif ($bytes >= 1024)
        {
            $bytes = number_format($bytes / 1024, 2) . ' KB';
        }
        elseif ($bytes > 1)
        {
            $bytes = $bytes . ' bytes';
        }
        elseif ($bytes == 1)
        {
            $bytes = $bytes . ' byte';
        }
        else
        {
            $bytes = '0 bytes';
        }

        return $bytes;
}
function gethariterlambat ($tglAwal,$tglAkhir){
 // memecah string tanggal awal untuk mendapatkan
    // tanggal, bulan, tahun
    $pecah1 = explode("-", $tglAwal);
    $date1 = $pecah1[2];
    $month1 = $pecah1[1];
    $year1 = $pecah1[0];

    // memecah string tanggal akhir untuk mendapatkan
    // tanggal, bulan, tahun
    $pecah2 = explode("-", $tglAkhir);
    $date2 = $pecah2[2];
    $month2 = $pecah2[1];
    $year2 =  $pecah2[0];
	$jd1 = GregorianToJD($month1, $date1, $year1);
    $jd2 = GregorianToJD($month2, $date2, $year2);

    $selisih = $jd2 - $jd1;
	if($selisih<=0){
	$selisih=0;
	}
	return $selisih;
}

function getnilaiujian ($tahunajaran,$user,$guru){
$query = "SELECT * FROM ujiannilai WHERE tahunajaran = '$tahunajaran' and user='$user'and guru='$guru' order by id desc";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$nilai = $data["nilai"];
if($nilai==''){
$nilai='0';	
}
return $nilai;
}
function gettanggalujian ($idmapel,$user){
$query = "SELECT * FROM ujiannilai WHERE mapel = '$idmapel' and user='$user' order by id desc";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$tgl .= $data["tgl"];
return $tgl;
}
function getjamujian ($idmapel,$user){
$query = "SELECT * FROM ujiannilai WHERE mapel = '$idmapel' and user='$user' order by id desc";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$jam .= $data["jam"];
return $jam;
}
function getnamaujian ($idujian){
$query = "SELECT * FROM ujian WHERE id = '$idujian'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$judul .= $data["judul"];
return $judul;
}
function getpertemuan ($idpertemuan){
$query = "SELECT * FROM pertemuan WHERE id = '$idpertemuan'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$pertemuan .= $data["pertemuan"];
return $pertemuan;
}
function getmapeluser($username){
$query = "SELECT mapel FROM useraura WHERE user = '$username'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$mapel = $data['mapel'];
return $mapel;
}
function removep($text){
$text=str_ireplace('<p>','',$text);
$text=str_ireplace('</p>','',$text); 
return	$text;
	
}
function getpetunjuk(){
$query = "SELECT petunjuk FROM ujiansetting limit 1";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$petunjuk = $data['petunjuk'];
return $petunjuk;
}
function getwaktu(){
$query = "SELECT waktu FROM ujiansetting limit 1";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$waktu = $data['waktu'];
return $waktu;
}
function getwaktuujian($idujian){
$query = "SELECT waktu FROM ujian where id='$idujian' limit 1";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$waktu = $data['waktu'];
return $waktu;
}
function konversi_detik($detik) {
$dtk= $detik %60;
$mnt= floor(($detik %3600) /60);
$jam= floor(($detik %86400) /3600);
return $jam.' Jam, '.$mnt.' Menit, '.$dtk.' Detik'; }

function tambahwaktu($detik){
//$date = date("H:i:s");
$waktusekarang=time();
$waktuujian=$detik;
$waktuselesai=$waktusekarang+$waktuujian;
$waktuselesai = date("H:i:s",$waktuselesai);
return $waktuselesai;
}
function getjumlahnilaihistory($idmapel,$user){
$query = "SELECT id FROM ujiannilai where mapel='$idmapel' and user='$user'";
$hasil = mysql_query($query);
$total  = mysql_num_rows($hasil);
return $total;
}
function gettipeujian ($id){
$query = "SELECT * FROM tipeujian WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$nama .= $data["nama"];
return $nama;
}
function gettipeujiankode ($id){
$query = "SELECT * FROM tipeujian WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$nama .= $data["kode"];
return $nama;
}
function getsemester ($id){
$query = "SELECT * FROM semester WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$nama .= $data["nama"];
return $nama;
}
function gettahunajaran ($id){
$query = "SELECT * FROM tahunajaran WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$keterangan .= $data["keterangan"];
return $keterangan;
}
function getkelaskat ($id){
$query = "SELECT * FROM kelaskat WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$kelaskat .= $data["kelaskat"];
return $kelaskat;
}
function getsession ($id){
$query = "SELECT * FROM session WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$session .= $data["session"];
return $session;
}
function getsessionkelas ($kelas){
$query = "SELECT * FROM session_isi WHERE kelas = '$kelas'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$session .= getsession($data["session"]);
return $session;
}
function getfieldtable($field,$table,$id){
$query = "SELECT $field as nama FROM $table WHERE id = '$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$nama .= $data["nama"];
return $nama;
}
function cekgenap($value)
{
    $hasil = $value % 2; // rumus mencari angka genap atau ganjil

    // jika hasil dari rumusnya genap
    if($hasil == 0)
        $angka = '2'; 

    // jika hasil dari rumusnya ganjil
    else
    {
        $angka = '1';
    }
    return $angka;
}
function getgenap($angka){
if($angka>1){
$nama="Genap";	
}else{
$nama="Ganjil";	
}	
return $nama;	
}
function generatejudul($tipeujian,$matpel) {
$kode = $tipeujian.$matpel;
$query="select MAX(RIGHT(judul,4)) as kd_max from ujian  WHERE judul LIKE '%$kode%'";
$hasil = mysql_query($query); 
if($hasil>0){
$data=mysql_fetch_array($hasil);
$awal=((int)$data[kd_max])+1;
$kd = sprintf("%04s", $awal);
}else{
$kd="0001";
}
$kodeauto=$kode.$kd;
return $kodeauto;
}
function getkelaskatujian ($id){
$query = "SELECT * FROM kelaskat WHERE id in($id)";
$hasil = mysql_query($query);
while($data=mysql_fetch_array($hasil)){
$kelaskat .= '<span class="btn btn-primary">'.$data["kelaskat"].'</span>&nbsp;';
}
return $kelaskat;
}
function getkelaskatujian2 ($id){
$query = "SELECT * FROM kelaskat WHERE id in($id)";
$hasil = mysql_query($query);
while($data=mysql_fetch_array($hasil)){
$kelaskat .= ''.$data["kelaskat"].', ';
}
$kelaskat = substr_replace($kelaskat,"", -2, 1);
return $kelaskat;
}
function getjumlahujianguru ($iduser,$tahunajarandefault,$semesterdefault,$tipeujiandefault){
	global $UserName,$Expire,$koneksi_db;
$query         = $koneksi_db->sql_query ("SELECT * FROM ujianguru WHERE iduser='$iduser' AND tahunajaran='$tahunajarandefault' AND semester='$semesterdefault' AND tipeujian='$tipeujiandefault'");
$total         = $koneksi_db->sql_numrows($query);
return $total;
}
function getjumlahujianhari ($idhari,$tahunajarandefault,$semesterdefault,$tipeujiandefault){
	global $UserName,$Expire,$koneksi_db;
$query         = $koneksi_db->sql_query ("SELECT * FROM ujianhari WHERE idhari='$idhari' AND tahunajaran='$tahunajarandefault' AND semester='$semesterdefault' AND tipeujian='$tipeujiandefault'");
$total         = $koneksi_db->sql_numrows($query);
return $total;
}
function getjumlahujianharisusulan ($idhari,$tahunajarandefault,$semesterdefault,$tipeujiandefault){
	global $UserName,$Expire,$koneksi_db;
$query         = $koneksi_db->sql_query ("SELECT * FROM ujianharisusulan WHERE idhari='$idhari' AND tahunajaran='$tahunajarandefault' AND semester='$semesterdefault' AND tipeujian='$tipeujiandefault'");
$total         = $koneksi_db->sql_numrows($query);
return $total;
}
function getiduserdariusername ($username){
$query = "SELECT * FROM useraura WHERE user ='$username'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$iduser =$data["0"];
return $iduser;
}
function getidmapelguru ($id){
$query = "SELECT * FROM ujianguru WHERE iduser='$id'";
$hasil = mysql_query($query);
while($data=mysql_fetch_array($hasil)){
$idmapel .= ''.$data["idmapel"].',';
}
$idmapel = substr_replace($idmapel,"", -1, 1);
return $idmapel;
}
function getusersudahtest ($user,$idujian){
global $koneksi_db;
$query         = $koneksi_db->sql_query ("SELECT * FROM ujiannilai WHERE user='$user' AND idujian='$idujian'");
$total         = $koneksi_db->sql_numrows($query);
return $total;
}
function tanggalindoshort($tgl){
/*Contoh Format : 2007-08-15 01:27:45*/
if(!$tgl){
$tanggal='';
}else{
$tanggal = strtotime($tgl);
$tggl = date('d',$tanggal);
$bln = date('m',$tanggal);
$thn = date('Y',$tanggal);
return "$tggl/$bln/$thn";			
}
}

function tanggalindolong($tgl){
/*Contoh Format : 2007-08-15 01:27:45*/
$bln_array = array (
			'01'=>'Januari',
			'02'=>'Februari',
			'03'=>'Maret',
			'04'=>'April',
			'05'=>'Mei',
			'06'=>'Juni',
			'07'=>'Juli',
			'08'=>'Agustus',
			'09'=>'September',
			'10'=>'Oktober',
			'11'=>'November',
			'12'=>'Desember'
			);
if(!$tgl){
$tanggal='';
}else{
$tanggal = strtotime($tgl);
$tggl = date('j',$tanggal);
$bln = @$bln_array[date('m',$tanggal)];
$thn = date('Y',$tanggal);
return "$tggl $bln $thn";			
}
}
function tanggalindo($tanggal){
$format = date('d-m-Y', strtotime($tanggal));	
return $format;	
}
function getnamahari($tgl){
	$tanggal = strtotime($tgl);
$hari_arr = Array ('0'=>'Minggu',
				   '1'=>'Senin',
				   '2'=>'Selasa',
					'3'=>'Rabu',
					'4'=>'Kamis',
					'5'=>'Jum`at',
					'6'=>'Sabtu'
				   );
$hari = @$hari_arr[date('w',$tanggal)];
return $hari;
}

function getdataujianharijam ($id){
$query = "SELECT * FROM ujianharijam WHERE id ='$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
return $data;
}
function getdataujianharijamsusulan ($id){
$query = "SELECT * FROM ujianharijamsusulan WHERE id ='$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
return $data;
}
function getdataujian ($id){
$query = "SELECT * FROM ujian WHERE id ='$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
return $data;
}
function getjmlujiandarimapel ($idmapel){
global $koneksi_db;
$query         = $koneksi_db->sql_query ("SELECT * FROM ujiannilai WHERE user='$user' AND idujian='$idujian'");
$total         = $koneksi_db->sql_numrows($query);
return $total;
}
function getdatasiswa ($nis){
$query = "SELECT * FROM ujian WHERE id ='$id'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
return $data;
}
function getdatakelassiswa ($nis,$tahunajarandefault){
$query = "SELECT ki.kelaskat,ki.kelas,ki.absen,ki.cekgenap FROM kelas_isi ki,kelas k WHERE ki.siswa ='$nis' and ki.kelas=k.id and k.tahunajaran='$tahunajarandefault'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
return $data;
}
function getdataujianharijumlah ($tgl,$cekgenap,$kelaskat){
$query = "SELECT count(id)as jumlah FROM ujianhari WHERE tgl ='$tgl' and cekgenap='$cekgenap' and LOCATE(CONCAT(',', $kelaskat ,','),CONCAT(',',kelaskat,','))";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$jumlah =$data['jumlah'];
return $jumlah;
}
function getdataujianhari ($tgl,$cekgenap,$kelaskat){
$query = "SELECT * FROM ujianhari WHERE tgl ='$tgl' and cekgenap='$cekgenap' and LOCATE(CONCAT(',', $kelaskat ,','),CONCAT(',',kelaskat,','))";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$idujian =$data['id'];
return $data;
}
function getdataujianharisusulan ($tgl,$cekgenap,$kelaskat){
$query = "SELECT * FROM ujianharisusulan WHERE tgl ='$tgl' and cekgenap='$cekgenap' and LOCATE(CONCAT(',', $kelaskat ,','),CONCAT(',',kelaskat,','))";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$idujian =$data['id'];
return $data;
}
/************** BACKUP & RESTORE DATABASE ***************/
function backup($nama_file,$tables = '')
{
                global $return, $tables, $back_dir, $database ;

                if($tables == '')
                {
                    $tables = array();
                    $result = @mysql_list_tables($database);
                    while($row = @mysql_fetch_row($result))
                    {
                        $tables[] = $row[0];
                    }
                }else{
                    $tables = is_array($tables) ? $tables : explode(',',$tables);
                }

                $return	= '';

                foreach($tables as $table)
                {
                    $result	 = @mysql_query('SELECT * FROM '.$table);
                    $num_fields = @mysql_num_fields($result);

                    //menyisipkan query drop table untuk nanti hapus table yang lama
                    $return	.= "DROP TABLE IF EXISTS ".$table.";";
                    $row2	 = @mysql_fetch_row(mysql_query('SHOW CREATE TABLE  '.$table));
                    $return	.= "\n\n".$row2[1].";\n\n";

                    for ($i = 0; $i < $num_fields; $i++)
                    {
                        while($row = @mysql_fetch_row($result))
                        {
                            $return.= 'INSERT INTO '.$table.' VALUES(';

                            for($j=0; $j<$num_fields; $j++)
                            {
                                $row[$j] = @addslashes($row[$j]);
                                $row[$j] = @ereg_replace("\n","\\n",$row[$j]);
                                if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
                                if ($j<($num_fields-1)) { $return.= ','; }
                            }
                            $return.= ");\n";
                        }
                    }
                    $return.="\n\n\n";
                }

                $nama_file;

                $handle = fopen($back_dir.$nama_file,'w+');
                fwrite($handle, $return);
                fclose($handle);
            }
 
 function restore($file) 
 {
                global $rest_dir;

                $nama_file	= $file['name'];
                $ukrn_file	= $file['size'];
                $tmp_file	= $file['tmp_name'];

                if ($nama_file == "")
                {
                    echo "Fatal Error";
                }
                else
                {
                    $alamatfile	= $rest_dir.$nama_file;
                    $templine	= array();

                    if (move_uploaded_file($tmp_file , $alamatfile))
                    {

                        $templine	= '';
                        $lines		= file($alamatfile);

                        foreach ($lines as $line)
                        {
                            if (substr($line, 0, 2) == '--' || $line == '')
                                continue;

                            $templine .= $line;

                            if (substr(trim($line), -1, 1) == ';')
                            {
                                mysql_query($templine) or print('Query gagal \'<strong>' . $templine . '\': ' . mysql_error() . '<br /><br />');

                                $templine = '';
                            }
                        }
                       echo "<center>Berhasil Restore Database, silahkan di cek. $nama_file</center>";
unlink($nama_file);
                    }else{
                       echo "Proses upload gagal, kode error = " . $file['error'];
                    }
                }

            }
/************** BACKUP & RESTORE DATABASE ***************/
function getpassworduser ($user){
$query = "SELECT * FROM useraura WHERE user ='$user'";
$hasil = mysql_query($query);
$data=mysql_fetch_array($hasil);
$password2 = $data['password2'];
return $password2;
}
function getlistening($angka){
if($angka>1){
$nama="Ya";	
}else{
$nama="Tidak";	
}	
return $nama;	
}
function geticonlistening($angka){
if($angka>1){
$nama='<i class="fa fa-music">&nbsp;</i>';	
}else{
$nama='';	
}	
return $nama;	
}
function getmapelguru($guru){
$query = "SELECT * FROM mapel WHERE guru = '$guru'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$mapel = $data['mapel'];
return $mapel;
}
function getfieldtabel($field,$tabel,$primarykey,$replid){
$query = "SELECT $field FROM $tabel WHERE $primarykey = $replid";
    $hasil = mysql_query($query);
    $data  = mysql_fetch_array($hasil);
  $nama = $data["$field"];

  
return $nama;
}
function getstatus($id){
$query = "SELECT * FROM jadwalstatus WHERE id = '$id'";
$hasil = mysql_query($query);
$data  = mysql_fetch_array($hasil);
$nama = $data['nama'];
return $nama;
}
function beda_waktu($date1, $date2, $format = false) 
{
	$diff = date_diff( date_create($date1), date_create($date2) );
	if ($format)
		return $diff->format($format);
	
	return array('y' => $diff->y,
				'm' => $diff->m,
				'd' => $diff->d,
				'h' => $diff->h,
				'i' => $diff->i,
				's' => $diff->s
			);
}
?>