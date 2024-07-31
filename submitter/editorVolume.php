<?php
include 'dbconnect.php';

$journalName = $_GET['name'];
$volumeId = $_GET['id'];

$sqlArticles = "SELECT * FROM article WHERE volname = '$journalName' AND volid = '$volumeId'";
$sqlReviewers = "SELECT email FROM person WHERE isReviewer = 1"; // getting all possible reviewers

$resultArticles = mysqli_query($conn, $sqlArticles);
$resultReviewers = mysqli_query($conn, $sqlReviewers);

$reviewers = [];
if (mysqli_num_rows($resultReviewers) > 0) { // listing all the possible reviewers in an array to choose from
    while ($row = mysqli_fetch_assoc($resultReviewers)) {
        $reviewers[] = $row['email'];
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Volume: <?php echo ($journalName) . " - " . ($volumeId); ?></title>
</head>
<body>
    <h1>Volume: <?php echo ($journalName) . " - " . ($volumeId); ?></h1>
    <h2>Articles</h2>
    <form action="assignedReviewers.php" method="POST">
        <input type="hidden" name="volname" value="<?php echo ($journalName); ?>">
        <input type="hidden" name="volid" value="<?php echo ($volumeId); ?>">
        <table border="1">
            <tr>
                <th>Article Title</th>
                <th>Reviewer 1</th>
                <th>Reviewer 2</th>
            </tr>
            <?php
            if (mysqli_num_rows($resultArticles) > 0) {
                while($row = mysqli_fetch_assoc($resultArticles)) {
                    echo "<tr><td>" . ($row['title']) . "</td>";
                    echo "<td><select name='reviewer1[{$row['id']}]'>";
                    foreach ($reviewers as $reviewer) { //used foreach loop to list the options of reviewers, the loop functions the same way it functions in java
                        echo "<option value='" . ($reviewer) . "'>" . ($reviewer) . "</option>";
                    }
                    echo "</select></td>";
                    echo "<td><select name='reviewer2[{$row['id']}]'>";
                    foreach ($reviewers as $reviewer) {
                        echo "<option value='" . ($reviewer) . "'>" . ($reviewer) . "</option>";
                    }
                    echo "</select></td></tr>";
                }
            } else {
                echo "<tr><td colspan='3'>No articles found</td></tr>";
            }
            ?>
        </table>
        <button type="submit">Assign Reviewers</button>
    </form>
</body>
</html>

<?php
mysqli_close($conn);
