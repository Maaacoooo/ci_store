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
        <h5 align='center'>Malvar Street, Miputak, Dipolog City</h5>
        <em style="padding-left:250px;">System Generated Results of <?= $site_title ?> as of <?= date('M. d, Y') ?> </em>
        <table class="table">		  
            <thead>
                <tr>
                    <th colspan="10">TOTAL INVENTORY</th>
                </tr>      
                <?php for ($i = 0; $i < 2; $i++): ?>
                    <tr>
                        <td colspan="10" style="height:30px"></td>
                    </tr>
                    <tr>
                        <th colspan="10" class="location">
                            <em>
                                <?php echo ($i == 0) ? 'Proware' : 'Equipments'; ?>
                            </em>
                        </th>
                    </tr>
                    <tr>
                        <th width="1%"></th>
                        <th>SERIAL</th>
                        <th>ITEM NAME</th>
                        <th>CATEGORY</th>
                        <th>BRAND</th>
                        <?php if ($i == 0) { ?>
                            <th>COST PRICE</th> 
                        <?php } else { ?>
                            <th>DEFECTIVE</th>
                        <?php } ?>
                        <th width="10%">QTY</th> 
                        <th width="10%">UNIT</th>
                        <th>Location</th>
                        <th>TOTAL</th>
                    </tr>
                    <?php
                    $this->db->select('items.name, 
                    items.category, 
                    items.cost_price,             
                    items.brand, 
                    items.id, 
                    items.serial,
                    items.product_type,
                    item_inventory.qty,
                    item_inventory.loc_id,
                    items.unit,
                    item_inventory.item_id AS item_id,
                    items.name AS item_name');
                    //$this->db->where('item_inventory.loc_id', $location['id']);
                    $this->db->where('items.product_type', $i);
                    $this->db->join('items', 'items.id = item_inventory.item_id', 'left');

                    $this->db->group_by('item_inventory.item_id');
                    $this->db->order_by('items.name', 'ASC');
                    $query = $this->db->get("item_inventory");
                    $x = 1;

                    $result = $query->result();

                    foreach ($result as $row) {
                        echo '<tr>';
                        echo '<td>' . $x++ . '.</td>';
                        echo '<td>' . $row->serial . '</td>';
                        echo '<td>' . $row->item_name . '</td>';
                        echo '<td>' . $row->category . '</td>';
                        echo '<td>' . $row->brand . '</td>';
                        if ($i == 0) {
                            echo '<td>' . $this->cart->format_number($row->cost_price) . '</td>';
                        } else {

                            $total_defect = 0;
                            $this->db->where('item_id', $row->id);
                            $this->db->where('tag', 'Defect');
                            $this->db->select_sum('qty');
                            $query = $this->db->get('item_inventory');
                            foreach ($query->result_array() as $q) {
                                if (isset($q['qty'])) {
                                    $total_defect = $q['qty'];
                                }
                            }
                            echo '<td>' . $total_defect . '</td>';
                        }
                        //GET THE SUM OF QUANTITY
                        $this->db->where('item_id', $row->item_id);
                        $this->db->select_sum('qty');
                        $query = $this->db->get('item_inventory');
                        foreach ($query->result_array() as $q) {
                            $this->db->select('items.name, 
                            items.category, 
                            items.cost_price,             
                            items.brand, 
                            items.id, 
                            items.serial,
                            item_inventory.qty,
                            items.unit,
                            item_inventory.item_id AS item_id,
                            items.name AS item_name');
                            //$this->db->where('item_inventory.loc_id', $location['id']);
                            $this->db->where('items.product_type', $i);
                            $this->db->join('items', 'items.id = item_inventory.item_id', 'left');
                            $this->db->group_by('item_inventory.item_id');
                            $this->db->order_by('items.name', 'ASC');
                            $query = $this->db->get("item_inventory");
                            foreach ($query->result() as $row1) {
                                $show = $row->unit;
                            }
                            $qty = $q['qty'];
                            $total = $row->cost_price * $qty;
                            $location = $this->item_model->get_loc_inventory($row->loc_id);

                            $total_defect = 0;
                            $this->db->where('item_id', $row->id);
                            $this->db->where('tag', 'Defect');
                            $this->db->select_sum('qty');
                            $query = $this->db->get('item_inventory');
                            foreach ($query->result_array() as $q) {
                                if (isset($q['qty'])) {
                                    $total_defect = $q['qty'];
                                }
                            }
                            $qty = $qty - $total_defect;
                            echo '<td>' . $qty . '</td>';
                            echo '<td>' . $show . '</td>';
                            echo '<td>' . $location['name'] . '</td>';
                            echo '<td>' . $this->cart->format_number($total) . '</td>';
                        }
                        $total_quantity[] = $qty;
                        $total_cost[] = $total;
                        $overall_quantity[] = $qty;
                        $overall_cost[] = $total;
                        echo '</tr>';
                    }
                    ?>
                    <tr>
                        <td class="text-right strong" colspan="9">Total Active Items:</td>
                        <td class="total success">  
                            <?= array_sum($total_quantity) ?>
                        </td>                               
                    </tr> 
                    <tr>
                        <td class="text-right strong" colspan="9">Total Cost:</td>                                
                        <td class="danger"><?= $this->cart->format_number(array_sum($total_cost)) ?></td>
                    </tr>                                                        

                    <?php
                    //RESET VALUE
                    $total_quantity = array();
                    $total_cost = array();
                    reset($total_quantity);
                    reset($total_cost);
                    ?>
                <?php endfor; ?>

                <tr>
                    <th colspan="10" style="height:20px"></th>
                </tr>
                <tr>
                    <td colspan="10" style="height:30px"></td>
                </tr>
                <tr>
                    <td colspan="9" class="text-right strong">Overall Inventory Total:</td>
                    <td><?= array_sum($overall_quantity) ?></td>
                </tr>
                <tr>
                    <td colspan="9" class="text-right strong">Overall Total Cost:</td>
                    <td><?= $this->cart->format_number(array_sum($overall_cost)) ?></td>
                </tr>

                </tbody>
        </table>
    </body>
</html>

