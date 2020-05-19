<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_emergencies.id , patients.patient_name, hms_emergencies.invoice, hms_emergencies.paid_amount, hms_emergencies.due, referrals.name
	FROM hms_emergencies,patients,referrals
	WHERE hms_emergencies.patient_id = patients.id AND hms_emergencies.referral_id = referrals.id AND hms_emergencies.status = 'Active'
	ORDER BY hms_emergencies.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id, $patient_name, $invoice, $paid_amount, $due, $name);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['patient_name'] = $patient_name;
	$temp['invoice'] = $invoice;
	$temp['paid_amount'] = $paid_amount;
	$temp['due'] = $due;
	$temp['name'] = $name;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
