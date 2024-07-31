z<?php
include 'dbconnect.php';

$email = $_GET['email'];
$sql = "SELECT article.id, article.title, article.result, article.volid FROM article INNER JOIN writtenby ON article.id = writtenby.id WHERE writtenby.email = '$email'"; // this query gets all the articles written by a specific author
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Author Home</title>
</head>
<body>
    <h1>Submitted Articles</h1>
    <table border="1">
        <tr>
            <th>Article ID</th>
            <th>Title</th>
            <th>Result</th>
            <th>Second Submission Deadline</th>
        </tr>
        <?php
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                echo "<tr><td>" . ($row['id']) . "</td>";
                echo "<td><a href='article.php?id=" . ($row['id']) . "'>" . ($row['title']) . "</a></td>"; // infomration sent to article.php
                echo "<td>" . ($row['result']) . "</td>";
                if ($row['result'] == 'revision') { //if it has to be revised, second submission deadline will be printed
                    $sqlVolume = "SELECT secondSubDeadline FROM volume WHERE id = '" . $row['volid'] . "'";
                    $resultVolume = mysqli_query($conn, $sqlVolume);
                    if (mysqli_num_rows($resultVolume) > 0) {
                        $volume = mysqli_fetch_assoc($resultVolume);
                        echo "<td>" . ($volume['secondSubDeadline']) . "</td>";
                    } else {
                        echo "<td>N/A</td>"; // if there is no second submission deadline "N/A" is printed
                    }
                } else {
                    echo "<td>N/A</td>";
                }
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='4'>No articles found</td></tr>";
        }
        ?>
    </table>
</body>
</html>

<?php
mysqli_close($conn);

