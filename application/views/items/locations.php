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

        <div id="page-wrapper">

            <div class="container-fluid"><br>
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
                            <font color="white"><?=$title?></font>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> <?=$title?>
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <label>Location Search</label>
                                        <?=form_open('items/location_search')?>
                                            <div class="input-group">                                          
                                              <input type="search" class="form-control" name="search" placeholder="Search for...">
                                              <span class="input-group-btn">
                                                <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                              </span>
                                            </div><!-- /input-group -->   
                                        </form>   
                            </div>
                            <div class="panel-body">
                                <style> #a2{ color:#222; } </style>
                                <table class="table table-condensed table-hover ver">
                                <?php foreach ($locations as $location):?>
                                <tr>    
                                <td><a id="a2" href="<?=base_url('items/report_loc/'.$location['id'])?>" target="_blank"><?=$location['name']?></a></td>
                                </tr>
                                <?php endforeach ?>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
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

