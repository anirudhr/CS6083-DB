<html>
<head>
<title>Sandwich Order Form</title>
</head>
<body>
<h4>Sandwich Order Form</h4>
<form name="get_cu_info" action="
            <?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>"
            method="post"> 
  <span>Keyword</span>
  <input type="text" name="keyword"/>
  <span>Phone</span>
  <input type="number" name="phone"/>
  <input type="submit"/>
</form>
<?php
$keyword = $phone = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $keyword = striptext($_POST["keyword"]);
    $phone = striptext($_POST["phone"]);
    echo "POST<br/>";
}
else {
    echo "NOTPOST<br/>";
}
function striptext($text) {
    $text = trim($text);
    $text = stripslashes($text);
    $text = htmlspecialchars($text);
    return $text;
}
?>
</body>
</html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
