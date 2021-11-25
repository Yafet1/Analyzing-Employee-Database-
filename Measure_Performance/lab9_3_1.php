<?php

$start = microtime(true);

echo "The above script can be called as";
// Get a connection for the database
//echo 'Test debug';

require_once('secure/mysqli_connect_9.php');

$query = "SELECT firstname, lastname, gpa FROM students WHERE firstname like 'A%' limit 10000;";

$result = mysqli_query($conn, $query);
while ($row = mysqli_fetch_assoc($result))
{
extract($row);
if ($gpa >= 3.6)
$StudentType = 'A student';
elseif ($gpa >= 3.2)
$StudentType = 'B+ student';
elseif ($gpa >= 2.8)
$StudentType = 'B student';
elseif ($gpa >= 2.4)
$StudentType = 'C+ student';
else
$StudentType = 'C student';
//echo $firstname." ".$lastname." ".$StudentType."<br>";

$query = "INSERT INTO students_grade (firstname,lastname,StudentType)
VALUES ('$firstname','$lastname','$StudentType')";

 if($conn->query($query) == TRUE){ echo "Row added successfully: ".$query."\n"; }
 else { echo "Could not add row" . $conn->error; }

}

$end = microtime(true);
echo "Took " . ($end - $start) . "s";
?>

