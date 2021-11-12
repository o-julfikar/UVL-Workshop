<?php
include_once "connect.php";

$session_id = $_REQUEST["session_id"];
$fullname = $_REQUEST["fullname"];
$address = $_REQUEST["address"];
$phone = $_REQUEST["phone"];
$license = $_REQUEST["license"];
$engine = $_REQUEST["engine"];
$apptDate = $_REQUEST["apptDate"];
$mechanic = $_REQUEST["mechanic"];
$flagCar = $_REQUEST["flagCar"];
$flagAddress = $_REQUEST["flagAddress"];

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
        if ($flagCar == "true") {
            $sql_get_car = "SELECT * FROM car WHERE car_license_number = '$license';";
            $result_car = mysqli_query($conn, $sql_get_car);
            if (mysqli_num_rows($result_car) > 0) {
                # todo: Advance feature
                echo -1;
                return;
            } else {
                $sql_insert_car = "INSERT INTO car VALUES ('$license', '$engine');";
                mysqli_query($conn, $sql_insert_car);

                $sql_register_car = "INSERT INTO client_owns_car VALUES ('$uid', '$license');";
                mysqli_query($conn, $sql_register_car);
            }
        }

        if ($flagAddress == "true") {
            $sql_get_address = "SELECT * FROM address WHERE user_id = $uid AND address = '$address';";
            $result_address = mysqli_query($conn, $sql_get_address);
            if (mysqli_num_rows($result_address) > 0) {
                # todo: Advance feature
            } else {
                $sql_insert_address = "INSERT INTO address VALUES ('$uid', '$address');";
                mysqli_query($conn, $sql_insert_address);
            }

        }

        $sql_insert_appt = "INSERT INTO car_has_appointment_with_mechanic VALUES ('$license', '$mechanic', '$apptDate', '$address');";
        mysqli_query($conn, $sql_insert_appt);

        echo 1;
    }
}
