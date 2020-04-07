<?php
require_once 'connect.php';

$email=$_POST['email'];
$password=$_POST['password'];

$sql = "SELECT * FROM users WHERE email='$email'";

    $response = mysqli_query($conn, $sql);

	$result = array();
	if ( mysqli_num_rows($response) === 1 ) {
        
        $row = mysqli_fetch_assoc($response);

        if ( password_verify($password, $row['password']) ) {

			$result[] = $row;

            echo json_encode($result);

            mysqli_close($conn);

        } else {

            $result['pass_error'] = "1";
            
            echo json_encode($result);
            mysqli_close($conn);

        }

    }
?>