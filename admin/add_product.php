<?php
require('top.inc.php');
$name = '';
$categories_id = '';
$price = '';
$qty = '';
$image = '';
$image1 = '';
$short_desc = '';
$desc = '';
$meta_title = '';
$meta_desc = '';
$meta_keyword = '';
$best_seller = '';
$msg = '';
$image_required = 'required';

$weight = '';
$dimension = '';
$sim_type = '';
$display_size = '';
$resolution = '';
$refresh_rate = '';
$display_type = '';
$os = '';
$chipset = '';
$cpu = '';
$gpu = '';
$ram = '';
$storage = '';
$microsd_card = '';
$back_camera = '';
$primary_camera = '';
$front_camera = '';
$speaker = '';
$wifi = '';
$bluetooth = '';
$security_sensor = '';
$battery = '';


if (isset($_GET['id']) && $_GET['id'] != '') {
    $image_required = '';
    $id = get_safe_value($con, $_GET['id']);
    $res = mysqli_query($con, "select * from product where id='$id'");
    $check = mysqli_num_rows($res);
    if ($check > 0) {
        $row = mysqli_fetch_assoc($res);
        $categories_id = $row['categories_id'];
        $name = $row['name'];
        
        $price = $row['price'];
        $qty = $row['qty'];
        $short_desc = $row['short_desc'];
        $desc = $row['description'];
        $meta_title = $row['meta_title'];
        $meta_keyword = $row['meta_keyword'];
        $meta_desc = $row['meta_desc'];
        $best_seller = $row['best_seller'];
        $weight = $row['weight'];
        $dimension = $row['dimension'];
        $sim_type = $row['sim_type'];
        $display_size = $row['display_size'];
        $resolution = $row['resolution'];
        $refresh_rate = $row['refresh_rate'];
        $display_type = $row['display_type'];
        $os = $row['os'];
        $chipset = $row['chipset'];
        $cpu = $row['cpu'];
        $gpu = $row['gpu'];
        $ram = $row['ram'];
        $storage = $row['storage'];
        $microsd_card = $row['microsd_card'];
        $back_camera = $row['back_camera'];
        $primary_camera = $row['primary_camera'];
        $front_camera = $row['front_camera'];
        $speaker = $row['speaker'];
        $wifi = $row['wifi'];
        $bluetooth = $row['bluetooth'];
        $security_sensor = $row['security_sensor'];
        $battery = $row['battery'];
    } else {
        header('location:product.php');
        die();
    }
}
if (isset($_POST['submit'])) {
    $categories_id = get_safe_value($con, $_POST['categories_id']);
    $name = get_safe_value($con, $_POST['name']);

    $price = get_safe_value($con, $_POST['price']);
    $qty = get_safe_value($con, $_POST['qty']);
    $short_desc = get_safe_value($con, $_POST['short_desc']);
    $desc = get_safe_value($con, $_POST['desc']);
    $meta_title = get_safe_value($con, $_POST['meta_title']);
    $meta_desc = get_safe_value($con, $_POST['meta_desc']);
    $meta_keyword = get_safe_value($con, $_POST['meta_keyword']);
    $best_seller = get_safe_value($con, $_POST['best_seller']);

    $weight = get_safe_value($con, $_POST['weight']);
    $dimension = get_safe_value($con, $_POST['dimension']);
    $sim_type = get_safe_value($con, $_POST['sim_type']);
    $display_size = get_safe_value($con, $_POST['display_size']);
    $resolution = get_safe_value($con, $_POST['resolution']);
    $refresh_rate = get_safe_value($con, $_POST['refresh_rate']);
    $display_type = get_safe_value($con, $_POST['display_type']);
    $os = get_safe_value($con, $_POST['os']);
    $chipset = get_safe_value($con, $_POST['chipset']);
    $cpu = get_safe_value($con, $_POST['cpu']);
    $gpu = get_safe_value($con, $_POST['gpu']);
    $ram = get_safe_value($con, $_POST['ram']);
    $storage = get_safe_value($con, $_POST['storage']);
    $microsd_card = get_safe_value($con, $_POST['microsd_card']);
    $back_camera = get_safe_value($con, $_POST['back_camera']);
    $primary_camera = get_safe_value($con, $_POST['primary_camera']);
    $front_camera = get_safe_value($con, $_POST['front_camera']);
    $speaker = get_safe_value($con, $_POST['speaker']);
    $wifi = get_safe_value($con, $_POST['wifi']);
    $bluetooth = get_safe_value($con, $_POST['bluetooth']);
    $security_sensor = get_safe_value($con, $_POST['security_sensor']);
    $battery = get_safe_value($con, $_POST['battery']);


    $res = mysqli_query($con, "select * from product where name='$name'");
    $check = mysqli_num_rows($res);
    if ($check > 0) {
        if (isset($_GET['id']) && $_GET['id'] != '') {
            $getData = mysqli_fetch_assoc($res);
            if ($id == $getData['id']) {
            } else {
                $msg = "product already exists";
            }
        } else {
            $msg = "product already exists";
        }
    }



    if ($msg == '') {
        if (isset($_GET['id']) && $_GET['id'] != '') {
            if ($_FILES['image']['name'] != '' ) {
                $image = rand(111111111, 99999999) . '_' . $_FILES['image']['name'];
               // $image1 = rand(111111111, 99999999) . '_' . $_FILES['image1']['name'];
                move_uploaded_file($_FILES['image']['tmp_name'], '../media/product/' . $image);
               // move_uploaded_file($_FILES['image1']['tmp_name'], '../media/product/' . $image1);
                $update_sql = "update product set categories_id='$categories_id',name='$name',
            price='$price',qty='$qty',short_desc='$short_desc',description='$desc',
            meta_title='$meta_title',meta_keyword='$meta_keyword',best_seller='$best_seller',meta_desc='$meta_desc',image='$image',
            weight='$weight',dimension='$dimension',sim_type='$sim_type',display_size='$display_size',resolution='$resolution',
            refresh_rate='$refresh_rate',display_type='$display_type',os='$os',chipset='$chipset',cpu='$cpu',gpu='$gpu',ram='$ram',
            storage='$storage',microsd_card='$microsd_card',back_camera='$back_camera',primary_camera='$primary_camera',front_camera='$front_camera',
            speaker='$speaker',wifi='$wifi',bluetooth='$bluetooth',security_sensor='$security_sensor',battery='$battery'
            where id='$id' ";
            } 
            elseif( $_FILES['image1']['name'] != ''){
               
                $image1 = rand(111111111, 99999999) . '_' . $_FILES['image1']['name'];
               // move_uploaded_file($_FILES['image']['tmp_name'], '../media/product/' . $image);
                move_uploaded_file($_FILES['image1']['tmp_name'], '../media/product/' . $image1);
                $update_sql = "update product set categories_id='$categories_id',name='$name',
            price='$price',qty='$qty',short_desc='$short_desc',description='$desc',
            meta_title='$meta_title',meta_keyword='$meta_keyword',best_seller='$best_seller',meta_desc='$meta_desc',image1='$image1',
            weight='$weight',dimension='$dimension',sim_type='$sim_type',display_size='$display_size',resolution='$resolution',
            refresh_rate='$refresh_rate',display_type='$display_type',os='$os',chipset='$chipset',cpu='$cpu',gpu='$gpu',ram='$ram',
            storage='$storage',microsd_card='$microsd_card',back_camera='$back_camera',primary_camera='$primary_camera',front_camera='$front_camera',
            speaker='$speaker',wifi='$wifi',bluetooth='$bluetooth',security_sensor='$security_sensor',battery='$battery'
            where id='$id' ";

            }
            else {
                $update_sql = "update product set categories_id='$categories_id',name='$name',
                price='$price',qty='$qty',short_desc='$short_desc',description='$desc',
                meta_title='$meta_title',meta_keyword='$meta_keyword',best_seller='$best_seller',meta_desc='$meta_desc',
                weight='$weight',dimension='$dimension',sim_type='$sim_type',display_size='$display_size',resolution='$resolution',
                refresh_rate='$refresh_rate',display_type='$display_type',os='$os',chipset='$chipset',cpu='$cpu',gpu='$gpu',
                ram='$ram',storage='$storage',microsd_card='$microsd_card',back_camera='$back_camera',primary_camera='$primary_camera'
                ,front_camera='$front_camera',speaker='$speaker',wifi='$wifi',bluetooth='$bluetooth',security_sensor='$security_sensor',
                battery='$battery'
            where id='$id' ";
            }
            
            mysqli_query($con, $update_sql);
        } else {
            $image = rand(111111111, 99999999) . '_' . $_FILES['image']['name'];
            $image1 = rand(111111111, 99999999) . '_' . $_FILES['image1']['name'];
            move_uploaded_file($_FILES['image']['tmp_name'], '../media/product/' . $image);
            move_uploaded_file($_FILES['image1']['tmp_name'], '../media/product/' . $image1);


            $sql = "insert into product(categories_id,name,price,qty,short_desc,description,meta_title,meta_keyword,meta_desc,status,image,image1,best_seller,weight,dimension,sim_type,display_size,resolution,refresh_rate,display_type,os,chipset,cpu,gpu,ram,	storage,microsd_card,back_camera,primary_camera,front_camera,speaker,wiFi,bluetooth,security_sensor,battery) 
            values('$categories_id','$name','$price','$qty','$short_desc','$desc','$meta_title','$meta_keyword','$meta_desc',1,'$image','$image1',
            '$best_seller','$weight','$dimension','$sim_type','$display_size','$resolution','$refresh_rate','$display_type','$os','$chipset','$cpu','$gpu','$ram','	$storage','$microsd_card','$back_camera','$primary_camera','$front_camera','$speaker','$wifi','$bluetooth','$security_sensor','$battery')";
            mysqli_query($con, $sql);
        }
        header('location:product.php');
        die();
    }
}

?>
<div class="content pb-0">
    <div class="animated fadeIn">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><strong>Product</strong></div>
                    <form method="post" enctype="multipart/form-data">
                        <div class="card-body card-block">
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Categories</label>
                                <select class=" form-control" name="categories_id">
                                    <option>Select Category</option>
                                    <?php
                                    $res = mysqli_query($con, "select id,categories from categories order by categories desc");
                                    while ($row = mysqli_fetch_assoc($res)) {
                                        if ($row['id'] == $categories_id) {
                                            echo "<option selected value=" . $row['id'] . ">" . $row['categories'] . "</option>";
                                        } else {
                                            echo "<option value=" . $row['id'] . ">" . $row['categories'] . "</option>";
                                        }

                                    }
                                    ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Product</label>
                                <input type="text" name="name" placeholder="Enter product name" class="form-control"
                                    require value="<?php echo $name ?>">
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Best Seller</label>
                                <select class=" form-control" name="best_seller" required>
                                    <option value="">select</option>
                                    <?php
                                    if ($best_seller == 1) {
                                        echo '<option value="1" selected>Yes</option>
                                        <option value="0">No</option>';
                                    } elseif ($best_seller == 0) {
                                        echo '<option value="1">Yes</option>
                                        <option value="0" selected>No</option>';
                                    } else {
                                        echo '<option value="1">Yes</option>
                                        <option value="0" >No</option>';
                                    }
                                    ?>
                                </select>
                            </div>
                        
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Price</label>
                                <input type="text" name="price" placeholder="Enter product price" class="form-control"
                                    require value="<?php echo $price ?>">
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Qty</label>
                                <input type="text" name="qty" placeholder="Enter product qty" class="form-control"
                                    require value="<?php echo $qty ?>">
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Front Image</label>
                                <input type="file" name="image" class="form-control" <?php echo $image_required ?>>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label"> Back Image</label>
                                <input type="file" name="image1" class="form-control" <?php echo $image_required ?>>
                            </div>


                            <div class="form-group">
                                <label for="company" class=" form-control-label">Short_Description</label>
                                <textarea type="text" name="short_desc" placeholder="Enter " class="form-control"
                                    require><?php echo $short_desc ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Description</label>
                                <textarea type="text" name="desc" placeholder="Enter " class="form-control"
                                    require><?php echo $desc ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Meta_title</label>
                                <textarea type="text" name="meta_title" placeholder="Enter "
                                    class="form-control"><?php echo $meta_title ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Meta_Description</label>
                                <textarea type="text" name="meta_desc" placeholder="Enter "
                                    class="form-control"><?php echo $meta_desc ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">Meta_Keyword</label>
                                <textarea type="text" name="meta_keyword" placeholder="Enter "
                                    class="form-control"><?php echo $meta_keyword ?></textarea>
                            </div>

                            <div class="form-group">
                                <label for="company" class=" form-control-label">Weight</label>
                                <textarea type="text" name="weight" placeholder="Enter "
                                    class="form-control"><?php echo $weight ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">dimension</label>
                                <textarea type="text" name="dimension" placeholder="Enter "
                                    class="form-control"><?php echo $dimension ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">sim_type</label>
                                <textarea type="text" name="sim_type" placeholder="Enter "
                                    class="form-control"><?php echo $sim_type ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">display_size</label>
                                <textarea type="text" name="display_size" placeholder="Enter "
                                    class="form-control"><?php echo $display_size ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">resolution</label>
                                <textarea type="text" name="resolution" placeholder="Enter "
                                    class="form-control"><?php echo $resolution ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">refresh_rate</label>
                                <textarea type="text" name="refresh_rate" placeholder="Enter "
                                    class="form-control"><?php echo $refresh_rate ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">display_type</label>
                                <textarea type="text" name="display_type" placeholder="Enter "
                                    class="form-control"><?php echo $display_type ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">os</label>
                                <textarea type="text" name="os" placeholder="Enter "
                                    class="form-control"><?php echo $os ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">chipset</label>
                                <textarea type="text" name="chipset" placeholder="Enter "
                                    class="form-control"><?php echo $chipset ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">cpu</label>
                                <textarea type="text" name="cpu" placeholder="Enter "
                                    class="form-control"><?php echo $cpu ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">gpu</label>
                                <textarea type="text" name="gpu" placeholder="Enter "
                                    class="form-control"><?php echo $gpu ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">ram</label>
                                <textarea type="text" name="ram" placeholder="Enter "
                                    class="form-control"><?php echo $ram ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">storage</label>
                                <textarea type="text" name="storage" placeholder="Enter "
                                    class="form-control"><?php echo $storage ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">microsd_card</label>
                                <textarea type="text" name="microsd_card" placeholder="Enter "
                                    class="form-control"><?php echo $microsd_card ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">back_camera</label>
                                <textarea type="text" name="back_camera" placeholder="Enter "
                                    class="form-control"><?php echo $back_camera ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">primary</label>
                                <textarea type="text" name="primary_camera" placeholder="Enter "
                                    class="form-control"><?php echo $primary_camera ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">front_camera</label>
                                <textarea type="text" name="front_camera" placeholder="Enter "
                                    class="form-control"><?php echo $front_camera ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">speaker</label>
                                <textarea type="text" name="speaker" placeholder="Enter "
                                    class="form-control"><?php echo $speaker ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">wifi</label>
                                <textarea type="text" name="wifi" placeholder="Enter "
                                    class="form-control"><?php echo $wifi ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">bluetooth</label>
                                <textarea type="text" name="bluetooth" placeholder="Enter "
                                    class="form-control"><?php echo $bluetooth ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">security_sensor</label>
                                <textarea type="text" name="security_sensor" placeholder="Enter "
                                    class="form-control"><?php echo $security_sensor ?></textarea>
                            </div>
                            <div class="form-group">
                                <label for="company" class=" form-control-label">battery</label>
                                <textarea type="text" name="battery" placeholder="Enter "
                                    class="form-control"><?php echo $battery ?></textarea>
                            </div>


                            <button name="submit" class="btn btn-lg btn-info btn-block">
                                <span id="payment-button-amount">Submit</span>
                            </button>
                            <div class="field_error">
                                <?php echo $msg ?>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require('footer.inc.php');
?>