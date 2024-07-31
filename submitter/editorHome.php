<!DOCTYPE html>
<html>
<head>
    <title>Editor Login</title>
</head>
<body>
    <h1>Editor Login</h1>
    <form action="editor.php" method="GET"> <!-- editor has to log in to and then displays all the articles that he is an editor of-->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>
        <br><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>
