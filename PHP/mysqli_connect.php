<html>
<head>

<style>
table, th, td {
    border: 1px solid black;
}
</style>


</head>
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
//echo "Connected Successfully\t";

// sql select 10 rows 

$sql = "select * from grade_table limit 10";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table><tr><th>Grade</th><th>Name</th></tr>";
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["Grade"]. "</td><td>" . $row["Name"].
        "</td></tr>";
    }
    echo "</table>";
} else {
    echo "0 results";
}


$conn -> close();
?>

</body>
</html>

