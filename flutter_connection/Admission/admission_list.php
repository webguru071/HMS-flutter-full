<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_admissions.id ,patients.patient_name ,hms_admissions.invoice,hms_beds.bed_no, hms_admissions.paid_amount, hms_admissions.due, referrals.name
	FROM hms_admissions,patients,hms_beds,referrals
	WHERE hms_admissions.patient_id = patients.id AND hms_admissions.bed_id = hms_beds.id AND hms_admissions.referral_id = referrals.id AND hms_admissions.status = 'Active'
	ORDER BY hms_admissions.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id, $patient_name, $invoice, $bed_no, $paid_amount, $due, $name);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['patient_name'] = $patient_name;
	$temp['invoice'] = $invoice;
	$temp['bed_no'] = $bed_no;
	$temp['paid_amount'] = $paid_amount;
	$temp['due'] = $due;
	$temp['name'] = $name;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
