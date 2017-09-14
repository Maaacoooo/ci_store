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

        <title><?= $title ?> &middot; <?= $site_title ?></title>

        <?= $this->load->view('css') ?>
    </head>
    <body onload="bootstrap_tab_bookmark()">
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

            <div id="page-wrapper3">
                <div class="container-fluid">
                    <div class="panel panel-heading fire">

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
                                    <font color="#fff"><?= $title ?></font>
                                    <div class="btn-group pull-right">
                                        <a href="<?= base_url('items/report/' . $items['id']) ?>" class="btn btn-sm btn-primary" target="_blank">Print Item Report</a>
                                        <button data-toggle="modal" data-target="#UpdateInventory" class="btn btn-sm btn-success">Update Inventory</button>
                                    </div>
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <a href="<?= base_url('items') ?>"><i class="fa fa-flask"></i> Items</a>
                                    </li>
                                    <li class="active">
                                        <?= $title ?>
                                    </li>
                                </ol>
                            </div>
                        </div>            
                        <?= $this->load->view('items/add_inventory_modal') ?>
                        <!-- /.row -->
                        <font color="#fff">
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
                            <div class="col-md-12">
                                <!-- NAV TABS -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <style>a{ color:#00bc8c; } asd{ color:#fff; } thead{ color:#fff; } #tr2{ color:#fff; } #th2{ color:#fff; }</style>
                                    <li role="presentation" class="active"><a href="#item" aria-controls="item" role="tab" data-toggle="tab">Item Info</a></li> 
                                    <li role="presentation"><a href="#inventory" aria-controls="inventory" role="tab" data-toggle="tab">Inventory</a></li>                       
                                    <li role="presentation"><a href="#logs" aria-controls="logs" role="tab" data-toggle="tab">Logs</a></li>
                                </ul>
                                <!-- END NAV -->
                                <!-- TAB CONTENT -->
                                <div class="tab-content">
                                    <!-- PERSONAL TAB -->
                                    <div role="tabpanel" class="tab-pane fade in active" id="item">
                                        <?= form_open_multipart('items/update') ?>                                             
                                        <div class="row"> 
                                            <div class="col-md-12">
                                                <div class="checkbox pull-right">
                                                    <label><input type="checkbox" id="checkMe">Update Item</label>
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <asd for="itemname">Item Name</asd>
                                                    <input type="text" class="form-control" id="itemname" name="itemname" placeholder="Enter Item Name..." value="<?= $items['name'] ?>" required readonly>
                                                </div>                                
                                                <div class="form-group">
                                                    <asd for="serial">Serial</asd>
                                                    <input type="text" class="form-control" id="serial" name="serial" placeholder="Enter Serial..." value="<?= $items['serial'] ?>"  readonly>
                                                </div>
                                                <div class="form-group">
                                                    <asd for="description">Description</asd>
                                                    <textarea class="form-control" name="description" id="description" readonly><?= $items['description'] ?></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <asd>Unit</asd>
                                                    <input type="text" class="form-control" id="unit" name="unit" placeholder="Enter Item Unit..." value="<?= $items['unit'] ?>" readonly>
                                                </div>                              
                                            </div>
                                            <div class="col-md-4">  
                                                <?php if ($items['product_type'] == "0") { ?>
                                                    <div class="form-group">
                                                        <asd for="cost">Item Cost</asd>
                                                        <input type="number" class="form-control" id="cost" name="cost" placeholder="Enter Item Cost..." value="<?= $items['cost_price'] ?>" required readonly>
                                                    </div>      
                                                <?php } ?>
                                                <div class="form-group">
                                                    <asd for="category">Category</asd>
                                                    <input type="text" class="form-control" id="category" name="category" placeholder="Enter Item Category..." value="<?= $items['category'] ?>" required disabled>
                                                </div>
                                                <div class="form-group">
                                                    <asd for="brand">Brand</asd>
                                                    <input type="text" class="form-control" id="brand" name="brand" placeholder="Enter Item Brand..." value="<?= $items['brand'] ?>" disabled>
                                                </div>                            
                                                <input type="hidden" name="id" value="<?= $items['id'] ?>">                                  
                                                <div class="form-group">
                                                    <div class="checkbox pull-right">
                                                        <label>
                                                           <!-- <input type="checkbox" id="checkdelete" onclick="enabledelete()"> Delete -->
                                                        </label>
                                                        <div class="btn-group">
                                                            <!--   <button class="btn btn-danger" id="delete" type="button" onclick="submit_delete()" disabled>Delete</button>-->
                                                            <button class="btn btn-warning" id="submit" type="submit" disabled>Update</button>
                                                        </div>
                                                    </div>                                         
                                                </div>
                                            </div> 
                                        </div>
                                        </form>
                                        </font>
                                    </div>
                                    <!-- END PERSONAL TAB -->
                                    <!-- INVENTORY TAB -->
                                    <div role="tabpanel" class="tab-pane fade" id="inventory">
                                        <?php if (!$inventory) { ?>
                                            <div class="alert alert-danger margin-top-10" role="alert">
                                                <strong>Oops!</strong> No results found.
                                            </div>
                                        <?php } else { ?>           
                                            <table class="table table-condensed table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>DATE</th>
                                                        <th>LOCATION</th>
                                                        <th>IN QTY</th>
                                                        <?php // Check if equipment ?>
                                                        <?php if ($items['product_type'] == "0") { ?>
                                                            <th>OUT QTY</th> 
                                                        <?php } ?>
                                                        <?php // Check if proware ?>
                                                        <?php if (!$items['product_type'] == "0") { ?>
                                                            <th>DEFECTIVE</th> 
                                                        <?php } ?>
                                                        <th>UNIT</th>                           
                                                        <th>Remarks</th> 
                                                    </tr>                
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($inventory as $inventory_item): ?> 
                                                        <tr id="tr2">
                                                            <td><?= unix_to_human(mysql_to_unix($inventory_item['date_time'])) ?></td>
                                                            <td><?= $inventory_item['name'] ?></td>  
                                                            <td>
                                                                <?php
                                                                if ($inventory_item['tag'] == 'In') {
                                                                    echo $inventory_item['qty'];
                                                                }//. ' ' . $inventory_item['unit']; } 
                                                                ?>
                                                            </td>  
                                                            <?php if ($items['product_type'] == "0") { ?>
                                                                <td>
                                                                    <?php
                                                                    if ($inventory_item['tag'] == 'Out') {
                                                                        echo ($inventory_item['qty'] * -1);
                                                                    }//. ' ' . $inventory_item['unit']; }
                                                                    ?>
                                                                </td>  
                                                            <?php } ?>
                                                            <?php if (!$items['product_type'] == "0") { ?>
                                                                <td>
                                                                    <?php
                                                                    if ($inventory_item['tag'] == 'Defect') {
                                                                        echo ($inventory_item['qty']);
                                                                    }
                                                                    ?>
                                                                </td>
                                                            <?php } ?>
                                                            <td><?= $inventory_item['unit'] ?></td>                    
                                                            <td><?= $inventory_item['remarks'] ?></td>                              
                                                        </tr>          
                                                    <?php endforeach ?>
                                                    <tr>
                                                        <td class="text-right strong" colspan="2"><font color="#fff">Total:</font></td>
                                                        <td class="total success">
                                                            <?php
                                                            //GET THE SUM OF IN QUANTITY

                                                            $this->db->where('item_id', $items['id']);
                                                            $this->db->where('tag', 'In');
                                                            $this->db->select_sum('qty');
                                                            $query = $this->db->get('item_inventory');
                                                            foreach ($query->result_array() as $q) {
                                                                if ($q) {
                                                                    echo $q['qty']; //. ' ' . $items['unit'];
                                                                    $total_inqty = $q['qty'];
                                                                } elseif ($q >= 0) {
                                                                    echo $q['qty'];
                                                                    $total_inqty = $q['qty'];
                                                                }
                                                            }
                                                            ?>
                                                        </td>   
                                                        <td class="total success">
                                                            <?php
                                                            //GET THE SUM OF OUT QUANTITY
                                                            $tag = ($items['product_type'] == '0') ? 'Out' : 'Defect';

                                                            $this->db->where('item_id', $items['id']);
                                                            $this->db->where('tag', $tag);
                                                            $this->db->select_sum('qty');
                                                            $query = $this->db->get('item_inventory');

                                                            $result = $query->result_array();

                                                            foreach ($result as $q) {
                                                                if ($q) {

                                                                    $total_outqty = ($tag == 'Out') ? $q['qty'] * -1 : $q['qty'];

                                                                    echo ($total_outqty); //. ' ' . $items['unit'];
                                                                }
                                                            }
                                                            ?>
                                                        </td>                            
                                                        <td class="strong info total" colspan="2">BALANCE:</td>
                                                    </tr> 
                                                    <tr>
                                                        <td class="text-right strong" colspan="2"><font color="#fff">Item Cost:</font></td>                                
                                                        <td class="success" colspan="2"><?= $this->cart->format_number($items['cost_price']) ?></td>
                                                        <td class="strong"><font color="#fff">QTY BAL</font></td>
                                                        <td class="warning"><?= $total_inqty - $total_outqty ?> <?//=$items['unit']?></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-right strong" colspan="2"><font color="#fff">Total Cost:</font></td>                                
                                                        <td class="danger"><?= $this->cart->format_number($total_inqty * $items['cost_price']) ?></td>
                                                        <td class="danger"><?= $this->cart->format_number($total_outqty * $items['cost_price']) ?></td>
                                                        <td class="strong"><font color="#fff">BAL COST</font></td>
                                                        <td class="warning"><?= $this->cart->format_number(($total_inqty - $total_outqty) * $items['cost_price']) ?></td>
                                                    </tr>                             
                                                </tbody>
                                            </table>
                                        <?php } ?>
                                    </div>
                                    <!-- END INVENTORY TAB -->                      
                                    <!-- LOGS TAB -->
                                    <div role="tabpanel" class="tab-pane fade" id="logs">
                                        <?php if (!$logs) { ?>
                                            <div class="alert alert-danger margin-top-10" role="alert">
                                                <strong>Oops!</strong> No results found.
                                            </div>
                                        <?php } else { ?>                                                 
                                            <table class="table table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th id="th2"></th>
                                                        <th>Date</th>
                                                        <th>User</th> 
                                                    </tr>                                                         
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($logs as $logs_item): ?> 
                                                        <tr>                             
                                                            <td><font color="#fff"><?= $logs_item['action'] ?></font></td>
                                                            <td><font color="#fff"><?= unix_to_human(mysql_to_unix($logs_item['date_time'])) ?></font></td>
                                                            <td><font color="#fff"><?= $logs_item['name'] ?> <?= $logs_item['badge'] ?></font></td>
                                                        </tr>
                                                    <?php endforeach ?>                              
                                                </tbody>
                                            </table>
                                        <?php } ?>
                                    </div>
                                    <!-- END LOGS TAB -->
                                </div>
                                <!-- END TAB CONTENT -->   
                                <!-- HIDDEN DELETE FORM-->
                                <?= form_open('items/delete', array('id' => 'deleteform')) ?>                        
                                <input type="hidden" name="id" value="<?= $items['id'] ?>">
                                </form>
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



            <?= $this->load->view('js') ?>

            <script src="<?=base_url('assets/js/inventory_script.js') ?>"></script>
    </body>
</html>

<!--  <div class="form-group">
   <label for="brand">Brand</label>
   <select name="brand" class="form-control" id="brand" required disabled>
     <option></option>
<?php foreach ($brands as $brand): ?>
                                                                                                                                   <option value="<?= $brand['id'] ?>" <?php
    if ($items['brand_id'] == $brand['id']) {
        echo 'selected';
    }
    ?>><?= $brand['name'] ?></option> 
<?php endforeach; ?>                                                        
   </select>                  
 </div> --> 
<!-- <div class="form-group">
<label for="category">Category</label>
<select name="category" class="form-control" id="category" required disabled>
<option></option>
<?php foreach ($categories as $category): ?>
                                                                                                                            <option value="<?= $category['id'] ?>" <?php
    if ($items['category_id'] == $category['id']) {
        echo 'selected';
    }
    ?>><?= $category['name'] ?></option>                                        
<?php endforeach; ?>                              


</select>                  
</div> -->

<!--    <div class="form-group">
      <label for="unit">Unit</label>
      <input type="text" class="form-control" id="unit" name="unit" placeholder="Enter Unit..." value="<?= $items['unit'] ?>" required readonly>
    </div> -->