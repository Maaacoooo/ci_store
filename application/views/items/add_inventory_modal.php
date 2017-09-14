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
<!-- Modal -->
<div class="modal fade" id="UpdateInventory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Update Inventory: <?=$items['name']?></h4>
      </div>
       <?=form_open('items/add_inventory')?>
        <div class="modal-body">
          <div class="row">
              <div class="col-md-2">
                  <div class="form-group">
                    <label>Status</label>
                    <select name="status" class="form-control" required>
                      <option value=""></option>
                      <option value="In">In</option>
                      <?php if ($items['product_type'] == "0") { ?>
                      <option value="Out">Out</option>
                      <?php } ?>
                      <?php if (!$items['product_type'] == "0") { ?>
                      <option value="Defect">Defective</option>
                      <?php } ?>
                    </select>
                  </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label for="location">Location</label>
                  <select name="location" class="form-control" required>
                    <option></option>
                    <?php foreach($locations as $location): ?>
                      <option value="<?=$location['id']?>" <?php echo set_select('location', $location['id']); ?>><?=$location['name']?></option>
                    <?php endforeach;?>                                                        
                  </select>                  
                </div> 
              </div>
              <div class="col-md-2">
                  <div class="form-group">
                    <label>Quantity</label>
                    <input type="number" name="quantity" min="1" value="1" class="form-control" required>
                  </div>
              </div>
              <div class="col-md-2">
                  <div class="form-group">
                    <label>Unit</label>
                    <input type="text" name="unit" class="form-control" required>
                  </div>
              </div>

              <div class="col-md-3">
                  <div class="form-group">
                    <label>Remarks</label>
                    <input type="text" name="remarks" class="form-control">
                  </div>
              </div>
          </div>
        </div>
        <div class="modal-footer">
          <input type="hidden" name="id" value="<?=$items['id']?>">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Update Inventory</button>
        </div>
      </form>
    </div>
  </div>
</div>