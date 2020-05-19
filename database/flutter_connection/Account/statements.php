<?php
require_once '../connect.php';

//creating a query 
$stmt = $conn->prepare(
	"SELECT transactions.id, transactions.date, transactions.amount, transactions.trans_id, transactions.vendor_id,transactions.transaction_type, transactions.description
	FROM transactions
	WHERE transactions.status = 'Active'
	ORDER BY transactions.id DESC" );

$stmt->execute();

//binding results to the query 
$stmt->bind_result($id,$date,$amount,$trans_id,$vendor_id,$transaction_type,$description);

$report = array();
while ($stmt->fetch()) {
	$temp = array();
	$temp['id'] = $id;
	$temp['date'] = $date;
	$temp['amount'] = $amount;
	$temp['trans_id'] = $trans_id;
	$temp['vendor_id'] = $vendor_id;
	$temp['transaction_type'] = $transaction_type;
	$temp['description'] = $description;

	array_push($report, $temp);
}
//displaying the result in json format 
echo json_encode($report);
