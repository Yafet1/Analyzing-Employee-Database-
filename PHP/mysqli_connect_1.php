<html>

<body>
<?php
$servername = "localhost";
$username = "root";
$password = " ";
$dbname = "db3";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected Successfully\t";


// prepare and bind
$stmt = $conn->prepare("INSERT INTO grade_table (Grade, Name) VALUES (? , ?)");
$stmt->bind_param("ss", $Grade, $Name);

// set parameters and execute

$Grade = trim($_GET["grade"]," ");
$Name = trim($_GET["name"], " ");
$stmt->execute();


echo "New records created successfully";

$stmt->close();
$conn -> close();
?>

</body>
</html>
