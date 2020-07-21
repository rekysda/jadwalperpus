<?php

require_once("mysqlminang.php");
require_once("../includes/config.php");
$p=new Mysqlminang("$mysql_database","localhost","root","");
//$lokasi = $_GET['lokasi'];

$sql="Select * from jadwalujian where status ='2'";
$data=array();
foreach($p->GetAllRows($sql) as $row)
{
	$data[]=array(
				'title:'=>$row->keterangan,
				'start:'=>$row->tgl1,
				'end:'=>$row->tgl2
				);
}
	echo json_encode($data);
?>