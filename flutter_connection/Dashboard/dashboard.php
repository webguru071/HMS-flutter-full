<?php
    require_once '../connect.php';
	$today = date('Y-m-d');

	$stmt = $conn->prepare("SELECT 
	(SELECT sum(hms_admissions.grand_total) FROM hms_admissions),
	(SELECT sum(hms_admissions.due_collection) FROM hms_admissions),
	(SELECT sum(expenses.amount) FROM expenses WHERE expenses.status = 'Active' AND expenses.module = 'Hospital'),
	(SELECT count(hms_admissions.invoice) FROM hms_admissions WHERE hms_admissions.status = 'Active' AND hms_admissions.admit_date = '$today' )");
	
	//executing the query 
	$stmt->execute();
	
	//binding results to the query 
	$stmt->bind_result($grand_total,$due_collection,$amount,$invoiceNumberToday);
	$admission = array(); 
	
	//traversing through all the result 
	while($stmt->fetch()){
		$temp = array();
		$temp['grand_total'] = $grand_total; 
		$temp['due_collection'] = $due_collection; 
		$temp['amount'] = $amount; 
		$temp['invoice_today'] = $invoiceNumberToday; 
	 		array_push($admission, $temp);
	}
	//displaying the result in json format 
	echo json_encode($admission);
	//$stmt->close();
	//$conn->close();

?>