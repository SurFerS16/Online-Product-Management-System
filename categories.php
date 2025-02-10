<?php require('top.php');
$cat_id = mysqli_real_escape_string($con, $_GET['id']);

$price_high_selected="";
$price_low_selected="";
$new_selected="";
$old_selected="";
$sort_order="";

if(isset($_GET['sort']))
{
    $sort=mysqli_real_escape_string($con, $_GET['sort']);
    if($sort=="price_high"){
        $sort_order=" order by product.price desc";
        $price_high_selected="selected";
    }
    if($sort=="price_low"){
        $sort_order=" order by product.price asc ";
        $price_low_selected="selected";
    }
    if($sort=="new"){
        $sort_order=" order by product.id desc ";
        $new_selected="selected";
    }
    if($sort=="old"){
        $sort_order=" order by product.id asc ";
        $old_selected="selected";
    }
}
if ($cat_id > 0) {
    $get_product = get_product($con, '', $cat_id,'','',$sort_order);
} else {
?>
<script>
    window.location.href = "index.php";
</script>
<?php } ?>

<div class="small-container_next">
    <?php if (count($get_product) > 0) { ?>

    <div class="row row-2">
        <h2>Products</h2>
        <select onchange="sort_product_drop('<?php echo $cat_id?>','<?php echo SITE_PATH?>')" id="sort_product_id">
            <option value=''>Default shorting</option>
            <option value="price_low" <?php echo $price_low_selected?> >Short by price low to high</option>
            <option value="price_high" <?php echo $price_high_selected?>>Short by price high to low </option>
            <option value="new" <?php echo $new_selected?>>short by new</option>
            <option value="old" <?php echo $old_selected?>>short by old</option>
        </select>
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
            रु&nbsp;<?php echo $list['price'] ?>
            </p>
        </div>
        <?php } ?>

    </div>

 
    <?php } else {
        echo "Data not found.";
    } ?>

</div>
<script type="text/javascript">
    function sort_product_drop(cat_id,site_path){
        var sort_product_id=jQuery('#sort_product_id').val();
        window.location.href=site_path+"categories.php?id="+cat_id+"&sort="+sort_product_id;
    }
</script>


<?php require('footer.php'); ?>