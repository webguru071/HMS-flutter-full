<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_admissions.id, patients.patient_name, hms_admissions.invoice, hms_admissions.due_collection
	FROM patients,hms_admissions
	WHERE hms_admissions.patient_id = patients.id AND patients.status = 'Active'
	ORDER BY hms_admissions.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$name,$invoice,$due_collection);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['name'] = $name;
	$temp['invoice'] = $invoice;
	$temp['due_collection'] = $due_collection;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
