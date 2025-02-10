<?php require('top.php');?>

<div class="contact-form">

            <h2>Contact Us</h2>
            <form class="contact" action="" method="post">
                <input type="text" id="fname" name="fname" class="text-box" placeholder="Your first name" required>
                <input type="text" id="lname" name="lname" class="text-box" placeholder="Your last name" required>
               
                <input type="email" id="email" name="email" class="text-box" placeholder="Your Email" required>
                <input type="text" id="mobile" name="mobile" class="text-box" placeholder="Your mobile no" required>
                <textarea name="message" id="message" rows="5" placeholder="Your Message..." required></textarea>
                <button type="button" onclick="send_message()" class="send-btn">Submit</button>
            </form>
      
</div>
<script type="text/javascript">
 
    function send_message(){
        var fname=jQuery("#fname").val();
        var lname=jQuery("#lname").val();
        var email=jQuery("#email").val();
        var mobile=jQuery("#mobile").val();
        var message=jQuery("#message").val();
   
        if(fname==""){
            alert('please enter first name');
        }
        else if(lname==""){
            alert('please enter last name');
        }
        else if(email==""){
            alert('please enter email');
        }
        else if(mobile==""){
            alert('please enter mobile');
        }
        else if(message==""){
            alert('please enter message');
        }
        else{
            jQuery.ajax({
                url:'send_message.php',
                type:'post',
                data:'&fname='+fname+'&lname='+lname+'&email='+email+'&mobile='+mobile+'&message='+message,
                success:function(result){
                    alert(result);
                }
            });
        }
    }
 </script>
<?php require('footer.php') ?>