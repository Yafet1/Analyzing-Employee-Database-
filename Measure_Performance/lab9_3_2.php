<?php
$start = microtime(true);
//echo "The above script can be called as";
// Get a connection for the database
//echo 'Test debug';

require_once('secure/mysqli_connect_9.php');

$query = "SELECT CONCAT(firstname,' ' , lastname) as name,
CASE
WHEN gpa >= 3.6 THEN 'A student'
WHEN gpa >= 3.2 THEN 'B+ student'
WHEN gpa >= 2.8 THEN 'B student'
WHEN gpa >= 2.4 THEN 'C+ student'
ELSE 'C student'
END AS StudentType
FROM students WHERE firstname like 'A%' limit 10000";
$result = mysqli_query($conn, $query);
while ($row = mysqli_fetch_assoc($result))
{
extract($row);
//echo $name." ".$StudentType."<br>";

$query = "INSERT INTO students_grade_2 (name,StudentType)
VALUES ('$name','$StudentType')";

 if($conn->query($query) == TRUE){ echo "Row added successfully: ".$query."\n"; }
 else { echo "Could not add row" . $conn->error; }


}
$end = microtime(true);
echo "Took " . ($end - $start) . "s";
?>
