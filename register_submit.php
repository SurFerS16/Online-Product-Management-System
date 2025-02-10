<?php 
require('connection.inc.php');
require('functions.inc.php');
$lname=get_safe_value($con,$_POST['lname']);
$fname=get_safe_value($con,$_POST['fname']);
$name=get_safe_value($con,$_POST['name']);
$email=get_safe_value($con,$_POST['email']);
$mobile=get_safe_value($con,$_POST['mobile']);
$password=get_safe_value($con,$_POST['password']);

$check_user=mysqli_num_rows(mysqli_query($con,"select * from users where email='$email'"));
if($check_user>0)
{
    echo "The email that you are trying to register is already Present.";
}
else{
    $added_on=date('y-m-d h:i:s');
    mysqli_query($con,"insert into users(fname,lname,name,email,mobile,password,added_on) values('$fname','$lname','$name','$email','$mobile','$password','$added_on')");
}
?>