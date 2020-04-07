<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_admissions.id ,patients.patient_name,hms_admissions.slug ,hms_bed_types.name, hms_admissions.invoice, hms_admissions.paid_amount, hms_admissions.due
	FROM hms_admissions,patients,hms_bed_types
	WHERE hms_admissions.patient_id = patients.id AND hms_admissions.bed_id = hms_bed_types.id  AND hms_admissions.status = 'Active'
	ORDER BY hms_admissions.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$patient_name,$slug,$bed_name,$invoice, $paid_amount, $due);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['patient_name'] = $patient_name;
	$temp['slug'] = $slug;
	$temp['bed_name'] = $bed_name;
	$temp['invoice'] = $invoice;
	$temp['paid_amount'] = $paid_amount;
	$temp['due'] = $due;


	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
