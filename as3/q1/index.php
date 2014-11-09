<html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
<!--
Use PHP to implement a web application that supports the following :
(i) A user enters (via an html form with two text boxes and a “submit” button) a keyword, such as "delicious" or "turkey" and a 10 digit phone number.

(ii) The app initiates a session and stores the phone number as a session variable. The app creates an html form displaying all sandwiches that have the keyword in the description, along with the description of each, the sizes available, and their prices, with some means for the user to select a size of a particular kind of sandwich (e.g radio buttons, check boxes, etc). If no keyword is entered, all of the sandwiches (and their sizes and prices) are displayed.
(iii) Using the form produced in part (ii), the user can select a sandwich and size. The order table is updated as follows:
If the user has a pending order of the same size of the same kind of sandwich, the quantity on that order is increased by one and the o_time is changed to the current time.
Otherwise, a new tuple is inserted in the order table, representing this customer’s order of this sandwich, with the current time as the o_time and quantity equal to 1. Note that to do this, the app will need to fetch the customer's phone number from the session variable.

For full credit, you must use prepared statements.
Test your application, using the data provided on the course page to populate your database. 
-->
<head>
<title>Sandwich Search</title>
<style>table, th, td { border: 1px solid black; }</style>
</head>
<body>
<?php
session_start();
error_reporting(E_ALL);

function striptext($text) {
    $text = trim($text);
    $text = stripslashes($text);
    $text = htmlspecialchars($text);
    return $text;
}
$keyword = "'%" . striptext($_POST['keyword']) . "'%";
$_SESSION['phone'] = $_POST['phone'];
$host = "localhost";
$user = "root";
$pass = "toor";
$db = "SandwichDelivery";
$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql_searchkeyword = $conn->prepare("SELECT sandwich.sname,description,size,price FROM sandwich INNER JOIN menu ON sandwich.sname = menu.sname LIMIT 1");// WHERE description LIKE ? ORDER BY sandwich.sname, price");
if ($sql_searchkeyword->execute()) {//$keyword)) {
    echo "<table>
    <tr>
        <td><strong>Name</strong></td>
        <td><strong>Description</strong></td>
        <td><strong>Size</strong></td>
        <td><strong>Price</strong></td>
    </tr>";
    while($row = $sql_searchkeyword->fetch_assoc()) {
        echo "<tr><td>" . $row["sname"] . "</td><td>" . $row["description"] . "</td><td>" . $row["size"] . "</td><td>" . $row["price"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}
$conn->close();

?>
</body>
</html>
