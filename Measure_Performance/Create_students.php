<?php
echo "The above script can be called as";
// Get a connection for the database
//echo 'Test debug';
function random_name() 
{ 
  $output = ""; 
  $num = rand(1, 20); 
  for($i=0; $i<$num; $i++) 
  { 
    $output .= chr( rand(65, 90) ); 
  } 
  return $output; 
} 
 
require_once('secure/mysqli_connect_9.php');
for($i=0; $i<1000000; $i++) 
{ 
  $firstname = random_name(); 
  $lastname = random_name(); 
  $year = rand(1, 4); 
  $gpa = rand(200, 400) / 100; 
  $query = "INSERT INTO students (firstname,lastname,year,gpa) 
                                   VALUES ('$firstname','$lastname','$year','$gpa')"; 
  if($conn->query($query) == TRUE){ 
echo "Row added successfully: ".$query."\n";  
} 
  else {  echo "Could not add row" . $conn->error;  } 
} 
echo "Ending php script\n"; 

?>