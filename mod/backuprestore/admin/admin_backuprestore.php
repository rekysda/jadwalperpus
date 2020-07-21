<?php
// definisikan koneksi ke database
global $mysql_user,$mysql_password,$mysql_database,$mysql_host;
$server = "$mysql_host";
$username = "$mysql_user";
$password = "$mysql_password";
$database = "$mysql_database";
$back_dir="./backupdata/";
// Koneksi dan memilih database di server
mysql_connect($server,$username,$password) or die("Koneksi gagal");
mysql_select_db($database) or die("Database tidak bisa dibuka");
?>

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
$JS_SCRIPT.= <<<js
            <script>
                function pastikan(text){
                    confirm('Apakah Anda yakin akan '+text+'?')
                }
            </script>
js;
$script_include[] = $JS_SCRIPT;

$admin .='<section class="content-header">
          <h1>
            Database
            <small>Mengatur Backup dan Restore Database</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="./admin.php?pilih=backuprestore&mod=yes"><i class="fa fa-dashboard"></i>Home</a></li>
			<li>Database</li>
            <li class="active">Backup & Restore</li>
          </ol>
        </section>';			
$admin .='
<section class="content-header">
<a class="btn btn-default btn-flat" href="./admin.php?pilih=backuprestore&mod=yes" >
<i class="fa fa-database">&nbsp;</i> Backup & Restore <span class="badge bg-green"></span></a>
<a class="btn btn-default btn-flat" href="./admin.php?pilih=backuprestore&mod=yes&aksi=filemanager" >
<i class="fa fa-database">&nbsp;</i> File Manager <span class="badge bg-green"></span></a>
</section>';
$admin .='
<section class="content">';		
if($_GET['aksi']==""){
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">Backup & Restore Database</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<div class="container">';
$file	  =	$database.'_'.date("dmY").'_'.date("His").'.sql';
 //membuat nama file
$admin .= '<div>
                <div class="tabbable">
                    <ul class="nav nav-tabs" id="myTab">
                        <li class="active">
                            <a data-toggle="tab" href="#backup">
                                <i class="green ace-icon fa  fa-cloud-download bigger-120"></i>
                                Backup
                            </a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#restore">
                                <i class="blue ace-icon fa  fa-cloud-upload bigger-120"></i>
                                Restore
                            </a>
                        </li>

                    </ul>

                    <div class="tab-content">
                        <div id="backup" class="tab-pane fade in active">
                            <form action="" method="post" name="postform" enctype="multipart/form-data" >
                                <p>
                                    <strong>Backup</strong> semua data yang ada didalam database &quot;<strong>'.$database.'</strong>&quot;.</em>
                                </p>
                                <div class="asd">
                                    <label for="backup">Backup database</label>
                                    <button id="loading-btn" type="submit" class="btn btn-success" name="backup" onClick="return pastikan("Backup database")">Proses Backup</button>
                                </div>

                            </form>
                        </div>

                        <div id="restore" class="tab-pane fade">
                            <form action="" method="post" name="postform" enctype="multipart/form-data" >
                                <p>
                                    <strong>Restore</strong> semua data yang ada didalam database &quot;<strong>'.$database.'</strong>&quot;.</em>
                                </p>
                                <div class="asd">
                                    <label for="backup">File Backup Database (*.sql)</label>
                                    <input type="file" name="datafile" size="20" class="filestyle" data-buttonName="btn-primary"/><br>
                                    <button type="submit" class="btn btn-primary" name="restore" onClick="return pastikan("Backup database")" data-loading-text="Loading...">Proses Restore</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div><!-- /.col -->';




               //Download file backup ============================================
                if(isset($_GET['nama_file']))
                {
                    $file = $back_dir.$_GET['nama_file'];

                    if (file_exists($file))
                    {
                        header('Content-Description: File Transfer');
                        header('Content-Type: application/octet-stream');
                        header('Content-Disposition: attachment; filename='.basename($file));
                        header('Content-Transfer-Encoding: binary');
                        header('Expires: 0');
                        header('Cache-Control: private');
                        header('Pragma: private');
                        header('Content-Length: ' . filesize($file));
                        ob_clean();
                        flush();
                        readfile($file);
                        exit;

                    }
                    else
                    {
$admin .= "file {$_GET['nama_file']} sudah tidak ada.";
                    }

                }

                //Backup database =================================================
                if(isset($_POST['backup']))
                {
                    backup($file);
                   
					$admin .= 'Backup database telah selesai <a style="cursor:pointer" href="'.$back_dir.$file.'" title="Download">Download file database ('.$file.')</a>';

                    $admin .= "<pre>";
                    $admin .= "$return";
                    $admin .= "</pre>";
                }
                else
                {
                    unset($_POST['backup']);
                }

                //Restore database ================================================
                if(isset($_POST['restore']))
                {
                    restore($_FILES['datafile']);

                    $admin .= "<pre>";
                    $admin .= "$lines";
                    $admin .= "</pre>";
					
                }
                else
                {
                    unset($_POST['restore']);
                }



$admin .= '</div>';

$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
}

if($_GET['aksi']=="filemanager"){
$rep=opendir('./backupdata/');
$admin .= '<div class="box">
                <div class="box-header">
                  <h3 class="box-title">File Manager</h3>
                </div><!-- /.box-header -->
                <div class="box-body">';
$admin .= '<div class="container">';
$admin .= '<table id="example1" class="table  table-hover">
<thead><tr>
<th>No</th>
<th>Nama File</th>
<th>Aksi</th>
</tr></thead><tbody>';
$no=1;
while ($file = readdir($rep)) {
if($file != '..' && $file !='.' && $file !=''&& $file !='Thumbs.db'){
$admin .='<tr>
<td><b>'.$no.'</b></td>
<td>'.$file.'</td>
<td><a href="?pilih=backuprestore&amp;mod=yes&amp;aksi=del&amp;id='.$file.'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a>&nbsp;
<a href="./backupdata/'.$file.'"><span class="btn btn-success">Download</span></a>
</td>
</tr>';
$no++;
			continue;
			
		}else {
						continue;
		}
}
$admin .= '</tbody></table>';


$admin .= '</div><!-- /.box-body -->
</div><!-- /.box -->';
}

if($_GET['aksi']== 'del'){    
	$id     = ($_GET['id']); 
	unlink("./backupdata/$id");
	if($hasil){    
		$admin.='<div class="alert alert-success fade in">File berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=backuprestore&mod=yes&aksi=filemanager" />';    
	}
}

$admin .='</section>';
}
echo $admin;

?>