<?php
//:indentSize=4:tabSize=4:noTabs=true:wrap=soft:
$servername = "localhost";
$username = "root";
$password = "toor";

$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Success";
?>
