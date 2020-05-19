<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_services.id,hms_services.name,hms_service_categories.name,hms_services.price
	FROM hms_services,hms_service_categories
	WHERE hms_services.service_category_id = hms_service_categories.id AND hms_services.status = 'Active'
	ORDER BY hms_services.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$service_name,$service_category_name,$price);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['service_name'] = $service_name;
	$temp['service_category_name'] = $service_category_name;
	$temp['price'] = $price;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
