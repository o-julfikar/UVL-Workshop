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
            $sql_get_cars = "SELECT car_license_number FROM client_owns_car WHERE user_id = $uid;";
            $result_car = mysqli_query($conn, $sql_get_cars);
            $cars = [];
            if (mysqli_num_rows($result_car) > 0) {
                while ($row = mysqli_fetch_assoc($result_car)) {
                    $cars[] = $row["car_license_number"];
                }
            }
            foreach ($cars as $car) {
                $sql_get_appt = "SELECT * FROM car_has_appointment_with_mechanic WHERE car_license_number = $car;";
                $result_appt = mysqli_query($conn, $sql_get_appt);
                if (mysqli_num_rows($result_appt) > 0) {
                    $row = mysqli_fetch_assoc($result_appt);
                    $mechanic_id = $row["mechanic_id"];
                    $appt_date = $row["appointment_date"];
                    $appt_date = strtotime($appt_date);
                    if ($appt_date > $current_date) {
                        $sql_get_mechanic = "SELECT * FROM mechanic WHERE mechanic_id = $mechanic_id'";
                        $result_mechanic = mysqli_query($conn, $sql_get_mechanic);
                        if (mysqli_num_rows($result_mechanic) > 0) {
                            $mechanic_name = mysqli_fetch_assoc($result_mechanic)["mechanic_name"];
                            echo date("d/m/Y", $appt_date);
                            echo $mechanic_name;
                            return;
                        }
                    }
                }
            }
            echo -1;
        }
    }
