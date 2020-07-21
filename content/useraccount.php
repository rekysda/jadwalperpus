<?php
if (cek_login ()){
if (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Siswa"){		
$username=$_SESSION['UserName'];
$hasil =  $koneksi_db->sql_query( "SELECT * FROM useraura WHERE user='$username'" );
$data = $koneksi_db->sql_fetchrow($hasil);
	$id=$data[0];
	$user=$data['user'];
	$nama=$data['nama'];
	$start=date("d-m-Y",$data['start']);
	$foto = '<img src="images/logo.png" class="img-circle"/>';
	echo '
 <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="images/logo.png" width="60px"height="60px" class="user-image" alt="User Image" />
                  <span class="hidden-xs">'.$nama.'</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    '.$foto.'
                    <p>'.$nama.'
                      <small>User Login :  '.$username.'</small>
                    </p>
                  </li>';
	echo '
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-right">
                      <a href="./admin.php?pilih=logout&mod=yes" class="btn btn-default btn-flat">Log out</a>
                    </div>
                  </li>
                </ul>
              </li>';
}elseif (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Administrator"){		
$username=$_SESSION['UserName'];
$hasil =  $koneksi_db->sql_query( "SELECT * FROM useraura WHERE user='$username'" );
$data = $koneksi_db->sql_fetchrow($hasil);
	$id=$data[0];
	$user=$data['user'];
	$nama=$data['nama'];
	$start=date("d-m-Y",$data['start']);
	$foto = '<img src="images/logo.png" class="img-circle"/>';
	echo '
 <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="images/logo.png" width="60px"height="60px" class="user-image" alt="User Image" />
                  <span class="hidden-xs">'.$username.'</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    '.$foto.'
                    <p>
                      '.$username.' - '.$nama.'
                    </p>
                  </li>';
	echo '
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="./admin.php?pilih=ubahpassword&mod=yes" class="btn btn-default btn-flat">Ubah Password</a>
                    </div>
                    <div class="pull-right">
                      <a href="./admin.php?pilih=logout&mod=yes" class="btn btn-default btn-flat">Log out</a>
                    </div>
                  </li>
                </ul>
              </li>';
			  
}elseif (isset( $_SESSION['LevelAkses'] ) &&  $_SESSION['LevelAkses']=="Guru"){		
$username=$_SESSION['UserName'];
$hasil =  $koneksi_db->sql_query( "SELECT * FROM useraura WHERE user='$username'" );
$data = $koneksi_db->sql_fetchrow($hasil);
	$id=$data[0];
	$user=$data['user'];
	$nama=$data['nama'];
	$start=date("d-m-Y",$data['start']);
	$foto = '<img src="images/logo.png" class="img-circle"/>';
	echo '
 <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="images/logo.png" width="60px"height="60px" class="user-image" alt="User Image" />
                  <span class="hidden-xs">'.$username.'</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    '.$foto.'
                    <p>
                      '.$nama.'
                      <small>User Login :  '.$username.'</small>
                    </p>
                  </li>';
	echo '
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-right">
                      <a href="./admin.php?pilih=logout&mod=yes" class="btn btn-default btn-flat">Log out</a>
                    </div>
                  </li>
                </ul>
              </li>';
			  
			  }			  
}
?>