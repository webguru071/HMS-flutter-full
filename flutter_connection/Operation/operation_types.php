<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_operation_types.id ,hms_operation_types.name
	FROM hms_operation_types
	WHERE  hms_operation_types.status = 'Active'
	ORDER BY hms_operation_types.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$type_name);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['type_name'] = $type_name;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
