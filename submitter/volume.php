<?php
include 'dbconnect.php';

$journalName = $_GET['name'];
$volumeId = $_GET['id']; // Getting journal name and volume name based on user clicks

$sqlVolume = "SELECT * FROM volume WHERE name = '$journalName' AND id = '$volumeId'";
$sqlArticles = "SELECT * FROM article WHERE volname = '$journalName' AND volid = '$volumeId'"; //queries

$resultVolume = mysqli_query($conn, $sqlVolume);
$resultArticles = mysqli_query($conn, $sqlArticles);

$volume = mysqli_fetch_assoc($resultVolume);

?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo ($volume['name']) . " - " . ($volume['id']); ?></title>
</head>
<body>
    <h1>Volume: <?php echo ($volume['name']) . " - " . ($volume['id']); ?></h1>  <!-- displaying volume information-->
    <p>Publication Date: <?php echo ($volume['publicationDate']); ?></p>
    <h2>Articles</h2>
    <ul>
        <?php
        if (mysqli_num_rows($resultArticles) > 0) {
            while($row = mysqli_fetch_assoc($resultArticles)) {
                echo "<li><a href='article.php?id=" . ($row['id']) . "'>" . ($row['title']) . "</a> - " . ($row['result']) . "</li>"; //Again everything is listed using <li> block in html and send information to article.php
            }
        } else {
            echo "No articles found";
        }
        ?>
    </ul>
</body>
</html>

<?php
mysqli_close($conn);
