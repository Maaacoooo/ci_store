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
        <div class="modal fade" id="category" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Categories</h4>
              </div>
              <div class="modal-body">
                  <div class="row">
                    <div class="col-md-12">
                      <?=form_open('items/create_category')?>
                        <div class="form-group">
                          <div class="input-group">
                            <input type="text" name="name" class="form-control" placeholder="Create New Category...">
                            <span class="input-group-btn">
                              <button class="btn btn-success" type="submit">Submit</button>
                            </span>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div><!-- ./row -->
                  <div class="row">
                    <hr>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <p class="strong">Categories</p>
                      <?php foreach ($categories as $category):?>
                          <div class="col-md-9">
                            <?=form_open('items/update_category')?>
                              <div class="form-group">
                                <div class="input-group">
                                  <input type="text" name="name" class="form-control" name="title" value="<?=$category['name']?>" required>
                                  <input type="hidden" name="id" value="<?=$category['id']?>">
                                  <span class="input-group-btn">                                  
                                    <button class="btn btn-warning" type="submit">Update</button>
                                  </span>
                                </div>
                              </div>
                            </form>
                          </div>
                          <div class="col-md-3">
                            <?=form_open('items/delete_category', array('class' => 'form-inline'))?>
                                                                                            
                              <input type="hidden" name="id" value="<?=$category['id']?>">
                              <div class="checkbox">
                                <input type="checkbox" required> 
                              </div>                                 
                                                                 
                              <button class="btn btn-danger" type="submit">Delete</button>                                  
                    
                            </form>
                          </div>
                      <?php endforeach?>
                    </div>
                  </div><!-- ./row -->
              </div>              
            </div>
          </div>
        </div>