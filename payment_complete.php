<?php
include 'setting.php';
$con=mysqli_connect("localhost","root","","ecom");
var_dump($_REQUEST);
$ref = $_GET['refId'];
$pid = $_GET['oid'];


$data = [
    'amt' => $actualamount,
    'rid' => $ref,
    'pid' => $pid,
    'scd' => $merchant_code
];

$curl = curl_init($fraudcheck_url);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($curl);


curl_close($curl);

$_SESSION['e'] = $pid;
$txnid = $_SESSION['txnid'];
mysqli_query($con, "update `order` set mihpayid='$pid' where txnid='$txnid' ");
 if (strpos($response, "Success") == false) {

    $a = 'success';
    mysqli_query($con, "update `order` set esewa_status='$a ' , payment_status='$a' where mihpayid='$pid' ");
    unset($_SESSION['cart']);
    unset($_SESSION['txnid']);
    header("Location: http://localhost/ecom/Thankyou.php");

 } else {
    
    unset($_SESSION['cart']);
    header("Location: http://localhost/ecom/index.php");
}

?>