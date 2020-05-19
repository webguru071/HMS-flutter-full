<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT departments.id,departments.dep_name,departments.description
	FROM departments
	WHERE departments.status = 'Active'
	ORDER BY departments.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$dep_name,$description);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['dep_name'] = $dep_name;
	$temp['description'] = $description;


	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
