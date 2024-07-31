<!DOCTYPE html>
<html>
    <title>Author Login</title>
</head>
<body>
    <h1>Author Login</h1>
    <form action="authorHome.php" method="GET"> <!-- Author logs in and his information is sent to authorHome.php for further actions-->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <button type="submit">Login</button>
    </form>
</body>
</html>
