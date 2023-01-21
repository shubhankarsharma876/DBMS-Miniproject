<?php
require('functions.php');
session_start();
$connection = mysqli_connect("localhost","root","");
$db = mysqli_select_db($connection,"lms");

if($_SERVER['REQUEST_METHOD']== 'POST')
{
    $returned_date = CURRENT_DATE();
    $O_Date = null;
    $sql = "UPDATE 'returned_table' SET 'returned_date'='".$returned_date"' WHERE returned_date='".$O_Date"';";

}
?>