<?php
    include_once "connect.php";
    $email = $_REQUEST["email"];
    $pass = $_REQUEST["pass"];

    $sql = "SELECT * FROM user WHERE user_email = '$email' AND user_password = '$pass';";
    $result = mysqli_query($conn, $sql);
    $resultLength = mysqli_num_rows($result);
    echo $resultLength;
?>