<?php require('top.php');
$product_id = mysqli_real_escape_string($con, $_GET['id']);



if ($product_id > 0) {
    $get_product = get_product($con, '', '', $product_id);
} else {
    ?>
    <script>
        window.location.href = "index.php";
    </script>
    <?php
}

if (isset($_POST['review_submit'])) {
    $rating = get_safe_value($con, $_POST['rating']);
    $review = get_safe_value($con, $_POST['review']);

    $added_on = date('Y-m-d h:i:s');
    mysqli_query($con, "insert into product_review(product_id,user_id,rating,review,status,added_on) values('$product_id','" . $_SESSION['USER_ID'] . "','$rating','$review','1','$added_on')");
    ?>
    <script>
        window.location.href = "product.php?id=<?php echo $product_id ?>";
    </script>
    <?php

    die();
}


$product_review_res = mysqli_query($con, "select users.name,product_review.id,product_review.rating,product_review.review,product_review.added_on from users,product_review where product_review.status=1 and product_review.user_id=users.id and product_review.product_id='$product_id' order by product_review.added_on desc");
?>


<!---single product details--->
<div class="small-container single-product">
    <div class="row">
        <div class="col-2">
            <img src="<?php echo 'media/product/' . $get_product['0']['image'] ?>" width="426px" height="417px"
                id="ProductImg">
            <div class="small-img-row">
                <div class="small-img-col">
                    <img src="<?php echo 'media/product/' . $get_product['0']['image'] ?>" class="small-img">
                </div>
                <div class="small-img-col">
                    <img src="<?php echo 'media/product/' . $get_product[0]['image1'] ?>" class="small-img">
                </div>



            </div>


        </div>
        <div class="col-2">
            <h1>
                <?php echo $get_product['0']['name'] ?>
            </h1>
            <!-- <h4>
                रु&nbsp;
                <?php echo $get_product['0']['mrp'] ?>
            </h4> -->
            <h4>
                रु&nbsp;
                <?php echo $get_product['0']['price'] ?>
            </h4>
            <div class="ht__pro__desc">
                <div class="sin__desc">
                    <?php
                    $checkProduct = checkProduct($con, $get_product[0]['id']);
                    $pending_qty = $get_product['0']['qty'] - $checkProduct;
                    $cart_show = 'yes';
                    if ($get_product['0']['qty'] > $checkProduct) {
                        $stock = 'In stock';

                    } else {
                        $stock = 'Not in stock';
                        $cart_show = '';
                    }
                    ?>

                    <p><span>Availablility:</span>
                        <?php echo $stock ?>
                    </p>
                </div>
            </div>
            <div class="sin__desc">
                <?php
                if ($cart_show != '') {
                    ?>
                    <p><span>Qty:</span>
                        <select id="qty">
                            <?php
                            for ($i = 1; $i <= $pending_qty; $i++) {
                                echo " <option>$i</option>";
                            }
                            ?>


                        </select>
                    </p>
                <?php } ?>
            </div>
            
            <?php
            if ($cart_show != '') {
                ?>
                <a href="" class="btn" onclick="manage_cart('<?php echo $get_product['0']['id'] ?>','add')">Add to Cart</a>
            <?php } ?>
            <a href="" class="btn" onclick="manage_cart1('<?php echo $get_product['0']['id'] ?>','add1')">Add to
                Compare</a>
            <p>
            <h3>Product Details</h3>
            <h>
                <?php echo $get_product['0']['short_desc'] ?>
            </h>
            </p>
        </div>
    </div>
</div>
<div class="small-container ">
    <h3>Specification</h3>
    <table class="data table additional-attributes" id="product-attribute-specs-table">

        <tbody>

            <tr>
                <th class="col label" scope="row">Weight</th>
                <td class="col data" data-th="Weight">
                    <?php echo $get_product['0']['weight'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Dimension</th>
                <td class="col data" data-th="Dimension">
                    <?php echo $get_product['0']['dimension'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">SIM Type</th>
                <td class="col data" data-th="SIM Type">
                    <?php echo $get_product['0']['sim_type'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Display Size</th>
                <td class="col data" data-th="Display Size">
                    <?php echo $get_product['0']['display_size'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Display Resolution</th>
                <td class="col data" data-th="Display Resolution">
                    <?php echo $get_product['0']['resolution'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Display Refresh rate</th>
                <td class="col data" data-th="Display Refresh rate">
                    <?php echo $get_product['0']['refresh_rate'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Display Type</th>
                <td class="col data" data-th="Display Type">
                    <?php echo $get_product['0']['display_type'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">OS</th>
                <td class="col data" data-th="OS">
                    <?php echo $get_product['0']['os'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Chipset</th>
                <td class="col data" data-th="Chipset">
                    <?php echo $get_product['0']['chipset'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">CPU</th>
                <td class="col data" data-th="CPU">
                    <?php echo $get_product['0']['cpu'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">GPU</th>
                <td class="col data" data-th="GPU">
                    <?php echo $get_product['0']['gpu'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">RAM</th>
                <td class="col data" data-th="RAM">
                    <?php echo $get_product['0']['ram'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Storage</th>
                <td class="col data" data-th="Storage">
                    <?php echo $get_product['0']['storage'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">MicroSD card</th>
                <td class="col data" data-th="MicroSD card">
                    <?php echo $get_product['0']['microsd_card'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Back Camera</th>
                <td class="col data" data-th="Back Camera">
                    <?php echo $get_product['0']['back_camera'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Primary</th>
                <td class="col data" data-th="Primary">
                    <?php echo $get_product['0']['primary_camera'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Front Camera</th>
                <td class="col data" data-th="Front Camera">
                    <?php echo $get_product['0']['front_camera'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Speaker</th>
                <td class="col data" data-th="Speaker">
                    <?php echo $get_product['0']['speaker'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">WiFi</th>
                <td class="col data" data-th="WiFi">
                    <?php echo $get_product['0']['wifi'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Bluetooth</th>
                <td class="col data" data-th="Bluetooth">
                    <?php echo $get_product['0']['bluetooth'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Security Sensor</th>
                <td class="col data" data-th="Security Sensor">
                    <?php echo $get_product['0']['security_sensor'] ?>
                </td>
            </tr>
            <tr>
                <th class="col label" scope="row">Battery</th>
                <td class="col data" data-th="Battery">
                    <?php echo $get_product['0']['battery'] ?>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="small-container single-product">
    <h3>Reviews</h3>
    <?php
    if (mysqli_num_rows($product_review_res) > 0) {

        while ($product_review_row = mysqli_fetch_assoc($product_review_res)) {
            ?>



            <hr>

            <header class="text-left">
                <div><span class="comment-rating">
                        <i>
                            <?php echo $product_review_row['rating'] ?>
                        </i>
                    </span> (
                    <?php echo $product_review_row['name'] ?>)
                </div>
                <time class="comment-date">

                    <?php
                    $added_on = strtotime($product_review_row['added_on']);
                    echo date('d M Y', $added_on);
                    ?>



                </time>
                <div class="comment-post">
                    <p>
                        <?php echo $product_review_row['review'] ?>
                    </p>
                    <hr>
                </div>
            </header>






        <?php }
    } else {
        echo "<h class='submit_review_hint'>No review added</h><br/>";
    }
    ?>
</div>


<div class="small-container ">
    <h3>Enter your review</h3>

    <?php
    if (isset($_SESSION['USER_LOGIN'])) {
        ?>
        <div class="row" id="post-review-box">
            <div class="form-group">
                <form action="" method="post">
                    <select class=" form-control" name="rating" required>
                        <option value="">Select Rating</option>
                        <option>Worst</option>
                        <option>Bad</option>
                        <option>Good</option>
                        <option>Very Good</option>
                        <option>Fantastic</option>
                    </select> <br />
                    <textarea class=" form-control" cols="50" id="new-review" name="review"
                        placeholder="Enter your review here..." rows="5"></textarea>
                    <div class="text-right mt10">
                        <button class="btn btn-success btn-lg" type="submit" name="review_submit">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    <?php } else {
        echo "<a href='login.php'><span class='btn'>Please login to submit your review</span></a>";
    }
    ?>
</div>

<div class="small-container">
    <div class="row row-2">
        <h2>Related Products</h2>
        <?php foreach ($get_product as $list) {
            ?>
            <p><a href="categories.php?id=<?php echo $list['categories_id'] ?>">View More</a></p>
        <?php } ?>
    </div>
</div>
<div class="small-container">

    <div class="row">
        <?php

        $cat_id = $list['categories_id'];
        $get_product = get_product($con, '4', $cat_id);

        foreach ($get_product as $list1) {

            ?>
            <div class="col-4">

                <a href="product.php?id=<?php echo $list1['id'] ?>">
                    <img src="<?php echo 'media/product/' . $list1['image'] ?>" height="200"></a>
                <h4>
                    <?php echo $list1['name'] ?>

                </h4>
          
                <p>
                    रु&nbsp;
                    <?php echo $list1['price'] ?>
                </p>
            </div>

        <?php } ?>

    </div>


</div>
<script type="text/javascript">

    function manage_cart(pid, type) {
        alert("product has been added to your cart");
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
                    window.location.href = 'cart.php';

                }
                if (result == 'Not_available') {
                    alert('Qty not available');
                }

            }
        });
    }

    function manage_cart1(pid, type) {
        alert("product has been added to Compare Section");
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
                    window.location.href = 'compare.php';

                }
            }
        });
    }
    var ProductImg = document.getElementById("ProductImg");
    var SmallImg = document.getElementsByClassName("small-img");
    SmallImg[0].onclick = function () {
        ProductImg.src = SmallImg[0].src;
    }
    SmallImg[1].onclick = function () {
        ProductImg.src = SmallImg[1].src;
    }
    SmallImg[2].onclick = function () {
        ProductImg.src = SmallImg[2].src;
    }
    SmallImg[3].onclick = function () {
        ProductImg.src = SmallImg[3].src;
    }

</script>
<?php require('footer.php'); ?>