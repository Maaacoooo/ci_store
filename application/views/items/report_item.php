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
<html>
    <head>
        <title><?= $title ?> &middot; <?= $site_title ?></title>
        <link rel="stylesheet" type="text/css" href="<?= base_url('assets/css/print.css') ?>">
    </head>
    <body onload="//javascript:print()">
        <h1 align='center'>STI COLLEGE DIPOLOG INC.</h1>
        <h3 align='center'>Malvar Street, Miputak, Dipolog City</h3>
        <h5 style='text-align:center;'><em>System Generated Results of <?= $site_title ?> as of <?= date('M. d, Y') ?> </em></h5>
        <table class="table">

            <thead>
                <tr>
                    <th class="strong">ITEM NAME</th>
                    <th class="strong">CATEGORY</th>
                    <th class="strong">BRAND</th>	
                    <?php if($items['product_type'] =='0') { ?>
                    <th class="strong">COST PRICE</th>
                    <?php } ?>
                    <th class="strong" colspan="2">SERIAL</th>
            </thead>
            <tbody>
            <td><?= $items['name'] ?></td>
            <td><?= $items['category'] ?></td>
            <td><?= $items['brand'] ?></td>
            <?php if($items['product_type'] =='0') { ?>
            <td><?= $items['cost_price'] ?></td>
            <?php } ?>
            <td colspan="6"><?= $items['serial'] ?></td>
        </tbody>
    </tr>
</table>
<table class="table">		  
    <thead>
        <tr>
            <th colspan="7">INVENTORY</th>
        </tr>
        <tr>
            <th width="30%">DATE</th>
            <th>LOCATION</th>
            <th width="10%">IN QTY</th>  
            <?php if ($items['product_type'] == "0") { ?>
            <th width="10%">OUT QTY</th> 
            <?php } ?>
            <?php if (!$items['product_type'] == "0") { ?>
            <th>DEFECTIVE</th>
            <?php } ?>
            <th>UNIT</th>                      
            <th>REMARKS</th> 
        </tr>                                                         
    </thead>
    <tbody>
        <?php foreach ($inventory as $inventory_item): ?> 
            <tr>
                <td><?= unix_to_human(mysql_to_unix($inventory_item['date_time'])) ?></td>
                <td><?= $inventory_item['name'] ?></td>    
                <td><?php
                    if ($inventory_item['tag'] == 'In') {
                        echo $inventory_item['qty'];
                    }//. ' ' . $inventory_item['unit']; } 
                    ?></td>  
                <?php if ($items['product_type'] == "0") { ?>
                <td><?php
                    if ($inventory_item['tag'] == 'Out') {
                        echo ($inventory_item['qty'] * -1);
                    }//. ' ' . $inventory_item['unit']; } 
                    ?></td>  
                <?php } ?>
                    <?php if (!$items['product_type'] == "0") { ?>
                <td id="defect"><?php
                    if ($inventory_item['tag'] == 'Defect') {
                        echo ($inventory_item['qty']);
                    }
                    ?> </td>
                    <?php } ?>
                <td><?= $inventory_item['unit'] ?></td>               
                <td><?= $inventory_item['remarks'] ?></td>                              
            </tr>                              
        <?php endforeach ?> 
        <tr>
            <td class="text-right strong" colspan="2">Total:</td>
            <td class="total success">
                <?php
                //GET THE SUM OF IN QUANTITY
                $this->db->where('item_id', $items['id']);
                $this->db->where('tag', 'In');
                $this->db->select_sum('qty');
                $query = $this->db->get('item_inventory');
                foreach ($query->result_array() as $q) {
                    echo $q['qty']; //. ' ' . $items['unit'];
                    $total_inqty = $q['qty'];
                }
                ?>
            </td>   
            <td class="total success">
                <?php
                //GET THE SUM OF OUT QUANTITY
                $this->db->where('item_id', $items['id']);
                if($items['product_type']==0){
                    $this->db->where('tag', 'Out');
                }else{
                    $this->db->where('tag', 'Defect');
                }
                
                $this->db->select_sum('qty');
                $query = $this->db->get('item_inventory');
                foreach ($query->result_array() as $q) {
                    echo ($q['qty']); //. ' ' . $items['unit'];
                    $total_outqty = $q['qty'];
                }
                
                
                ?>
            </td>                                
            <td class="strong success total" colspan="3">BALANCE:</td>
        </tr> 
        <tr>
            <td class="text-right strong" colspan="2">Item Cost:</td>                                
            <td class="success" colspan="2"><?= $this->cart->format_number($items['cost_price']) ?></td>
            <td class="strong">QTY BAL</td>
            <td class="danger" colspan="2"><?= $total_inqty - $total_outqty ?> <?//=$items['unit']?></td>
        </tr>
        <tr>
            <td class="text-right strong" colspan="2">Total Cost:</td>                                
            <td class="danger"><?= $this->cart->format_number($total_inqty * $items['cost_price']) ?></td>
            <td class="danger"><?= $this->cart->format_number($total_outqty * $items['cost_price']) ?></td>
            <td class="strong">BAL COST</td>
            <td class="danger" colspan="2"><?= $this->cart->format_number(($total_inqty - $total_outqty) * $items['cost_price']) ?></td>
        </tr>                                
    </tbody>
</table>
</body>
</html>