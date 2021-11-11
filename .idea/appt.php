<?php
    include_once "connect.php";

    $session_id = $_REQUEST["session_id"];
    $get_mechanic = $_REQUEST["mechanic"];
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
        } elseif ($get_mechanic == "true") {
            $sql_get_mechanic = "SELECT mechanic.mechanic_id, mechanic_name, IFNULL(count, 0) AS count FROM mechanic " .
                                "LEFT JOIN ( " .
                                "SELECT  mechanic.mechanic_id, COUNT(*) AS 'count' FROM mechanic " .
	                            "LEFT JOIN car_has_appointment_with_mechanic " .
	                            "ON mechanic.mechanic_id = car_has_appointment_with_mechanic.mechanic_id " .
                                "WHERE appointment_date >= CURRENT_DATE() " .
	                            "GROUP BY mechanic.mechanic_id) " .
                                "AS query_helper " .
                                "ON mechanic.mechanic_id = query_helper.mechanic_id;";
            $result_mechanic = mysqli_query($conn, $sql_get_mechanic);
            $mechanics = [];
            if (mysqli_num_rows($result_mechanic) > 0) {
                while ($row = mysqli_fetch_assoc($result_mechanic)) {
                    $mechanic_id = $row["mechanic_id"];
                    $mechanic_name = $row["mechanic_name"];
                    $mechanic_active = (int) $row["count"];
                    if ($mechanic_active < 4) {
                        $mechanics[] = $mechanic_id . "MECSEP" . $mechanic_name . "MECSEP" . $mechanic_active;
                    }
                }
            }
            foreach ($mechanics as $mechanic) {
                echo $mechanic;
                echo "\n";
            }
        } else {
            $sql_get_userinfo = "SELECT * FROM user_info WHERE user_id = $uid;";
            $result_userinfo = mysqli_query($conn, $sql_get_userinfo);
            if (mysqli_num_rows($result_userinfo) > 0) {
                $row = mysqli_fetch_assoc($result_userinfo);
                $user_name = $row["user_name"];
                $phone = $row["phone"];
                $addresses = [];
                $sql_get_address = "SELECT * FROM address WHERE user_id = $uid;";
                $result_address = mysqli_query($conn, $sql_get_address);
                if (mysqli_num_rows($result_address) > 0) {
                    $addresses[] = mysqli_fetch_assoc($result_address)["address"];
                }
                echo $user_name;
                echo "\n";
                echo $phone;
                echo "SPSEPMAZ";
                foreach ($addresses as $address) {
                    echo $address;
                    echo "\n";
                }
                echo "SPSEPMAZ";
                $sql_get_cars = "SELECT car_license_number FROM client_owns_car WHERE user_id = $uid;";
                $result_car = mysqli_query($conn, $sql_get_cars);
                $cars = [];
                $engines = [];
                if (mysqli_num_rows($result_car) > 0) {
                    while ($row = mysqli_fetch_assoc($result_car)) {
                        $cars[] = $row["car_license_number"];
                    }
                }
                foreach ($cars as $car) {
                    $sql_get_engine = "SELECT engine_number FROM car WHERE car_license_number = $car;";
                    $result_engine = mysqli_query($conn, $sql_get_engine);
                    if (mysqli_num_rows($result_car) > 0) {
                        $row = mysqli_fetch_assoc($result_car);
                        $engines[] = $car . "CARSEP" . $row["engine_number"];
                    }
                }
                foreach ($engines as $engine) {
                    echo $engine;
                    echo "\n";
                }
                return;
            }
            echo -1;
        }
    }
