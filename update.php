<?php
$db = mysqli_connect("localhost","root","","lms");

error_reporting(0);
session_start();
if($_SERVER['REQUEST_METHOD']== 'POST')
{
	$query ="update users set address='$_POST[address]'";
	$query_run = mysqli_query($connection,$query);

	if(query_run)
	{
		echo 'working';

	}
	else{
echo 'not working';

	}
}
?>

<script type="text/javascript">
	alert("Updated successfully...");
	window.location.href = "user_dashboard.php";
</script>