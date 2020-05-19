<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT hms_bed_types.id, hms_bed_types.name
	FROM hms_bed_types
	WHERE hms_bed_types.status = 'Active'
	ORDER BY hms_bed_types.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$bed_types);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['bed_types'] = $bed_types;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
