<?php
    include_once "connect.php";
    $email = $_REQUEST["email"];
    $pass = $_REQUEST["pass"];

    $sql = "SELECT * FROM user WHERE user_email = '$email' AND user_password = '$pass';";
    $result = mysqli_query($conn, $sql);
    $resultLength = mysqli_num_rows($result);
    echo $resultLength . "<br>";
    if ($resultLength > 0) {
        $row  = mysqli_fetch_assoc($result);
        $uid = $row['user_id'];
        $email = $row['user_email'];
        $temp = $uid . "ABCDHGFEIKLMQPONRSTWVUXYZ" . $email . "abcdefgonmlkjihpqrstzyxwvu";
        $session_id = "";
        for ($i = 0; $i < 30; $i++) {
            $idx = rand(0, strlen($temp) - 1);
            $session_id .= $temp[$idx];
        }
//        $sql_session_reset = "DELETE FROM sessions WHERE user_id = $uid";
        $sql_session = "INSERT INTO sessions (user_id, session_id) VALUES ('$uid', '$session_id');";
//        mysqli_query($conn, $sql_session_reset);
        mysqli_query($conn, $sql_session);
        echo $session_id;
    }
?>