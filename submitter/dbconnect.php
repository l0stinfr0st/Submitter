<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "submitter(emine)";

try{ // try catch block to notify user of any error in connection
$conn = new mysqli($servername, $username, $password, $dbname);
}catch(mysqli_sql_exception){
    echo"Could not connect";
}

