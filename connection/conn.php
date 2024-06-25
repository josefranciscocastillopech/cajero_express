<?php
$hostname="localhost";
$username="root";
$password="";
$database="cajero_express";

$conn = new mysqli($hostname,$username,$password,$database);

if ($conn->connect_error) {
    die("conection falied: ".$conn->connect_error);
}

?>