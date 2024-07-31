<?php 
include 'dbconnect.php';

$articleId = $_GET['id'];

$sql = "SELECT * FROM article WHERE id = '$articleId'"; //query
$result = mysqli_query($conn, $sql);

$article = mysqli_fetch_assoc($result);

?>

<!DOCTYPE html>
<html>
<head>
    <title><?php echo ($article['title']); ?></title>
</head>
<body>
    <h1><?php echo ($article['title']); ?></h1>
    <p><strong>Corresponding Author:</strong> <?php echo ($article['correspAut']); ?></p> <!-- displaying article information-->
    <p><strong>Submission Date:</strong> <?php echo ($article['submissionDate']); ?></p>
    <p><strong>Result:</strong> <?php echo ($article['result']); ?></p>
    <p><?php echo (($article['bodyText'])); ?></p>
</body>
</html>

<?php
mysqli_close($conn);
