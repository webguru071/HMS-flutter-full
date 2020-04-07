<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_service_categories.id,hms_service_categories.name
	FROM hms_service_categories
	WHERE hms_service_categories.status = 'Active'
	ORDER BY hms_service_categories.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$service_category);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['service_category'] = $service_category;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
