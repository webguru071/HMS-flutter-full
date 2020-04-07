<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT expenses.id ,expenses.date,expense_categories.category_name,expenses.amount,expenses.description
	FROM expenses,expense_categories
	WHERE expenses.expense_category_id = expense_categories.id AND expenses.status = 'Void' AND expenses.module = 'Hospital'
	ORDER BY expenses.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$date,  $category_name, $amount,$description );

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['date'] = $date;
	$temp['category_name'] = $category_name;
	$temp['amount'] = $amount;
	$temp['description'] = $description;
	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
