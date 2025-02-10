
<?php
class add_to_compare{
    function addProduct1($pid,$qty){
        $_SESSION['compare'][$pid]['qty']=$qty;
    }
    function updateProduct1($pid,$qty){
        if(isset($_SESSION['compare'][$pid])){
            $_SESSION['compare'][$pid]['qty']=$qty;

        }
    }
    function removeProduct1($pid){
        if(isset($_SESSION['compare'][$pid])){
           unset($_SESSION['compare'][$pid]);

        }
    }
    function emptyProduct1(){
        unset( $_SESSION['compare']);
    }
    function totalProduct1(){
        if(isset($_SESSION['compare'])){
        return count($_SESSION['compare']);
        }
        else{
            return 0;
        }
    }
}?>