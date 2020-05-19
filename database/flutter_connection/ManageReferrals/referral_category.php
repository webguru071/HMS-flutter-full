<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT referral_categories.id ,referral_categories.cat_name,referral_categories.price
	FROM referral_categories
	ORDER BY referral_categories.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id, $name, $price);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['name'] = $name;
	$temp['price'] = $price;
	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
