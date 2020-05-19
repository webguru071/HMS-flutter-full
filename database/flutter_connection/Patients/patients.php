<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT patients.id, patients.picture, patients.patient_name, patients.slug, patients.phone, patients.address, patients.created_at, patients.blood_group, hms_admissions.due
	FROM patients,hms_admissions
	WHERE hms_admissions.patient_id = patients.id AND patients.status = 'Active'
	ORDER BY patients.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$picture,$name,$slug,$phone,$address,$created_at,$blood_group,$due);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['picture'] = $picture;
	$temp['name'] = $name;
	$temp['slug'] = $slug;
	$temp['phone'] = $phone;
	$temp['address'] = $address;
	$temp['created_at'] = $created_at;
	$temp['blood_group'] = $blood_group;
	$temp['due'] = $due;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
