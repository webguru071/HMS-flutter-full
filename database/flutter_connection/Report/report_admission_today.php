<?php
require_once '../connect.php';
$today = date('Y-m-d');
//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_admissions.id ,hms_admissions.admit_date ,patients.patient_name, hms_admissions.invoice ,hms_admissions.paid_amount, hms_admissions.due, referrals.name
	FROM hms_admissions,patients,referrals
	WHERE hms_admissions.patient_id = patients.id  AND hms_admissions.referral_id = referrals.id AND hms_admissions.status = 'Active' AND hms_admissions.date = '$today'
	ORDER BY hms_admissions.id DESC"  );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$admit_date,  $patient_name, $invoice,$paid_amount,$due,$referral_name );

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['admit_date'] = $admit_date;
	$temp['patient_name'] = $patient_name;
	$temp['invoice'] = $invoice;
	$temp['paid_amount'] = $paid_amount;
	$temp['due'] = $due;
	$temp['referral_name'] = $referral_name;
	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
