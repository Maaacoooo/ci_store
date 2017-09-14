<?php 
/**
 * Copyright (c)2016, Jenmar "Maco" Cortes
 * Copyright TechDepot PH
 * All Rights Reserved
 * 
 * This license is a legal agreement between you and the Maco Cortes
 * for the use of Inventory System referred to as the "Software"
 * By obtaining the Software you agree to comply with the terms and conditions of this license.
 *
 * PERMITTED USE
 * You are permitted to use the program for educational purposes only.
 * 
 * MODIFICATION AND REDISTRIBUTION 
 * Unless with written approval obtained from Maco Cortes, 
 * You are NOT allowed to modify, copy, redistribute, and sell the Software.
 *
 * For any concerns, you may reach Maco Cortes via:
 * maco.techdepot@gmail.com
 * facebook.com/Maaacoooo
 * maco@techdepot-ph.com
 * TechDepot-PH.com
 */
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><?=$title?> &middot; <?=$site_title?></title>
<script>
var myVar=setInterval(function(){myTimer()},1000);
function myTimer() {
var d = new Date();
document.getElementById("demo").innerHTML = d.toLocaleTimeString();
}
</script>
    <?=$this->load->view('css')?>

</head>
<body>
    <div id="wrapper">

        <!--  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">

            <!-- Brand and toggle get grouped for better mobile display -->
            <?=$this->load->view('navbar_header')?>
            <!-- Top Menu Items -->
            <?=$this->load->view('navbar')?>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->

            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper2">
            <div class="container-fluid">
             <div class="panel panel-heading air">
                <!-- Page Heading -->
                <div class="row">
                        <!-- Try TIMING -->
                        <div class="col-md-12">
                            <div class="form-group pull-right">
                                <div class='alert alert-success alert-dismissible' role='alert'>
                                    <abcef>Time: <abcef id="demo"></abcef></abcef>
                                </div>
                            </div>
                        </div>
                        <!-- END TRY TIMING -->
                    <div class="col-md-12">
                        <h1 class="page-header">
                            <font color="white"><?=$title?></font>
                            <div class="btn-group pull-right">
                             <!-- <a href="#category" data-toggle="modal" class="btn btn-sm btn-success">Categories</a>
                              <a href="#brand" data-toggle="modal" class="btn btn-sm btn-primary">Brands</a> -->
                              <a href="#location" data-toggle="modal" class="btn btn-sm btn-default">Location</a>
                            </div>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-flask"></i> <?=$title?>
                            </li>
                        </ol>
                    </div>
                </div>  <!-- /.row -->
                <?php 
                //LOAD MODALS
                 //   $this->load->view('items/category_modal');
                 //   $this->load->view('items/brand_modal');
                    $this->load->view('items/location_modal');

                ?>
                <div class="row">
                    <div class="col-md-12">
                        <?php
                              //ERROR ACTION                          
                                   if($this->session->flashdata('error')) { ?>
                                  <div class="alert alert-danger alert-dismissible" role="alert">
                                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                     </button>
                                     <p><i class="fa fa-warning"></i> <?php echo $this->session->flashdata('error'); ?></p>
                                  </div>
                            <?php } ?> 
                            <?php
                              //SUCCESS ACTION                          
                                   if($this->session->flashdata('success')) { ?>
                                  <div class="alert alert-success alert-dismissible" role="alert">
                                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                     </button>
                                     <p><i class="fa fa-check"></i> <?php echo $this->session->flashdata('success'); ?></p>
                                  </div>
                            <?php } ?>
                    </div> <!-- /.col-lg-12 -->
                </div>
             <!-- ./row -->                
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel trycolor">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-10"> 
                                        <label><lrw>Item Search</lrw></label>
                                        <?=form_open('items/search')?>
                                            <div class="input-group">                                          
                                              <input type="search" class="form-control" name="search" placeholder="Search for...">
                                              <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                              </span>
                                            </div><!-- /input-group -->   
                                        </form>                                  
                                    </div>
                                    <div class="col-xs-2 text-right">
                                        <div class="huge"><lrw><?=$this->db->count_all_results('items')?></lrw></div>
                                        <div class="text-success">Total Items Registered</div>
                                    </div>
                                </div>

                            <style>a{ color:#222; } #a2{ color:white; } lrw{ color:white; }</style>
                            <table class="table table-condensed ver">   
                                <thead>       
                                    <th><lrw>Serial</lrw></th>                                                               
                                    <th><lrw>Item Name</lrw></th>
                                    <th><lrw>Category</lrw></th>
                                    <th><lrw>Brand</lrw></th>
                                    <th><lrw>Cost Price</lrw></th>                                 
                                    <th><lrw>Total Quantity</lrw></th>
                                </thead>
                                <style>t{ color:red; } y{ color:yellow; } ty{ color:green; }</style>
                                <tbody>                            
                            <?php  
                                  if($results) {        
                                                                                                            
                                        foreach ($results as $data)  {   
                                            echo '<tr>';                                                                         
                                            echo '<td><a id="a2" href="'.base_url('items/view/'.$data['id']).'">'.$data['serial'] . '</a></td>';
                                            echo '<td><a id="a2" href="'.base_url('items/view/'.$data['id']).'">'.$data['name'] . '</a></td>';
                                            echo '<td><a id="a2" href="'.base_url('items/view/'.$data['id']).'">'.$data['category'].'</a></td>';
                                            echo '<td><a id="a2" href="'.base_url('items/view/'.$data['id']).'">'.$data['brand'].'</a></td>';
                                         //   echo '<td><a href="'.base_url('items/view/'.$data['id']).'">'.$data['item_category'].'</a></td>';
                                         //   echo '<td><a href="'.base_url('items/view/'.$data['id']).'">'.$data['item_brand'].'</a></td>';                                           
                                            echo '<td><lrw>'.$this->cart->format_number($data['cost_price']).'</lrw></td>';
                                                    //GET THE SUM OF QUANTITY
                                                    $this->db->where('item_id', $data['id']);
                                                    $this->db->select_sum('qty');
                                                    $query = $this->db->get('item_inventory');
                                                    foreach($query->result_array() as $q) {
                                                    if($q['qty']<=20){
                                                        echo '<td><t>'.$q['qty'].'</t></td>';
                                                    }
                                                    elseif($q['qty']<=79){
                                                        echo '<td><y>'.$q['qty'].'</y></td>';
                                                    }
                                                    elseif($q['qty']>=80){
                                                        echo '<td><ty>'.$q['qty'].'</ty></td>';
                                                    }
                                                    else {
                                                        echo '<td>'.$q['qty'].'</td>';
                                                    }

                                                    }
                                            echo '</tr>';                                         
                                        } 
                                    }  
                            ?>
                                </tbody>
                            </table>
                            <div class="pull-right">
                                <?php foreach ($links as $link) { echo $link; } ?>
                            </div>
                        </div>
                        </div>
                    </div> <!-- /.col-lg-12 -->
                </div> <!-- ./row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
            <div class="myfooter">
            <style>h5{ color:white; padding:0 20px;}</style>
            <h5 align="left"> To: STI Dipolog </h5>
        </div>

    <?=$this->load->view('js')?>

</body>
</html>

