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

        <div id="page-wrapper2" class="page-wrapper">
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
                    <div class="col-lg-12">
                        <h1 class="page-header">
                           <font color="white"> <?=$title?></font>
                            <div class="btn-group pull-right">
                            <!--  <a href="#category" data-toggle="modal" class="btn btn-sm btn-success">Categories</a>
                              <a href="#brand" data-toggle="modal" class="btn btn-sm btn-primary">Brands</a> -->
                              <a href="#location" data-toggle="modal" class="btn btn-sm btn-default">Location</a>
                            </div>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <a href="<?=base_url('items')?>"><i class="fa fa-flask"></i> Items</a>
                            </li>
                            <li class="active">
                                <?=$title?>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <?php 
                //LOAD MODALS
                  //  $this->load->view('items/category_modal');
                  //  $this->load->view('items/brand_modal');
                    $this->load->view('items/location_modal');

                ?>
             
                <div class="row">
                    <div class="col-md-12">
                            <?php
                              //SUCCESS ACTION                          
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
                            <?php
                              //FORM VALIDATION ERROR
                                  $this->form_validation->set_error_delimiters('<p><i class="fa fa-times-circle"></i> ', '</p>');
                                   if(validation_errors()) { ?>
                                  <div class="alert alert-danger alert-dismissible" role="alert">
                                     <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                     </button>
                                     <?php echo validation_errors(); ?>
                                  </div>
                            <?php } ?>  
                          </div>

                    <?=form_open_multipart('items/itemequipment')?>
                    <div class="col-lg-8">
                            <div class="row">
                           <div class="col-md-12">
                                    <h2 class="section-header"><font color="white">Item Information</font></h2>
                                </div>
                            </div>
                            <div class="row">       
                            <style>
                            label{
                              color:white;
                            }
                            asd{
                              color:white;
                            }
                            </style>                
                                <div class="col-md-8">
                                  <div class="form-group">
                                    <asd for="myname">Item Name</asd>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter Item Name..." value="<?php echo set_value('name');?>" required>
                                  </div>                                
                                  <div class="form-group">
                                   <asd for="itemname">Serial</asd>
                                    <input type="number" class="form-control" id="serial" name="serial" placeholder="Enter Serial..." value="<?php echo set_value('serial');?>" >
                                  </div>    
                                  <div class="form-group">
                                    <asd for="description">Description</asd>
                                   <textarea class="form-control" name="description" rows="8"><?php echo set_value('description');?></textarea>
                                  </div>  
                                    <div class="form-group">
                                    <asd for="unit">Unit</asd>
                                    <input type="text" class="form-control" id="unit" name="unit" placeholder="Enter Unit..." value="<?php echo set_value('unit');?>" required>
                                  </div>                                  
                              </div>
                              <div class="col-md-4">     
                                  <div class="form-group">
                                    <asd>Inning Status</asd>
                                    <select name="status" class="form-control">
                                      <option value=""></option>
                                      <option value="In" <?php echo set_select('status', 'In'); ?>>In</option>
                                      <option value="Out" <?php echo set_select('status', 'Out'); ?>>Out</option>
                                    </select>
                                  </div>                            
                                  <div class="form-group">
                                    <asd for="quantity">Quantity</asd>
                                    <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter Item Quantity..." min="1" value="<?php echo set_value('quantity');?>">
                                  </div>
                                  <div class="form-group">
                                    <asd for="location">Location</asd>
                                    <select name="location" class="form-control">
                                      <option></option>
                                      <?php foreach($locations as $location): ?>
                                        <option value="<?=$location['id']?>" <?php echo set_select('location', $location['id']); ?>><?=$location['name']?></option>
                                      <?php endforeach;?>                                                        
                                    </select>                  
                                  </div>
                                   <div class="form-group">
                                    <asd for="Category">Category</asd>
                                    <input type="text" class="form-control" id="category" name="category" placeholder="Enter Item Category..." value="<?php echo set_value('category');?>" required>
                                  </div>  
                                    <div class="form-group">
                                    <asd for="brand">Brand</asd>
                                    <input type="text" class="form-control" id="brand" name="brand" placeholder="Enter Item Brand..." value="<?php echo set_value('brand');?>">
                                  </div>                                            
                              </div>
                          <div class="col-md-12">
                              <div class="form-group pull-right">
                              <input type="submit" class="btn btn-lg btn-primary" value="Register Item">
                              </div>                                                   
                          </div>
                        </form>
                      </div>
                      </div>                              
                    </div>                    
                    </form>
                </div>
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

                                <!--  <div class="form-group">
                                    <asd for="category">Category</asd>
                                    <select name="category" class="form-control" required>
                                      <option></option>
                                      <?php foreach($categories as $category): ?>
                                        <option value="<?=$category['id']?>" <?php echo set_select('category', $category['id']); ?>><?=$category['name']?></option>
                                      <?php endforeach;?>                                                        
                                    </select>                  
                                  </div> 

                                  <div class="form-group">
                                    <asd for="brand">Brand</asd>                            
                                   <select name="brand" class="form-control" required>
                                      <option></option>
                                      <?php foreach($brands as $brand): ?>
                                        <option value="<?=$brand['id']?>" <?php echo set_select('brand', $brand['id']); ?>><?=$brand['name']?></option>
                                      <?php endforeach;?>                                                        
                                    </select>
                                  </div>  -->  