<?php //Block to connect and get the sql query
include 'dbconnect.php';

$journalName = $_GET['name']; //get the name of the journal the user clicked from home page
$sql = "SELECT id FROM volume WHERE name = '$journalName'"; //query
$result = mysqli_query($conn, $sql); 
?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo ($journalName); ?></title> 
</head>
<body>
    <h1><?php echo ($journalName); ?></h1> <!-- Header written in php block because it depends on the sql query -->
    <ul>
        <?php
        if (mysqli_num_rows($result) > 0) {
            while($row = mysqli_fetch_assoc($result)) {
                echo "<li><a href='volume.php?name=" . ($journalName) . "&id=" . ($row['id']) . "'>" .($row['id']) . "</a></li>"; // Again everything is listed using <li> block in html and send information to volume.php
            }
        } else {
            echo "No volumes found";
        }
        ?>
    </ul>
</body>
</html>

<?php
mysqli_close($conn);
