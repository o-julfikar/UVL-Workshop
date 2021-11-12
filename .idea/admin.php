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
                $role = (int) $row["user_role"];
                if ($role != 0) {
                    echo "access denied";
                    return;
                }
            }

            $sql_get_appt = "SELECT user.user_id, user_info.user_name, user_info.phone, license, engine_number, appointment_date, mechanic.mechanic_id, mechanic.mechanic_name " .
                "FROM user " .
                "INNER JOIN user_info " .
                "ON user.user_id = user_info.user_id " .
                "INNER JOIN (SELECT car.car_license_number " .
                "AS license, car.engine_number, client_owns_car.user_id " .
                "FROM car INNER JOIN client_owns_car " .
                "ON car.car_license_number = client_owns_car.car_license_number) AS helper1 " .
                "ON user.user_id = helper1.user_id " .
                "INNER JOIN car_has_appointment_with_mechanic " .
                "ON car_has_appointment_with_mechanic.car_license_number = license " .
                "INNER JOIN mechanic " .
                "ON mechanic.mechanic_id = car_has_appointment_with_mechanic.mechanic_id " .
                "ORDER BY appointment_date;";

            $result_appt = mysqli_query($conn, $sql_get_appt);
            if (mysqli_num_rows($result_appt) > 0) {
                while ($row = mysqli_fetch_assoc($result_appt)) {
                    $user_id = $row["user_id"];
                    $user_name = $row["user_name"];
                    $phone = $row["phone"];
                    $license = $row["license"];
                    $engine_number = $row["engine_number"];
                    $appointment_date = $row["appointment_date"];
                    $mechanic_id = $row["mechanic_id"];
                    $mechanic_name = $row["mechanic_name"];
                    $sep = "ADMCSSEP";
                    $nline = "\n";

                    echo $user_id . $sep . $user_name .
                        $sep . $phone . $sep . $license .
                        $sep . $engine_number . $sep . $appointment_date .
                        $sep . $mechanic_id . $sep . $mechanic_name . $nline;
                }
            }
        }
    }

