<?php
include_once "connect.php";
$email = $_REQUEST["email"];

$sql = "SELECT * FROM user WHERE user_email = '$email';";
$result = mysqli_query($conn, $sql);
$resultLength = mysqli_num_rows($result);
echo $resultLength;
?>