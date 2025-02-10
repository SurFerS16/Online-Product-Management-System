<?php 

require('connection.inc.php');

require('functions.inc.php');
require('add_to_compare.inc.php');

$pid=get_safe_value($con,$_POST['pid']);
$qty=get_safe_value($con,$_POST['qty']);
$type=get_safe_value($con,$_POST['type']);

$obj=new add_to_compare();
if($type=='add1')
{
    $obj->addProduct1($pid,$qty);
}
if($type=='remove1')
{
    $obj->removeProduct1($pid);
}
if($type=='update1')
{
    $obj->updateProduct1($pid,$qty);
}
echo $obj->totalProduct1();
?>