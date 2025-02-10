<?php 
require('connection.inc.php');
require('functions.inc.php');
$fname=get_safe_value($con,$_POST['fname']);
$lname=get_safe_value($con,$_POST['lname']);
$email=get_safe_value($con,$_POST['email']);
$mobile=get_safe_value($con,$_POST['mobile']);
$comment=get_safe_value($con,$_POST['message']);
$added_on=date('y-m-d h:i:s');
mysqli_query($con,"insert into contact_us(fname,lname,email,mobile,comment,added_on) values('$fname','$lname','$email','$mobile','$comment','$added_on')");
echo "Thank you";


?>
