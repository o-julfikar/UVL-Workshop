<?php
    include_once "connect.php";

    $session_id = $_REQUEST["session_id"];
    $sql_get_uid = "SELECT * FROM sessions WHERE session_id = '$session_id';";
    $result_session = mysqli_query($conn, $sql_get_uid);

    if (mysqli_num_rows($result_session) > 0) {
        $row = mysqli_fetch_assoc($result_session);
        $uid = $row["user_id"];
        $session_start = $row["session_start"];

        $current_date = (string) date("Y-m-d");
        $session_start = strtotime($session_start);
        $current_date = strtotime($current_date);

        $days = $current_date - ($session_start);
        $days = $days / 60 / 60 / 24;

        if ($days > 30) {
            echo "session expired";
            return;
        } else {
            $sql_get_user = "SELECT * FROM user_info WHERE user_id = $uid;";
            $result_user = mysqli_query($conn, $sql_get_user);
            if (mysqli_num_rows($result_user) > 0) {
                $row = mysqli_fetch_assoc($result_user);
                $name = $row["user_name"];
                $role = (int) $row["user_role"];
                echo "success" . "\n" . $name . "\n" . $role;
            }
        }
    } else {
        echo "session expired";
    }
