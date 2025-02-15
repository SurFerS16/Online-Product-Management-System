<?php
require('top.php');

?>
<div class="wishlist-area ptb--100 bg__white">
    <div class="container_next">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="wishlist-content">
                    <form action="#">
                        <div class="wishlist-table table-responsive">
                            <table>
                                <thead>
                                    <tr>

                                        <th class="product-thumbnail">Order ID</th>
                                        <th class="product-name"><span class="nobr">Order Date</span></th>
                                        <th class="product-price"><span class="nobr"> Address </span></th>
                                        <th class="product-stock-stauts"><span class="nobr">Payment Type</span></th>
                                        <th class="product-stock-stauts"><span class="nobr">Payment Status</span></th>
                                        <th class="product-stock-stauts"><span class="nobr">Order Status</span></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                $uid = $_SESSION['USER_ID'];
                                $res = mysqli_query($con, "select `order`.*,order_status.name as order_status_str from `order`,order_status
                                 where `order`.user_id='$uid' and order_status.id=`order`.order_status");
                                while ($row = mysqli_fetch_assoc($res)) {
                                ?>

                                    <tr>
                                        <td class="product-add-to-cart"><a
                                                href="my_order_detail.php?id=<?php echo $row['id'] ?>">
                                               <div class="btn"> <?php echo $row['id'] ?></div>
                                            </a></td>

                                        <td class="product-name">
                                                <?php echo $row['added_on'] ?>
                                            </td>
                                        <td class="product-name">
                                                <?php echo $row['address'] ?>
                                                <?php echo $row['city'] ?>
                                                <?php echo $row['pincode'] ?>
                                            </td>
                                        <td class="product-name">
                                                <?php echo $row['payment_type'] ?>
                                            </td>
                                        <td class="product-name">
                                                <?php echo $row['payment_status'] ?>
                                            </td>
                                        <td class="product-name">
                                                <?php echo $row['order_status_str'] ?>
                                            </td>

                                    </tr>
                                    <?php } ?>
                                </tbody>
                                <tfoot>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require('footer.php'); ?>