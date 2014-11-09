<!DOCTYPE html>
<html>
<head>
<title>Sandwich Order Form</title>
</head>
<body>
<h4>Sandwich Order Form</h4>
<form name="get_cu_info" action="menu.php"
            method="post"> 
  <label>Keyword
  <input type="text" name="keyword"/>
  </label>
  <label>Phone
  <input type="text" name="phone" pattern="[0-9]{10}" required/>
  </label>
  <label><input type="submit"/></label>
</form>
</body>
</html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
