<?php
include 'db_connector.php';
$conn = OpenCon();
echo "Connected Successfully";
CloseCon($conn);
?>