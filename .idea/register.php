<?php

    include_once "connect.php";

    $fullname = $_REQUEST["fullname"];
    $email = $_REQUEST["email"];
    $pass = $_REQUEST["pass"];
    $phone = $_REQUEST["phone"];
    $address = $_REQUEST["address"];


    $sql_get_uid = "SELECT user_id FROM user WHERE user_email = '$email';";
    $result_uid = mysqli_query($conn, $sql_get_uid);

    if (mysqli_num_rows($result_uid) > 0) {
        echo "User already exist";
        return;
    }

    $sql_insert_user = "INSERT INTO user (user_email, user_password) VALUES ('$email', '$pass');";
    mysqli_query($conn, $sql_insert_user);
    $result_uid = mysqli_query($conn, $sql_get_uid);

    if (mysqli_num_rows($result_uid) == 0) {
        echo $sql_insert_user;
        return;
    }
    $uid = mysqli_fetch_assoc($result_uid)['user_id'];
    $sql_insert_user_info = "INSERT INTO user_info VALUES ('$uid', '$fullname', '1', '$phone');";
    $sql_insert_user_address = "INSERT INTO address VALUE ('$uid', '$address');";

    mysqli_query($conn, $sql_insert_user_info);
    mysqli_query($conn, $sql_insert_user_address);

    echo $email;

?>


