<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_operations.id ,hms_operations.date,patients.patient_name ,hms_operations.invoice, hms_operation_services.name, hms_operations.paid_amount, hms_operations.due
	FROM hms_operations,patients,hms_operation_services
	WHERE hms_operations.patient_id = patients.id AND hms_operations.operation_service_id = hms_operation_services.id AND hms_operations.status = 'Void'
	ORDER BY hms_operations.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$date, $patient_name, $invoice,$operation_service_name,  $paid_amount, $due);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['date'] = $date;
	$temp['patient_name'] = $patient_name;
	$temp['invoice'] = $invoice;
	$temp['operation_service_name'] = $operation_service_name;
	$temp['paid_amount'] = $paid_amount;
	$temp['due'] = $due;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
