<?php
require('connection.inc.php');
require('functions.inc.php');


if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
?>
<script>
    window.location.href = 'index.php';
</script>
<?php
}
$cart_total = 0;

foreach ($_SESSION['cart'] as $key => $val) {
    $productArr = get_product($con, '', '', $key);
    $price = $productArr[0]['price'];
    $PID = 'pid'.rand(10,10000).$productArr[0]['id'];
    $qty = $val['qty'];
    $cart_total = $cart_total + ($price * $qty);

}
$txnid = $_SESSION['txnid'];
mysqli_query($con, "update `order` set mihpayid='$PID' where txnid='$txnid' ");
$total_price = $cart_total;
$tax = ($total_price * 13) / 100;
$delivery = 100;
$grandtotal = $total_price + $tax + $delivery;
// Change Info From Here
$epay_url = "https://uat.esewa.com.np/epay/main";
$pid = $PID;
$successurl = "http://localhost/ecom/payment_complete.php";
$failedurl = "http://localhost/ecom/payment_fail.php";

$merchant_code = "epay_payment";
$fraudcheck_url = "https://uat.esewa.com.np/epay/transrec";
// For Amount Check
$actualamount = 1000;
?>