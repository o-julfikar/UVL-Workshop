<?php
    include_once "connect.php";

    $session_id = $_REQUEST["session_id"];
    $license = $_REQUEST["license"];
    $apptDate = $_REQUEST["apptDate"];
    $mechanic = $_REQUEST["mechanic"];

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
            $sql_delete_appt = "DELETE FROM car_has_appointment_with_mechanic WHERE car_license_number = '$license' AND mechanic_id = $mechanic AND appointment_date = '$apptDate'";
            mysqli_query($conn, $sql_delete_appt);
            echo 1;
        }
    }
