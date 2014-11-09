<!DOCTYPE html>
<html>
<head>
<title>Sandwich Order Summary</title>
</head>
<!--
The order table is updated as follows:
If the user has a pending order of the same size of the same kind of sandwich, the quantity on that order is increased by one and the o_time is changed to the current time.
Otherwise, a new tuple is inserted in the order table, representing this customer’s order of this sandwich, with the current time as the o_time and quantity equal to 1. Note that to do this, the app will need to fetch the customer's phone number from the session variable.
-->
<body>
<?php
session_start();
$selection = explode ('|', $_POST["selection"]);
$sname = $selection[0];
$size = $selection[1];
$phone = $_SESSION['phone'];
//echo "Ready to connect! <br/>";
$host = "localhost";
$user = "root";
$pass = "toor";
$db = "SandwichDelivery";
$conn = new mysqli($host, $user, $pass, $db);

$chk_pending_query = "SELECT o_time
                        FROM orders
                        WHERE phone = ?
                         AND sname = ?
                         AND size = ?
                         AND status = 'pending'";
$stmt = $conn->stmt_init();
if(!$stmt->prepare($chk_pending_query)) {
    echo "Failed to prepare query. <br/> $chk_pending_query <br/>";
}
else {
    //echo "Query prepped! <br/>";
    $stmt->bind_param('sss', $phone, $sname, $size);
    if (!$stmt->execute()) {
        echo "Failed to execute query. <br/> $chk_pending_query <br/>";
    }
    $stmt->bind_result($o_time);
    $len = 0;
    while($stmt->fetch()) {
        $len = $len + 1;
    }
    //echo $len . "<br/>";
    date_default_timezone_set('America/New_York');
    $o_time = date('Y-m-d H:i:s', time());
    if ($len == 0) {
        //need to insert new tuple
        $insupd_query = "INSERT INTO
                        orders (o_time, phone, sname, size, quantity, status)
                        VALUES (?, ?, ?, ?, 1, 'pending')";
    }
    else {
        //need to update existing tuple(s). composite key: $phone+$sname+$size
        $insupd_query = "UPDATE orders
                        SET quantity = quantity+1, o_time=?
                        WHERE phone=?
                        AND sname=?
                        AND size=?";
    }
    $stmt=$conn->stmt_init();
    //echo "Statement initiated! <br/>";
    if(!$stmt->prepare($insupd_query)) {
        echo "Failed to prepare query. <br/> $insupd_query <br/>";
    }
    else {
        $stmt->bind_param('ssss', $o_time, $phone, $sname, $size);
        if (!$stmt->execute()) {
            echo "Failed to execute query. <br/> $insupd_query <br/>";
            trigger_error($stmt->error, E_USER_ERROR);
        }
        else {
            echo "Successfully placed order! <br/>";
        }
    }
}
$conn->close();
?>
</body>
</html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
