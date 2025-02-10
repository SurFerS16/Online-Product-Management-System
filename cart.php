<?php
require('top.php');

?>

<div class="small-container cart-page">
<?php
if (!isset($_SESSION['cart']) || count($_SESSION['cart']) == 0) {
    ?>
<h3>Please Add To cart first. The Cart is empty </h3>
    <?php
    }else{
?>

    <table>
        <tr>
           
            <th>Product</th>
            <th>Quantity</th>
            <th>Total</th>
        </tr>
        <?php
        
        foreach ($_SESSION['cart'] as $key => $val) {
            $productArr = get_product($con, '', '', $key);
            $pname = $productArr[0]['name'];
            
            $price = $productArr[0]['price'];
            $image = $productArr[0]['image'];
            $qty = $val['qty'];

        ?>
        <tr>
            <td>
                <div class="cart-info">
                    <img src="<?php echo 'media/product/' . $image ?>">

                    <div>
                        <p>
                            <?php echo $pname ?>
                        </p>
                        <small>
                            <?php echo $price ?>
                        </small><br>
                        <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key ?>','remove')">Remove</a>
                        <a href="javascript:void(0)" onclick="manage_cart('<?php echo $key ?>','update')">Update</a>
                    </div>
                </div>
            </td>
            <td>
                <input type="number" min="1" max="10" id="<?php echo $key ?>qty" value="<?php echo $qty ?>">
            </td>
            <td>
                <?php echo $qty*$price ?>
            </td>
        </tr>
        <?php } ?>
    </table>
    <?php } ?>

</div>

<div class="small-container">
    <a href="index.php" class="btn">Continue Shoping &#8594;</a>
    <a href="checkout.php" class="btn">CHECKOUT &#8594;</a>
</div>

<script type="text/javascript">

    function manage_cart(pid, type) {
        if (type == 'update') {
            var qty = jQuery("#" + pid + "qty").val();
        }
        else {
            var qty = jQuery("#qty").val();
        }
        jQuery.ajax({
            url: 'manage_cart.php',
            type: 'post',
            data: 'pid=' + pid + '&qty=' + qty + '&type=' + type,
            success: function (result) {
                if (type == 'update' ) {
                   
                    window.location.href = window.location.href;
                }
                else if(type == 'remove')
                {
                    window.location.href = window.location.href;

                }
                else if(result=='Not_available'){
                    alert('Qty not available');
                }

            }
        });
    }

</script>
<?php require('footer.php'); ?>