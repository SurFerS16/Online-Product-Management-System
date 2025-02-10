<?php require('top.php');
?>

<div class="small-container-compare compare-page">
    <?php
    if (!isset($_SESSION['compare']) || count($_SESSION['compare']) == 0) {
        ?>

        <script>
            alert("Please select some product.");
            window.location.href = "index.php";
        </script>
        <?php
    } else {
        ?>

        <table border="1">
            <tr>

                <th>Product</th>
                <th>Name</th>
                <th>Display Size</th>
                <th>Display Refresh rate</th>
                <th>OS</th>
                <th>Chipset</th>
                <th>CPU</th>
                <th>GPU</th>
                <th>RAM</th>
                <th>Storage</th>
                <th>Primary Camera/<br>Front Camera</th>

                <th>Battery</th>
                <th>Price</th>
            </tr>
            <?php

            foreach ($_SESSION['compare'] as $key => $val) {

                $productArr = get_product($con, '', '', $key);

                $pname = $productArr[0]['name'];
                
                $image = $productArr[0]['image'];
                $displaysize = $productArr[0]['display_size'];
                $displayrefreshrate = $productArr[0]['refresh_rate'];
                $os = $productArr[0]['os'];
                $chipset = $productArr[0]['chipset'];
                $cpu = $productArr[0]['cpu'];
                $gpu = $productArr[0]['gpu'];
                $ram = $productArr[0]['ram'];
                $storage = $productArr[0]['storage'];
                $primary_camera = $productArr[0]['primary_camera'];
                $front_camera = $productArr[0]['front_camera'];
                $battery = $productArr[0]['battery'];
                $price = $productArr[0]['price'];

                ?>
                <tr>
                    <td>
                        <div class="cart-info">
                            <a href="product.php?id=<?php echo $productArr[0]['id']; ?>"><img
                                    src="<?php echo 'media/product/' . $image ?>"></a>
                            <a href="javascript:void(0)" onclick="manage_cart1('<?php echo $key ?>','remove1')">Remove</a>


                        </div>
                    </td>
                    <td>
                        <?php echo $pname ?>
                    </td>
                    <td>
                        <?php echo $displaysize ?>
                    </td>
                    <td>
                        <?php echo $displayrefreshrate ?>
                    </td>
                    <td>
                        <?php echo $os ?>
                    </td>
                    <td>
                        <?php echo $chipset ?>
                    </td>
                    <td>
                        <?php echo $cpu ?>
                    </td>
                    <td>
                        <?php echo $gpu ?>
                    </td>
                    <td>
                        <?php echo $ram ?>
                    </td>
                    <td>
                        <?php echo $storage ?>
                    </td>
                    <td>
                        <?php echo $primary_camera ?><br>
                        <?php echo $front_camera ?>
                    </td>

                    <td>
                        <?php echo $battery ?>
                    </td>
                    <td>
                        <?php echo $price ?>
                    </td>
                </tr>
            <?php } ?>
        </table>
    <?php } ?>

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
                if (type == 'update' || type == 'remove') {
                    window.location.href = window.location.href;

                }
            }
        });
    }
    function manage_cart1(pid, type) {
        if (type == 'update1') {
            var qty = jQuery("#" + pid + "qty").val();
        }
        else {
            var qty = jQuery("#qty").val();
        }
        jQuery.ajax({
            url: 'manage_compare.php',
            type: 'post',
            data: 'pid=' + pid + '&qty=' + qty + '&type=' + type,
            success: function (result) {
                if (type == 'update1' || type == 'remove1') {
                    window.location.href = window.location.href;

                }
            }
        });
    }

</script>
<?php require('footer.php'); ?>