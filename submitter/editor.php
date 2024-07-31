<?php
include 'dbconnect.php';

$sql = "SELECT name, id FROM volume";  //selecing all volumes
$result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Editor Page</title>
    </head>
    <body>
        <h1>Select a Volume</h1>
        <table border="1">
            <tr>
                <th>Journal Name</th>
                <th>Volume ID</th>
            </tr>
            <?php
            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) { // All articles listed in a table format for the editor to select from
                    echo "<tr><td>" . ($row['name']) . "</td>";
                    echo "<td><a href='editorVolume.php?name=" . ($row['name']) . "&id=" . ($row['id']) . "'>" . ($row['id']) . "</a></td></tr>";
                }
            } else {
                echo "<tr><td colspan='2'>No volumes found</td></tr>";
            }
            ?>
        </table>
    </body>
</html>

<?php
mysqli_close($conn);
