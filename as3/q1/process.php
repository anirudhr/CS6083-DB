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

$host = "localhost";
$user = "root";
$pass = "toor";
$db = "SandwichDelivery";
$conn = new mysqli($host, $user, $pass, $db);

$chk_pending_query = "SELECT o_time
                        FROM orders
                        WHERE phone = '$phone'
                         AND sname = '$sname'
                         AND size = '$size'
                         AND status = 'pending'";
$stmt = $conn->stmt_init();
if(!$stmt->prepare($chk_pending_query)) {
    echo "Failed to prepare query. <br/> $chk_pending_query <br/>";
}
else {
    $stmt->execute();
    $stmt->bind_result($o_time);
    $o_time_res = array();
    $len = 0;
    while($stmt->fetch()) {
        $o_time_res[] = $o_time;
        $len = $len + 1;
    }
    $o_time = date('Y-m-d H:i:s', time() - 5*60*60); //GMT-5
    if ($len == 0) {
        //need to insert new tuple
        $insupd_query = "INSERT INTO
                        orders (phone, sname, size, o_time, quantity, status)
                        VALUES ('$phone', '$sname', '$size', '$o_time', 1, 'pending')";
    }
    else {
        //need to update existing tuple. primary key: $phone+$sname+$size
        $insupd_query = "UPDATE orders
                        SET quantity = quantity+1, o_time='$o_time'
                        WHERE phone='$phone'
                        AND sname='$sname'
                        AND size='$size'";
    }
    echo $insupd_query . "<br/>";
}
$conn->close();
?>
</body>
</html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
