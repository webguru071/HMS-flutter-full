<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT referrals.id ,referrals.name,referrals.designation,referrals.contact,referrals.email
	FROM referrals
	ORDER BY referrals.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id, $name, $designation,$contact, $email);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['name'] = $name;
	$temp['designation'] = $designation;
	$temp['contact'] = $contact;
	$temp['email'] = $email;
	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
