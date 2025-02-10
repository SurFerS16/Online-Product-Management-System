<?php
function pr($arr){
    echo '<pre>';
    print_r($arr);
}

function prx($arr){
    echo '<pre>';
    print_r($arr);
    die();
}
function get_safe_value($con,$str){
    if(($str!='')){
        $str=trim($str);
        return mysqli_real_escape_string($con,$str);
    }
}
function get_product($con,$limit='',$cat_id='',$product_id='',$search_str='',$sort_order='',$is_best_seller=''){
    
    $sql="select * from product where status=1 ";
    if($cat_id!=''){
        $sql.=" and categories_id=$cat_id ";
    }
    if($product_id!=''){
        $sql.=" and id=$product_id ";
    }
    if($is_best_seller!=''){
        $sql.=" and product.best_seller=1 ";
    }
    
    
    if($search_str!=''){
        $sql.=" and (product.name like '%$search_str%' or product.description like '%$search_str%')";
    }
    if($sort_order!=''){
        $sql.=$sort_order;
    }
    else{
        $sql.=" order by product.id desc";
    }


    if($limit!=''){
        $sql.=" limit $limit";
    }
  
    $res=mysqli_query($con,$sql);
    $data=array();
    while($row=mysqli_fetch_assoc($res)){
        $data[]=$row;
    }
    return $data;

}

function checkProduct($con,$pid)
{
    $sql = "select sum(order_detail.qty) as qty from order_detail, `order` 
    where `order`.id=order_detail.order_id and order_detail.product_id=$pid and `order`.order_status!=4 and ((`order`.payment_type='esewa' and `order`.payment_status='Success') or (`order`.payment_type='COD' and `order`.payment_status!=''))";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($res);
    return $row['qty'];
}
function ProductQty($con,$pid)
{
    $sql = "select qty from product where id='$pid'";
    $res = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($res);
    return $row['qty'];
}
?>