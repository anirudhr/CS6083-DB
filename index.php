<?php
//require("a.b");
$hello = "Hello World!";
$a_number = 4;
$anotherNumber = 8;

echo "<h3>$hello</h3>$a_number";

$new_str = <<<TST
YO WASSUP BROTHUH '"
TST;

echo $new_str;

if ($a_number == 3) {
    echo $a_number+1;
}
elseif ($a_number == 4) {
    echo $a_number+2;
}
else {
    echo $a_number+3;
}

?>
