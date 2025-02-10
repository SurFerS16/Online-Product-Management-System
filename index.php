<?php require('top.php');
?>


<div class="small-container">


    <h2 class="title">Latest Products</h2>

    <div class="row">
        <?php
        $get_product = get_product($con, 8);
        foreach ($get_product as $list) {
        ?>
        <div class="col-4">
            <a href="product.php?id=<?php echo $list['id'] ?>">
                <img src="<?php echo 'media/product/' . $list['image'] ?>" height="200"></a>
            <h4>
                <?php echo $list['name'] ?>
            </h4>
          
            <p>
            रु&nbsp; <?php echo $list['price'] ?>
            </p>
        </div>
        <?php } ?>

    </div>
</div>
<div class="small-container">
    <h2 class="title">Best Seller</h2>
    <div class="row">
        <?php
    $get_product = get_product($con, 4, '', '', '', '', 'yes');
    foreach ($get_product as $list) {
    ?>
        <div class="col-4">
            <a href="product.php?id=<?php echo $list['id'] ?>">
                <img src="<?php echo 'media/product/' . $list['image'] ?>" height="200"></a>
            <h4>
                <?php echo $list['name'] ?>
            </h4>
       
            <p>
            रु&nbsp; <?php echo $list['price'] ?>
            </p>
        </div>
        <?php } ?>

    </div>

</div>
</div>
<!----offer-->


<?php require('footer.php'); ?>