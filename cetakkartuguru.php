<?php

include 'includes/config.php';
include 'includes/mysql.php';
include 'includes/configsitus.php';
global $koneksi_db,$url_situs;
echo "<html><head><title>Cetak Kartu Guru</title>";
echo'<link rel="shortcut icon" href="favicon.ico">';
echo '<style type="text/css">
   table { page-break-inside:auto; 
    font-size: 0.8em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
   }
   tr    { page-break-inside:avoid; page-break-after:auto }
	table {
    border-collapse: collapse;}
	th,td {
    padding: 5px;
}
.border{
	border: 1px solid black;
}
.borderaja{
	border: 0.25px solid black;
}
.border td{
	border: 1px solid black;
}
#boxmodel {
                border: 1px solid black;

                margin: 5px;
                padding: 5px;
                width: 200px;
				float:left;
				height:80px;
            }
body {
	margin		: 0;
	padding		: 0;
    font-size: 0.75em; /* 14px/16=0.875em */
font-family: "Times New Roman", Times, serif;
    margin			: 2px 0 5px 0;
}
</style>';
echo "</head><body>";

/*
echo'<table border="0" cellpadding="0" cellspacing="0" width="100%">	<tr>		<td width="20%" align="center"><img src="images/logo.png" height="70" /></td><td valign="top" align="left"><font size="5"><strong>SMAK Frateran Surabaya</strong></font><br />				<strong>Jalan kepanjen No.8 Surabaya<br>Ph. (031) 3524901.&nbsp;&nbsp;			<br>				Website: http://frateran.sch.id&nbsp;&nbsp;				Email: smak@frateran.sch.id			</strong>			</td>		</tr>		<tr>			<td colspan="2"><hr width="100%" /></td>		</tr>		</table>	<br />	
<center>
  <font size="4"><strong>CETAK KARTU UJIAN SISWA</strong></font><br />
 </center><br /><br />
<table>
';
*/
$namakelas = getkelas($data['kelas']);
echo '<div align="center"><font size="4"><strong>CETAK KARTU GURU</strong></font></div>';
$hasil = mysql_query( "SELECT * FROM useraura where level = 'Guru' order by UserId asc" );
while ($data = mysql_fetch_array($hasil)) {
$user = $data['user'];
$nama = ($data['nama']);
$password2 = ($data['password2']);
echo "
<div id='boxmodel'>
$nama<br>
USER&nbsp;&nbsp;: $user<br>
PASS&nbsp;&nbsp;: $password2<br>
Akses : http://jadwalujian.frateran.sch.id<br>
</div>";
}
/****************************/
echo "</body</html>";


echo "<script language=javascript>
window.print();
</script>";


?>
