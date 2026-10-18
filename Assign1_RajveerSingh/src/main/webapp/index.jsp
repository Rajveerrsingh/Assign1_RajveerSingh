<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<style>
  body { font-family: serif; margin: 20px; }
  table td { padding: 5px; }
  td.label { text-align: right; font-family: Verdana, sans-serif; font-size: 14px; }
  .hint { color: red; font-family: Arial, sans-serif; font-size: 13px; font-weight: bold; }
  input.invalid, select.invalid, textarea.invalid { border: 2px solid red; background: #ffecec; }
  .server-errors { color: red; font-family: Arial; }
</style>
<script>
function $(id) { return document.getElementById(id); }

function mark(el, bad) {
  if (el) el.classList.toggle("invalid", bad);
  return !bad;
}

function validateForm() {
  var ok = true, first = null;
  function check(el, bad) {
    if (!mark(el, bad)) { ok = false; if (!first) first = el; }
  }

  var userId = $("userId").value.trim();
  check($("userId"), userId.length < 5 || userId.length > 12);

  var pwd = $("password").value;
  check($("password"), pwd.length < 7 || pwd.length > 12);

  check($("name"), !/^[A-Za-z ]+$/.test($("name").value.trim()));

  check($("country"), $("country").value === "");

  check($("zip"), !/^[0-9]+$/.test($("zip").value.trim()));

  check($("email"), !/^[\w.+-]+@[\w-]+(\.[\w-]+)+$/.test($("email").value.trim()));

  var sexChosen = document.querySelector('input[name="sex"]:checked') !== null;
  $("sexHint").style.fontSize = sexChosen ? "13px" : "16px";
  if (!sexChosen) { ok = false; if (!first) first = $("male"); }

  var langChosen = document.querySelectorAll('input[name="language"]:checked').length > 0;
  $("langHint").style.fontSize = langChosen ? "13px" : "16px";
  if (!langChosen) { ok = false; if (!first) first = $("english"); }

  if (!ok) {
    alert("Please correct the highlighted fields.");
    first.focus();
  }
  return ok;
}
</script>
</head>
<body>
<h1>Registration Form</h1>

<% java.util.List<String> errors = (java.util.List<String>) request.getAttribute("errors");
   if (errors != null) { %>
  <div class="server-errors"><ul>
  <% for (String e : errors) { %><li><%= e %></li><% } %>
  </ul></div>
<% } %>

<form action="register" method="post" onsubmit="return validateForm();" novalidate>
<table>
  <tr><td class="label">User id:</td>
      <td><input type="text" id="userId" name="userId" size="12">
          <span class="hint">Required and must be of length 5 to 12.</span></td></tr>

  <tr><td class="label">Password:</td>
      <td><input type="password" id="password" name="password" size="12">
          <span class="hint">Required and must be of length 7 to 12.</span></td></tr>

  <tr><td class="label">Name:</td>
      <td><input type="text" id="name" name="name" size="50">
          <span class="hint">Required and alphabets only.</span></td></tr>

  <tr><td class="label">Address:</td>
      <td><input type="text" id="address" name="address" size="50">
          <span class="hint">Optional.</span></td></tr>

  <tr><td class="label">Country:</td>
      <td><select id="country" name="country">
            <option value="">(Please select a country)</option>
            <option>Canada</option>
            <option>India</option>
            <option>United States</option>
            <option>United Kingdom</option>
            <option>Australia</option>
          </select>
          <span class="hint">Required. Must select a country.</span></td></tr>

  <tr><td class="label">ZIP Code:</td>
      <td><input type="text" id="zip" name="zip" size="12">
          <span class="hint">Required. Must be numeric only.</span></td></tr>

  <tr><td class="label">Email:</td>
      <td><input type="text" id="email" name="email" size="50">
          <span class="hint">Required. Must be a valid email.</span></td></tr>

  <tr><td class="label">Sex:</td>
      <td><input type="radio" id="male" name="sex" value="Male">Male
          <input type="radio" id="female" name="sex" value="Female">Female
          &nbsp;&nbsp;&nbsp;<span class="hint" id="sexHint">Required.</span></td></tr>

  <tr><td class="label">Language:</td>
      <td><input type="checkbox" id="english" name="language" value="English" checked>English
          <input type="checkbox" id="nonenglish" name="language" value="Non English">Non English
          &nbsp;&nbsp;&nbsp;<span class="hint" id="langHint">Required.</span></td></tr>

  <tr><td class="label" style="vertical-align:top">About:</td>
      <td><textarea id="about" name="about" rows="10" cols="50"></textarea>
          <span class="hint">Optional.</span></td></tr>

  <tr><td></td><td align="center"><input type="submit" value="Submit"></td></tr>
</table>
</form>
</body>
</html>