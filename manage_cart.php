<?php 

require('connection.inc.php');

require('functions.inc.php');
require('add_to_cart.inc.php');

$pid=get_safe_value($con,$_POST['pid']);
$qty=get_safe_value($con,$_POST['qty']);
$type=get_safe_value($con,$_POST['type']);
$checkProduct = checkProduct($con, $pid);
$ProductQty = ProductQty($con, $pid);

$pending_qty = $ProductQty - $checkProduct;


$obj=new add_to_cart();
if($type=='add')
{
    $obj->addProduct($pid,$qty);
}
if($type=='remove')
{
    $obj->removeProduct($pid);
}

if($qty>$pending_qty)
{
    echo "Not_available";
    die();
}
if($type=='update')
{
    $obj->updateProduct($pid,$qty);
}


echo $obj->totalProduct();
?>