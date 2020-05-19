<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_admissions.id ,hms_admissions.discharge_date,patients.patient_name ,hms_admissions.invoice, hms_admissions.paid_amount, hms_admissions.due, referrals.name
	FROM hms_admissions,patients,hms_beds,referrals
	WHERE hms_admissions.patient_id = patients.id AND hms_admissions.bed_id = hms_beds.id AND hms_admissions.referral_id = referrals.id AND hms_admissions.status = 'Active'
	ORDER BY hms_admissions.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$discharge_date, $patient_name, $invoice,  $paid_amount, $due, $name);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['discharge_date'] = $discharge_date;
	$temp['patient_name'] = $patient_name;
	$temp['invoice'] = $invoice;
	$temp['paid_amount'] = $paid_amount;
	$temp['due'] = $due;
	$temp['name'] = $name;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
