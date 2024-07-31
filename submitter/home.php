<?php //this block is to connect to the database and get the query
include 'dbconnect.php'; // connect to databse

$sql = "SELECT name FROM journal";
$result = mysqli_query($conn, $sql); // we run the sql qeury adn return the reustl
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
    </head>
    <body>
        <h1>Journals</h1> <!-- Main header -->
        <ul>
            <?php
            if (mysqli_num_rows($result) > 0) { 
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<li><a href='journal.php?name=" . $row['name'] . "'>" . $row['name'] . "</a></li>"; //displaying the results in a list format using <li and sending the name to journal.php where more inofrmation will be shown
                }
            } else {
                echo "No journals found";
            }
            ?>
        </ul>
    </body>
</html>

<?php
mysqli_close($conn);

