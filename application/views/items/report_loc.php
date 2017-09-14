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
        <h4 align='center'>Malvar Street, Miputak, Dipolog City</h4>
        <h5 align="center"><em>Schedule of Inventory (<?= $items['name'] ?>)</em></h5>  
        <h5 align="center">System Generated Results of <?= $site_title ?> as of <?= date('M. d, Y') ?> </h5>

        <table class="table">		  
            <thead>		       
            <em>A) <?= $items['name'] ?> (Furnitures, Fixtures & Equipment & Others)</em>
            <tr>
                <th width="1%">Item <br>no.</th>
                <th>SERIAL</th>
                <th>ITEM NAME</th>
                <th>CATEGORY</th>
                <th>BRAND</th>  
                <?php if ($items['name'] == 'Proware') { ?>
                    <th>COST PRICE</th>  
                <?php } ?>
                <th width="10%">IN QTY</th>
                <th width="10%">OUT QTY</th> 
                <?php if ($items['name'] != 'Proware') { ?>
                    <th>DEFECTIVE</th>  
                <?php } ?>
                <th width="10%">BAL QTY</th>
                <th width="10%">UNIT</th>
                <th>BAL COST</th>
            </tr>
            <?php
            $total_quantity[] = 0;
            $total_cost[] = 0;
            $this->db->select('items.name, 
            items.category, 
            items.cost_price,             
            items.brand, 
            items.id, 
            items.unit,
            items.serial,
            item_inventory.id,
            item_inventory.qty, 
            item_inventory.item_id AS item_id,
            items.name AS item_name');
            $this->db->where('item_inventory.loc_id', $items['id']);
            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
            $this->db->group_by('item_inventory.item_id');
            $this->db->order_by('items.name', 'ASC');
            $query = $this->db->get("item_inventory");
            $x = 1;
            echo '</thead>';
            echo '</tbody>';
            foreach ($query->result() as $row) {
                echo '<tr>';
                echo '<td>' . $x++ . '.</td>';
                echo '<td>' . $row->serial . '</td>';
                echo '<td>' . $row->item_name . '</td>';
                echo '<td>' . $row->category . '</td>';
                echo '<td>' . $row->brand . '</td>';
                if ($items['name'] == 'Proware') {
                    echo '<td>' . $this->cart->format_number($row->cost_price) . '</td>';
                }
                //GET THE SUM OF IN QUANTITY
                $this->db->where('item_id', $row->item_id);
                $this->db->where('tag', 'In');
                $this->db->select_sum('qty');
                $query = $this->db->get('item_inventory');
                foreach ($query->result_array() as $q) {
                    $qty = $q['qty'];
                    $intotal = $qty;
                    echo '<td>' . $qty . '</td>';
                }
                //GET THE SUM OF OUT QUANTITY
                $this->db->where('item_id', $row->item_id);
                $this->db->where('tag', 'Out');
                $this->db->select_sum('qty');
                $query = $this->db->get('item_inventory');
                foreach ($query->result_array() as $q) {
                    $qty = $q['qty'];
                    $outtotal = $qty;
                    echo '<td>' . $qty * -1 . '</td>';
                }
                if ($items['name'] != 'Proware') {
                    $this->db->where('item_id', $row->item_id);
                    $this->db->where('tag', 'Defect');
                    $this->db->select_sum('qty');
                    $query = $this->db->get('item_inventory');
                    foreach ($query->result_array() as $q) {
                        $qty = $q['qty'];
                        $outtotal = $qty;
                        echo '<td>' . $qty . '</td>';
                    }
                }
                echo '<td>' . ($intotal + $outtotal) . '</td>';
                echo '<td>' . $row->unit . '</td>';
                echo '<td>' . $this->cart->format_number(($intotal + $outtotal) * $row->cost_price) . '</td>';

                $total_quantity[] = $intotal + $outtotal;
                $total_cost[] = ($intotal + $outtotal) * $row->cost_price;
            }
            ?>  
        </tr>
        <tr>
            <td class="text-right strong" colspan="8">Total:</td>
            <td class="total success" colspan="2"><?= array_sum($total_quantity) ?></td>

            <td class="total danger"><?= $this->cart->format_number(array_sum($total_cost)) ?></td>                               
        </tr>                         
    </tbody>
</table>
<table>
    <tr>
        <td><p style='padding-left:0px;'>Prepared by:</p></td>
        <td><p style='padding-left:420px; padding-top:40px;'> Noted by:</p><br></td>
    </tr>
    <tr>
        <td><h4 style='padding-left:0px;'>GEMMA O. GEROMO-SUMILE</h4></td>
        <td><h4 style='padding-left:420px;'>JUDITH A. FALCONETE</h4></td>
    </tr>
    <tr>
        <td><p style='padding-left:0px;'>STI-Dipolog</p></td>
        <td><p style='padding-left:420px;'>School Administrator</p></td>
    </tr>
</table>
</body>
</html>


<!-- BACKUP PLAN
<html>
<head>
  <title><?= $title ?> &middot; <?= $site_title ?></title>
  <link rel="stylesheet" type="text/css" href="<?= base_url('assets/css/print.css') ?>">
</head>
<body onload="javascript:print()">
  <h1 align='center'>STI COLLEGE DIPOLOG INC.</h1>
  <h4 align='center'>Malvar Street, Miputak, Dipolog City</h4>
  <h5 align="center"><em>Schedule of Inventory (<?= $items['name'] ?>)</em></h5>  
  <h5 align="center">System Generated Results of <?= $site_title ?> as of <?= date('M. d, Y') ?> </h5>

  <table class="table">     
    <thead>          
            <em>A) <?= $items['name'] ?> (Furnitures, Fixtures & Equipment & Others</em>
          <tr>
            <th width="1%">Item <br>no.</th>
            <th>SERIAL</th>
            <th>ITEM NAME</th>
            <th>CATEGORY</th>
            <th>BRAND</th>  
                                     
            <th>COST PRICE</th>  
            <th width="10%">IN QTY</th>
            <th width="10%">OUT QTY</th>
            <th>UNIT</th>  
            <th width="10%">BAL QTY</th>
            <th>BAL COST</th>
          </tr>
<?php
$total_quantity[] = 0;
$total_cost[] = 0;
$this->db->select('items.name, 
            items.category_id, 
            items.cost_price,             
            items.brand_id, 
            items.id, 
            items.unit,
            items.serial,
            item_inventory.qty, 
            item_inventory.item_id AS item_id,
            items.name AS item_name,
            item_brand.name AS item_brand, 
            item_category.name AS item_category');
$this->db->where('item_inventory.loc_id', $items['id']);
$this->db->join('items', 'items.id = item_inventory.item_id', 'left');
$this->db->join('item_brand', 'item_brand.id = items.brand_id', 'left');
$this->db->join('item_category', 'item_category.id = items.category_id', 'left');
$this->db->group_by('item_inventory.item_id');
$this->db->order_by('items.name', 'ASC');
$query = $this->db->get("item_inventory");
$x = 1;
echo '</thead>';
echo '</tbody>';
foreach ($query->result() as $row) {
    echo '<tr>';
    echo '<td>' . $x++ . '.</td>';
    echo '<td>' . $row->serial . '</td>';
    echo '<td>' . $row->item_name . '</td>';
    echo '<td>' . $row->item_category . '</td>';
    echo '<td>' . $row->item_brand . '</td>';

    echo '<td>' . $this->cart->format_number($row->cost_price) . '</td>';
    //GET THE SUM OF IN QUANTITY
    $this->db->where('item_id', $row->item_id);
    $this->db->where('tag', 'In');
    $this->db->select_sum('qty');
    $query = $this->db->get('item_inventory');
    foreach ($query->result_array() as $q) {
        $qty = $q['qty'];
        $intotal = $qty;
        echo '<td>' . $qty . '</td>';
    }
    //GET THE SUM OF OUT QUANTITY
    $this->db->where('item_id', $row->item_id);
    $this->db->where('tag', 'Out');
    $this->db->select_sum('qty');
    $query = $this->db->get('item_inventory');
    foreach ($query->result_array() as $q) {
        $qty = $q['qty'];
        $outtotal = $qty;
        echo '<td>' . $qty * -1 . '</td>';
    }
    echo '<td>' . $row->unit . '</td>';
    echo '<td>' . ($intotal + $outtotal) . '</td>';
    echo '<td>' . $this->cart->format_number(($intotal + $outtotal) * $row->cost_price) . '</td>';

    $total_quantity[] = $intotal + $outtotal;
    $total_cost[] = ($intotal + $outtotal) * $row->cost_price;
}
?>  
              </tr>
          <tr>
            <td class="text-right strong" colspan="9">Total:</td>
            <td class="total success"><?= array_sum($total_quantity) ?></td>
            <td class="total danger"><?= $this->cart->format_number(array_sum($total_cost)) ?></td>                               
          </tr>                         
        </tbody>
  </table>
<table>
    <tr>
<td><p style='padding-left:0px;'>Prepared by:</p></td>
<td><p style='padding-left:420px; padding-top:40px;'> Noted by:</p><br></td>
</tr>
<tr>
<td><h4 style='padding-left:0px;'>GEMMA O. GEROMO-SUMILE</h4></td>
<td><h4 style='padding-left:420px;'>JUDITH A. FALCONETE</h4></td>
</tr>
<tr>
    <td><p style='padding-left:0px;'>STI-Dipolog</p></td>
    <td><p style='padding-left:420px;'>School Administrator</p></td>
</tr>
</table>
</body>
</html>
-->