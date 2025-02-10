<?php require('top.php'); ?>

<div class="account-page">
    <div class="container">
        <div class="row">
            <div class="col-2">
                <img src="images/image.png" width="100%">
            </div>
            <div class="container">
                <form id="form" action="/">
                    <h2>Registration</h2>
                    <div class="input-control">
                        <label for="fname">First Name</label>
                        <input id="fname" name="fname" type="text">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="lname">Last Name</label>
                        <input id="lname" name="lname" type="text">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="username">Username</label>
                        <input id="name" name="username" type="text">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="email">Email</label>
                        <input id="email" name="email" type="text">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password">Mobile</label>
                        <input id="mobile" name="mobile" type="text">
                        <div class="error"></div>
                    </div>
                    <div class="input-control">
                        <label for="password">Password</label>
                        <input id="password" name="password" type="password">
                        <div class="error"></div>
                    </div>
                    <button type="button" onclick="user_register()">Sign Up</button>
                    <div class="login-signup">
                        <span class="text">Already a member?
                            <a href="login.php">Login Now</a>
                        </span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
 
    function user_register(){
        var fname=jQuery("#fname").val();
        var lname=jQuery("#lname").val();
        var name=jQuery("#name").val();
        var email=jQuery("#email").val();
        var mobile=jQuery("#mobile").val();
        var password=jQuery("#password").val();
   
        if(name==""){
            alert('please enter username');
        }
        else if(fname==""){
            alert('Please enter your first name.');
        }
        else if(lname==""){
            alert('Please enter your last name.');
        }   
        else if(email==""){
            alert('please enter email');
        }
        else if(mobile==""){
            alert('please enter mobile');
        }
        else if(password==""){
            alert('please enter message');
        }
        else{
            jQuery.ajax({
                url:'register_submit.php',
                type:'post',
                data:'&fname='+fname+'&lname='+lname+'&name='+name+'&email='+email+'&mobile='+mobile+'&password='+password,
                success:function(result){
                    if(result=='The email that you are trying to register is already Present.'){
                        alert("Email present");
                    }else{
                        alert("Registered");
                        window.location.href = "login.php";
                    }
                    
                }
            });
        }
    }
 </script>

<?php require('footer.php'); ?>