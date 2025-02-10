<?php
require('top.inc.php');

if(isset($_GET['type']) && $_GET['type']!=''){
   $type=get_safe_value($con,$_GET['type']);
   if($type=='status')
   {
      $operation=get_safe_value($con,$_GET['operation']);
      $id=get_safe_value($con,$_GET['id']);
      if($operation=='active')
      {
         $status='1';
      }
      else{
         $status='0';
      }
      $update_status="update product set status='$status' where id='$id'";
      mysqli_query($con,$update_status);
   }
   if($type=='delete')
   {
      $id=get_safe_value($con,$_GET['id']);
      $delete_sql="delete from product where id='$id'";
      mysqli_query($con,$delete_sql);
   }
}



$sql="select product.*,categories.categories from product,categories where
 product.categories_id=categories.id order by product.id desc";
$res=mysqli_query($con,$sql);
?>
<div class="content pb-0">
   <div class="orders">
      <div class="row">
         <div class="col-xl-12">
            <div class="card">
               <div class="card-body">
                  <h4 class="box-title">Products</h4>
                  <h2 class="box-title"><a href="add_product.php">Add Product</a></h2>
               </div>
               <div class="card-body--">
                  <div class="table-stats order-table ov-h">
                     <table class="table ">
                        <thead>
                           <tr>
                              <th class="serial">SN</th>
                              <th>ID</th>
                              <th>Categories</th>
                              <th>Name</th>
                              <th>Image</th>
                              
                              <th>Price</th>
                              <th>Qty</th>
                              <th></th>

                           </tr>
                        </thead>
                        <tbody>
                           <?php 
                           $i=1;
                           while($row=mysqli_fetch_assoc($res)){?>
                           <tr>
                              <td class="serial"><?php echo $i?></td>
                              <td><?php echo $row['id']?></td>
                              <td><?php echo $row['categories']?></td>
                              <td><?php echo $row['name']?></td>
                              <td><img src="../media/product/<?php echo $row['image']?>"/></td>
                              
                              <td><?php echo $row['price']?></td>
                              <td><?php echo $row['qty']?><br/>
                              <?php
                              
                              $checkProduct = checkProduct($con,$row['id']);
                              $Pending_qty = $row['qty'] - $checkProduct;
                              echo "Pending Qty: ". $Pending_qty;
                              ?>
                         
                           </td>
                            
                          

                              <td>
                                 <?php 
                                 if( $row['status']==1){
                                    echo "<a href='?type=status&operation=deactive&id=".$row['id']."'>Active</a>&nbsp";
                                 }
                                 else{
                                    echo "<a href='?type=status&operation=active&id=".$row['id']."'>Deactive</a>&nbsp";
                                 }
                                 echo "<a href='?type=delete&id=".$row['id']."'>Delete</a>&nbsp";
                                 echo "<a href='add_product.php?type=edit&id=".$row['id']."'>Edit</a>";
                                 ?>
                              </td>
                           </tr>
                           <?php $i++;}?>
                        </tbody>
                     </table>
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