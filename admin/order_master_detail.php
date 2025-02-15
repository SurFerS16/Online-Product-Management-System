<?php
require('top.inc.php');

$order_id = get_safe_value($con, $_GET['id']);
if (isset($_POST['update_order_status'])) {
    $update_order_status = $_POST['update_order_status'];
    mysqli_query($con, "update `order` set order_status='$update_order_status' where id='$order_id'");
    
}


?>
<div class="content pb-0">
    <div class="orders">
        <div class="row">
            <div class="col-xl-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="box-title">Order Detail</h4>

                    </div>
                    <div class="card-body--">
                        <div class="table-stats order-table ov-h">
                            <table class="table">
                                <thead>
                                    <tr>

                                        <th class="product-thumbnail">Product Name</th>
                                        <th class="product-name"><span class="nobr">Product Image</span></th>
                                        <th class="product-price"><span class="nobr"> QTY </span></th>
                                        <th class="product-stock-stauts"><span class="nobr">Price</span></th>
                                        <th class="product-stock-stauts"><span class="nobr">Total Price</span></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php

                                    $res = mysqli_query($con, "select distinct(order_detail.id),
                                order_detail.*,product.name,product.image,`order`.address,`order`.city,`order`.pincode from order_detail,product,`order`  where order_detail.order_id='$order_id' and  
                                order_detail.product_id=product.id");
                                    $total_price = 0;
                                    while ($row = mysqli_fetch_assoc($res)) {
                                        $address=$row['address'];
                                        $city=$row['city'];
                                        $pincode=$row['pincode'];
                                      
                                                                                $total_price = $total_price + ($row['qty'] * $row['price']);
                                    ?>

                                    <tr>
                                        <td class="product-add-to-cart"><a
                                                href="my_order_detail.php?id=<?php echo $row['id'] ?>">
                                                <?php echo $row['name'] ?>
                                            </a></td>

                                        <td class="product-name"><a href="#">
                                                <img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image'] ?>" width="50%"
                                                    id="ProductImg">
                                            </a></td>
                                        <td class="product-name"><a href="#">
                                                <?php echo $row['qty'] ?>

                                            </a></td>
                                        <td class="product-name"><a href="#">
                                                <?php echo $row['price'] ?>
                                            </a></td>
                                        <td class="product-name"><a href="#">
                                                <?php echo $row['qty'] * $row['price'] ?>
                                            </a></td>


                                    </tr>
                                    <?php } ?>
                                    <tr>

                                        <td colspan="3"><a href="#">


                                            </a></td>
                                        <td class="product-name"><a href="#">
                                                Total Price
                                            </a></td>
                                        <td class="product-name"><a href="#">
                                                <?php echo $total_price ?>
                                            </a></td>


                                    </tr>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                            <div id="address_details">
                                <strong>Address</strong>
                                <?php echo $address?>,<?php echo $city?>,<?php echo $pincode?><br>
                                <strong>order status</strong>
                                <?php
                                        $order_status_arr=mysqli_fetch_assoc(mysqli_query($con,"select order_status.name from order_status,`order` 
                                        where `order`.id ='$order_id' and `order`.order_status=order_status.id"));
                                        echo $order_status_arr['name'];
                                        ?>
                                         <div>
                                    <form method="post">
                                        <select class=" form-control" name="update_order_status">
                                            <option>Select Stauts</option>
                                            <?php
                                   $res = mysqli_query($con, "select * from  order_status");
                                   while ($row = mysqli_fetch_assoc($res)) {
                                       if ($row['id'] == $categories_id) {
                                           echo "<option selected value=" . $row['id'] . ">" . $row['name'] . "</option>";
                                       } else {
                                           echo "<option value=" . $row['id'] . ">" . $row['name'] . "</option>";
                                       }
                                   }
                                   ?>
                                        </select>
                                        <input type="submit" class="form-control">
                                    </form>
                                </div>
                                        
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require('footer.inc.php');
?>