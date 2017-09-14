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
$test = "I am doing something";
?>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title><?= $title ?> &middot; <?= $site_title ?></title>
        <script>
            var myVar = setInterval(function () {
                myTimer()
            }, 1000);
            function myTimer() {
                var d = new Date();
                document.getElementById("demo").innerHTML = d.toLocaleTimeString();
            }
        </script>
        <?= $this->load->view('css') ?>

    </head>

    <body>

        <div id="wrapper">

            <!--  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> -->
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <?= $this->load->view('navbar_header') ?>
                <!-- Top Menu Items -->
                <?= $this->load->view('navbar') ?>

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
                            <div class="col-lg-12">
                                <h1 class="page-header">
                                    <font color="white"> <?= $title ?></font>
                                </h1>
                                <ol class="breadcrumb">
                                    <li class="active">
                                        <i class="fa fa-users"></i> <?= $title ?>
                                    </li>
                                </ol>
                            </div>
                        </div>  <!-- /.row -->

                        <div class="row">
                            <div class="col-lg-12">
                                <?php
                                //ERROR ACTION                          
                                if ($this->session->flashdata('error')) {
                                    ?>
                                    <div class="alert alert-danger alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <p><i class="fa fa-warning"></i> <?php echo $this->session->flashdata('error'); ?></p>
                                    </div>
                                <?php } ?> 
                                <?php
                                //SUCCESS ACTION                          
                                if ($this->session->flashdata('success')) {
                                    ?>
                                    <div class="alert alert-success alert-dismissible" role="alert">
                                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <p><i class="fa fa-check"></i> <?php echo $this->session->flashdata('success'); ?></p>
                                    </div>
                                <?php } ?>
                            </div> <!-- /.col-lg-12 -->
                        </div> <!-- ./row -->

                        <div class="row">
                            <div class="col-lg-12">                                                  
                                <?php
                                if ($results) {
                                    ?>
                                    <div class="panel panel-inverse">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-10"> 
                                                    <label>Item Search</label>
                                                    <?= form_open('items/search') ?>
                                                    <div class="col-xs-8">
                                                        <div class="input-group">                                          
                                                            <input type="search" name="search" class="form-control" placeholder="Search for...">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                                            </span>
                                                        </div><!-- /input-group --> 
                                                    </div> 
                                                    </form>                                  
                                                </div>
                                                <div class="col-xs-2 text-right">
                                                    <div class="huge"><?= $total_results ?></div>
                                                    <div class="text-success">Total Found</div>
                                                </div>
                                            </div>

                                            <table class="table table-condensed table-hover ver">   
                                                <thead>       
                                                <th>Serial</th>                                                               
                                                <th>Item Name</th>
                                                <th>Category</th>
                                                <th>Brand</th>
                                                <th>Cost Price</th>                                 
                                                <th>Total Quantity</th>                                                                      
                                                </thead>
                                                <tbody>    
                                                <style>a{ color:#222; } a:hover{ color:#222; }</style>
                                                <?php
                                                if ($results) {

                                                    foreach ($results as $data) {
                                                        echo '<tr>';
                                                        echo '<td><a href="' . base_url('items/view/' . $data['item_id']) . '">' . $data['serial'] . '</a></td>';
                                                        echo '<td><a href="' . base_url('items/view/' . $data['item_id']) . '">' . $data['name'] . '</a></td>';
                                                        echo '<td><a href="' . base_url('items/view/' . $data['item_id']) . '">' . $data['category'] . '</a></td>';
                                                        echo '<td><a href="' . base_url('items/view/' . $data['item_id']) . '">' . $data['brand'] . '</a></td>';
                                                        // echo '<td><a href="'.base_url('items/view/'.$data['item_id']).'">'.$data['item_category'].'</a></td>';
                                                        // echo '<td><a href="'.base_url('items/view/'.$data['item_id']).'">'.$data['item_brand'].'</a></td>';                                            
                                                        echo '<td>' . $this->cart->format_number($data['cost_price']) . '</td>';
                                                        echo '<td>';
                                                        //GET THE SUM OF QUANTITY
                                                        $this->db->where('item_id', $data['item_id']);
                                                        $this->db->select_sum('qty');
                                                        $query = $this->db->get('item_inventory');
                                                        foreach ($query->result_array() as $q) {
                                                            echo $q['qty'];
                                                        }
                                                        echo '</td>';
                                                        echo '</tr>';
                                                    }
                                                }
                                                ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                <?php } else {
                                    ?>                               
                                    <div class="panel panel-inverse">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-10"> 
                                                    <label>Item Search</label>
                                                    <?= form_open('items/search') ?>
                                                    <div class="col-xs-8">
                                                        <div class="input-group">                                          
                                                            <input type="search" name="search" class="form-control" placeholder="Search for...">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                                            </span>
                                                        </div><!-- /input-group --> 
                                                    </div> 
                                                    </form>                                  
                                                </div>
                                                <div class="col-xs-2 text-right">
                                                    <div class="huge"><?= $total_results ?></div>
                                                    <div class="text-success">Total Found</div>
                                                </div>
                                            </div>
                                        </div>
                                        <table class="table table-condensed table-hover ver">   
                                            <tbody>                            
                                            <div class="alert alert-danger" role="alert">
                                                <strong>Oops!</strong> No Results found!
                                            </div>
                                            </tbody>
                                        </table>
                                    </div>


                                <?php } ?>                               
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

            <?= $this->load->view('js') ?>



    </body>

</html>







