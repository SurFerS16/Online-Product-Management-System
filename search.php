<?php require('top.php');
$str = mysqli_real_escape_string($con, $_GET['str']);
if ($str != '') {
    $get_product = get_product($con, '', '', '', $str);
} else {
?>
<script>
    window.location.href = "index.php";
</script>
<?php } ?>

<div class="small-container">
    <?php if (count($get_product) > 0) { ?>

    <div class="row row-2">
        <h2>Results</h2>

    </div>
    <div class="row">
        <?php
        foreach ($get_product as $list) {
        ?>
        <div class="col-4">
            <a href="product.php?id=<?php echo $list['id'] ?>">
                <img src="<?php echo 'media/product/' . $list['image'] ?>" height="200"></a>
            <h4>
                <?php echo $list['name'] ?>
            </h4>
           
            <p>
                <?php echo $list['price'] ?>
            </p>
        </div>
        <?php } ?>

    </div>

  
    <?php } else {
        echo "<b>Result not found.</b>";
    } ?>

</div>

<?php require('footer.php'); ?>