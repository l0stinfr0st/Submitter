<?php
include 'dbconnect.php';

$email = $_GET['email'];
$sql = "SELECT article.id, article.title FROM article INNER JOIN articlereviews ON article.id = articlereviews.id WHERE articlereviews.email = '$email'"; //getting all the articles that a specifc reviewers has reviewed
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Reviewer Home</title>
</head>
<body>
    <h1>Assigned Articles</h1>
    <table border="1">
        <tr>
            <th>Article ID</th>
            <th>Title</th>
        </tr>
        <?php
        if (mysqli_num_rows($result) > 0) { //displaying all the articles that have been reviews by this specific reviewer
            while($row = mysqli_fetch_assoc($result)) {
                echo "<tr><td>" . ($row['id']) . "</td>";
                echo "<td><a href='article.php?id=" . ($row['id']) . "'>" . ($row['title']) . "</a></td></tr>";
            }
        } else {
            echo "<tr><td colspan='2'>No articles found</td></tr>";
        }
        ?>
    </table>
</body>
</html>

<?php
mysqli_close($conn);
