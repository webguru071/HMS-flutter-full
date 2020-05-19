<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_operation_services.id, hms_operation_services.name, hms_operation_types.name, hms_operation_services.price
	FROM hms_operation_services, hms_operation_types
	WHERE  hms_operation_services.operation_type_id = hms_operation_types.id AND hms_operation_services.status = 'Active'
	ORDER BY hms_operation_services.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$service_name,$type_name,$price);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['service_name'] = $service_name;
	$temp['type_name'] = $type_name;
	$temp['price'] = $price;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
