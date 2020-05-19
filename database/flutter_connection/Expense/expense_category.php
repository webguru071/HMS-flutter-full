<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT expenses.id ,expense_categories.category_name,expenses.amount
	FROM expenses,expense_categories
	WHERE expenses.expense_category_id = expense_categories.id AND expenses.status = 'Active' AND expenses.module = 'Hospital'
	ORDER BY expenses.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id, $category_name, $amount);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['category_name'] = $category_name;
	$temp['amount'] = $amount;
	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
