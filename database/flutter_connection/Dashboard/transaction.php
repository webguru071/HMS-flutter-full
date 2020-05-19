<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT transactions.id ,transactions.trans_id ,transactions.transaction_type, transactions.amount, transactions.description
	FROM transactions
	WHERE transactions.status = 'Active' AND transactions.module = 'Hospital'
	ORDER BY transactions.id DESC
	LIMIT 10");

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id, $trans_id, $transaction_type, $amount, $description);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['trans_id'] = $trans_id;
	$temp['transaction_type'] = $transaction_type;
	$temp['amount'] = $amount;
	$temp['description'] = $description;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
