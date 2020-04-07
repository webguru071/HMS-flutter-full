<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_beds.id,hms_bed_types.name, hms_beds.bed_no, hms_beds.price
	FROM hms_beds,hms_bed_types
	WHERE hms_beds.bed_type_id = hms_bed_types.id AND hms_beds.status = 'Active'
	ORDER BY hms_beds.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$bed_types,$Bed_no,$bed_price);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['bed_types'] = $bed_types;
	$temp['bed_price'] = $bed_price;
	$temp['Bed_no'] = $Bed_no;


	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
