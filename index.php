<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en-us">

<?php
/********************************************************************

Shows the Test WHRI Data in JSON format on the web page

********************************************************************/

    // Declare variables needed to connect to database
   $servername = "localhost";
   $username = "";
   $password = "";
   $dbname = "whri";

   // Create Connection
   $conn = new mysqli($servername, $username, $password, $dbname);

   // Check connection
   if($conn->connect_error) {
      die("Connection failed: " . $conn->connect_error);
   }

   $query = "SELECT * FROM Items";
   $resultset = mysqli_query($conn, $query);
   if($resultset) {
      // echo "Successfully Received Orders_Products.";
   } else {
      echo "Error: " . $sql . "<br>" . mysqli_error($conn);
   }
   // Create new array to store each individual element
   $records = array();

   // Loop through all the elements of the most recent query
   while($r = mysqli_fetch_assoc($resultset)) {
      $records[] = $r;
   }

   echo json_encode($records);
?>
</html>

