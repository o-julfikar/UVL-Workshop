<?php
include_once "connect.php";

$session_id = $_REQUEST["session_id"];
$license = $_REQUEST["license"];
$apptDate = $_REQUEST["apptDate"];
$mechanic = $_REQUEST["mechanic"];
$omecid = $_REQUEST["omecid"];
$oapptDate = $_REQUEST["oapptDate"];

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
            $role = (int) $row["user_role"];
            if ($role != 0) {
                echo "access denied";
                return;
            }
        }

        $sql_update_appt = "UPDATE car_has_appointment_with_mechanic SET mechanic_id = $mechanic, appointment_date = '$apptDate' " .
            "WHERE car_license_number = '$license' AND mechanic_id = $omecid AND appointment_date = '$oapptDate';";
        mysqli_query($conn, $sql_update_appt);
        echo "1";
        echo $sql_update_appt;
    }
}

