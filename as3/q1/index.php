<!DOCTYPE html>
<html>
<head>
<title>Sandwich Order Form</title>
<style>
.help {
    background-color: #FFFF73;
    border-radius: 10px;
    display: none;
    opacity: 0.9;
    padding: 10px;
    z-index: 100;
}
.help_link:hover + span {
    display: inline;
}
</style>
</head>
<body>
<h4>Sandwich Order Form</h4>
<form name="get_cu_info" action="menu.php"
            method="post"> 
  <label>Keyword
  <a href="#" class="help_link"><input type="text" name="keyword"/></a>
  <span class="help">Search term for your sandwich.</span>
  </label>
  <label>Phone
  <a href="#" class="help_link"><input type="text" name="phone" pattern="[0-9]{10}" required/></a>
  <span class="help">10-digit number.</span>
  </label>
  <label><input type="submit"/></label>
</form>
</body>
</html>
<!--:indentSize=4:tabSize=4:noTabs=true:wrap=soft:-->
