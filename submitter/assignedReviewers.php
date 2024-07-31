<?php
include 'dbconnect.php';

$volname = $_POST['volname'];
$volid = $_POST['volid'];

foreach ($_POST['reviewer1'] as $articleId => $reviewer1) {
    $reviewer2 = $_POST['reviewer2'][$articleId];

    $sql1 = "INSERT INTO articlereviews (id, email) VALUES ('$articleId', '$reviewer1')"; // After an editor assigns an editor, the following sql queries are produced to insert the values into the daatabse
    $sql2 = "INSERT INTO articlereviews (id, email) VALUES ('$articleId', '$reviewer2')";

    mysqli_query($conn, $sql1);
    mysqli_query($conn, $sql2);
}

header("Location: editorVolume.php?name=" . ($volname) . "&id=" . ($volid));
?>

<?php
mysqli_close($conn);
