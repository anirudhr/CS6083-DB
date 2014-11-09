<!DOCTYPE html>
<html>
<head>
<title>Sandwich Order Summary</title>
</head>
<body>
<?php
    $selection = explode ('|', $_POST["selection"]);
    $sname = $selection[0];
    $size = $selection[1];
    echo $_SESSION['phone'];
?>
</body>
</html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
