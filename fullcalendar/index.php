<head>
<title>FULL CALENDAR</title>
<link rel="shortcut icon" href="../favicon.ico">
<link href='./fullcalendar-3.7.0/fullcalendar.min.css' rel='stylesheet' />
<link href='./fullcalendar-3.7.0/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='./fullcalendar-3.7.0/lib/moment.min.js'></script>
<script src='./fullcalendar-3.7.0/lib/jquery.min.js'></script>
<script src='./fullcalendar-3.7.0/fullcalendar.min.js'></script>
<script src='./fullcalendar-3.7.0/locale-all.js'></script>

<link rel="stylesheet" href="../includes/bootstrap/css/bootstrap.min.css" type="text/css">

<?php
include '../includes/session.php';
function tanggal_sekarang($time=FALSE)
{
	date_default_timezone_set('Asia/Jakarta');
	$str_format='';
	if($time==FALSE)
	{
		$str_format= date("Y-m-d");
	}else{
		$str_format= date("Y-m-d");
	}
	return $str_format;
}
?>

<script>

	$(document).ready(function() {
		var initialLocaleCode = 'id';
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'listDay,listMonth,month'
			},

			// customize the button names,
			// otherwise they'd all just say "list"
			views: {
				listDay: { buttonText: 'Harian' },
				listMonth: { buttonText: 'Bulanan' },
				month: { buttonText: 'Kalender' }
			},

			defaultView: 'month',
			defaultDate: '<?=tanggal_sekarang();?>',
			locale: initialLocaleCode,
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
<?php
$link = mysqli_connect("localhost", "root", "", "jadwalujian");
$sql = "SELECT * FROM jadwalujian where status='2'";


$result = mysqli_query($link, $sql);
while($row = mysqli_fetch_array($result)){
	$title = $row['keterangan'];
	$start = $row['tgl1'];
?>{
	
					title: '<?php echo $title;?>',
					start: '<?php echo $start;?>'
},
<?php	
}	
?>			
			]
		});
		
	});
	</script>
	<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>

</head><body>
<div align="center">
<h2>Jadwal<br>

</h2></div>
<div id='calendar'></div>
</body>