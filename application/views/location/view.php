
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title?> &middot; <?=$site_title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <?php $this->load->view('inc/css')?>
  <link rel="stylesheet" href="<?=base_url('assets/custom/css/jquery-ui.min.css')?>">  

   
</head>
<body class="hold-transition skin-black sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

  <header class="main-header">
    <?php $this->load->view('inc/header')?>
  </header>

  <!-- =============================================== -->

  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <?php $this->load->view('inc/left_nav')?>    
  </aside>

  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?=$title?>        
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?=base_url()?>">Dashboard</a></li>
        <li><a href="<?=base_url('locations')?>">Storage Locations</a></li>
        <li class="active"><?=$title?></li>
      </ol>
    </section>

   <section class="content">

      <div class="row">
        <div class="col-xs-12">
          <?php
            //ALERT / NOTIFICATION
            //ERROR ACTION        
            $flash_error = $this->session->flashdata('error');
            $flash_success = $this->session->flashdata('success');
            $flash_valid =  validation_errors();   

            echo $this->sessnotif->showNotif();
          ?>
        </div><!-- /.col-xs-12 -->
      </div><!-- /.row -->


       <!-- Default box -->
      <div class="box <?php if($this->session->flashdata('loc_item'))echo'collapsed-box'; ?>">
        <div class="box-header with-border">
          <h3 class="box-title"><?=$title?> Inventory <span class="badge"><?=$total_result?></span></h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-<?php if($this->session->flashdata('loc_item'))echo'plus';else echo 'minus';?>"></i></button>      
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li <?php if(!($this->session->flashdata('flash_loc')))echo'class="active"'?>><a href="#items" data-toggle="tab">Item List</a></li>
                  <li><a href="#activity" data-toggle="tab">Activity Logs</a></li>
                  <li <?php if($this->session->flashdata('flash_loc'))echo'class="active"'?>><a href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
                
                <!-- Item List -->
                <div class="tab-content">
                  <div class="tab-pane <?php if(!($this->session->flashdata('flash_loc')))echo'active'?>" id="items">
                    <?php if ($results): ?>
                    <table class="table table-condensed table-bordered">
                      <thead>
                        <tr>
                          <th>ID</th>
                          <th>Item Name</th>
                          <th>Category</th>
                          <th>Unit</th>
                          <th>DP</th>
                          <th>SRP</th>
                          <th>QTY</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($results as $item): ?>
                        <tr>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['id']?></a></td>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['name']?></a></td>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['category']?></a></td>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['unit']?></a></td>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['DP']?></a></td>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['SRP']?></a></td>
                          <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['qty']?></a></td>
                        </tr>
                        <?php endforeach ?>
                      </tbody>
                      <tfoot>
                        <tr>
                          <td colspan="7">
                            <a href="<?=base_url('locations/print_inventory/'.$info['id'])?>" class="btn btn-primary" target="_blank"><i class="fa fa-print"></i> Print <?=$info['title']?> Inventory</a>
                            <div class="pull-right">
                              <?php foreach ($links as $link) { echo $link; } ?>
                            </div><!-- /.pull-right -->
                          </td>
                        </tr>
                      </tfoot>
                    </table><!-- /.table table-condensed -->
                    <?php else: ?>
                      <div class="alert alert-warning">               
                        <h4><i class="icon fa fa-warning"></i> No item found!</h4>         
                        No items found in the system
                      </div>
                    <?php endif ?>
                  </div>
                  <!-- /.tab-pane -->

                <!-- Logs -->
                  <div class="tab-pane" id="activity">
                    <h4 class="title">Last 50 Activity</h4>
                    <?php if ($logs): ?>
                    <table class="table table-condensed">
                      <thead>
                        <tr>
                          <th>User</th>
                          <th>Action</th>
                          <th>Date Time</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($logs as $lg): ?>
                        <tr>
                          <td><?=$lg['user']?></td>
                          <td><?=$lg['action']?></td>
                          <td><?=$lg['date_time']?></td>
                        </tr>
                        <?php endforeach ?>
                      </tbody>
                    </table><!-- /.table table-condensed -->
                    <?php else: ?>
                      <div class="alert alert-warning">               
                        <h4><i class="icon fa fa-warning"></i> No records found!</h4>         
                        No Activity Logs record found in the system
                      </div>
                    <?php endif ?>
                  </div>
                  <!-- /.tab-pane -->
                  
                  <!-- Settings -->
                  <div class="tab-pane <?php if($this->session->flashdata('flash_loc'))echo'active'?>" id="settings">
                  <?=form_open('locations/view/'.$info['id'], array('class' => 'form-horizontal'))?>                
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Location</label>

                        <div class="col-sm-10">
                          <input type="text" name="title" class="form-control" id="title" placeholder="Warehouse / Location / Building" value="<?=$info['title']?>" >
                        </div>
                      </div>                 
                      <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />                 
                      <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-warning pull-right">Update</button>                                        
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete">Delete</button> 
                          </div>                                         
                      </div><!-- /.form-group -->
                  <?=form_close()?>
                  </div>
                  <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
              </div>
              <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

        <!-- Default box -->
          <div class="box box-warning <?php if(!$this->session->flashdata('loc_item'))echo'collapsed-box'; ?>">
            <div class="box-header with-border">
              <h3 class="box-title">Move Items</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fa fa-<?php if(!$this->session->flashdata('loc_item'))echo'plus';else echo 'minus';?>"></i></button>      
                </button>      
              </div>
            </div>
            <div class="box-body">
              <div class="row">            
                <div class="col-md-12 table-responsive">
                  <?=form_open('move/add_item')?>
                    <div class="input-group">
                      <input type="text" name="item" id="item" placeholder="Scan Barcode / Type to Search / Input ITEM ID or Serial..." class="form-control">
                      <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-shopping-cart"></i> Add Item</button>
                      </div>
                      <!-- /btn-group -->                
                    </div>
                  <?=form_close()?>
                  <?=form_open('move/update_items')?>
                    <input type="hidden" name="loc_id" value="<?=$this->encryption->encrypt($info['id'])?>" />
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th width="10%">Item ID</th>
                          <th width="40%">Item Name</th>
                          <th>Unit</th>
                          <th>DP</th>
                          <th>QTY</th>
                          <th>Sub Total</th>
                        </tr>
                      </thead>
                      <?php if ($items): ?>
                      <tbody>
                        <?php foreach ($items as $t): $qty[]=$t['qty']; $sub[]=($t['qty']*$t['DP']); ?>
                          <tr>
                            <td><?=$t['item_id']?></td>
                            <td><?=$t['name']?></td>
                            <td><?=$t['unit']?></td>
                            <td><?=$t['DP']?></td>
                            <td><input type="number" name="qty[]" value="<?=$t['qty']?>" style="width: 60px"/></td>
                            <td><?=($t['qty']*$t['DP'])?></td>
                          </tr>
                          <input type="hidden" name="id[]" value="<?=$this->encryption->encrypt($t['item_id'])?>" />
                        <?php endforeach ?>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="4" class="text-right">Total</th>
                          <th class="bg-success text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                          <th class="bg-success text-danger"><?=array_sum($sub)?></th><!-- /.bg-success text-danger -->
                        </tr>
                      </tfoot>
                      <button type="submit" class="hidden"></button>
                      <?php else: ?>
                        <tr>
                          <td colspan="6">
                            <div class="alert alert-info alert-dismissible">
                              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                              <p>Add an item</p>
                            </div>
                          </td>
                        </tr>
                      <?php endif ?>
                    </table><!-- /.table table-bordered -->
                    <?=form_close()?>
                    <button type="button" class="btn btn-success btn-lg pull-right" data-toggle="modal" data-target="#modalMove">
                       <i class="fa fa-truck"></i> Move Items
                    </button>
                </div><!-- /.col-md-8 -->
              </div><!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
          <!-- /.box -->

      

    </section>
  </div>
  <!-- /.content-wrapper -->

  <!-- Modals -->
  
        <div class="modal modal-danger fade" id="modalDelete" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('locations/delete')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Delete <?=$info['title']?></h4>
              </div>
              <div class="modal-body">
                <p>Are you sure to delete the record of <strong ><?=$info['title']?></strong>?</p>
                <p>You <strong>CANNOT UNDO</strong> this action.</p>
                <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline">Delete Location</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>


        <div class="modal fade" id="modalMove" style="display: none;">
          <div class="modal-dialog modal-lg">
          <?=form_open('move/create')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title"><i class="fa fa-truck"></i>Move Items from <?=$title?></h4>
              </div>
              <div class="modal-body">
                <div class="callout callout-info">
                  <h4><i class="fa fa-info-circle"></i> Information</h4>
                  <p>When moving items, select a correct destination of where to move your items. You can also dispose the items, by selecting <em>DISPOSE ITEMS</em> in the Location / Destination options.</p>
                  <p>Note that any data submitted <strong class="text-danger">CANNOT BE UNDONE</strong>.</p>
                  <p>Please review the following items to be moved.</p>                  
                </div><!-- /.callout callout-info -->
                <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th width="10%">Item ID</th>
                          <th width="40%">Item Name</th>
                          <th>Unit</th>
                          <th>DP</th>
                          <th>QTY</th>
                          <th>Sub Total</th>
                        </tr>
                      </thead>
                      <?php if ($items): ?>
                      <tbody>
                        <?php foreach ($items as $t): $qty[]=$t['qty']; $sub[]=($t['qty']*$t['DP']); ?>
                          <tr>
                            <td><?=$t['item_id']?></td>
                            <td><?=$t['name']?></td>
                            <td><?=$t['unit']?></td>
                            <td><?=$t['DP']?></td>
                            <td><?=$t['qty']?></td>
                            <td><?=($t['qty']*$t['DP'])?></td>
                          </tr>                          
                        <?php endforeach ?>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="4" class="text-right">Total</th>
                          <th class="bg-success text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                          <th class="bg-success text-danger"><?=array_sum($sub)?></th><!-- /.bg-success text-danger -->
                        </tr>
                      </tfoot>
                      <button type="submit" class="hidden"></button>
                      <?php else: ?>
                        <tr>
                          <td colspan="6">
                            <div class="alert alert-info alert-dismissible">
                              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                              <p>Add an item</p>
                            </div>
                          </td>
                        </tr>
                      <?php endif ?>
                    </table><!-- /.table table-bordered -->
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="destination">Destination to Move</label>
                          <select name="destination" id="destination" class="form-control" required="true">
                            <option disabled selected="">Select a location to move...</option>
                            <option value="0">--- Dispose Items ---</option>
                            <?php if ($locations): ?>
                            <?php foreach ($locations as $loc): ?>
                            <option value="<?=$loc['title']?>"><?=$loc['title']?></option>                                
                            <?php endforeach ?>                              
                            <?php endif ?>                            
                          </select>
                        </div><!-- /.form-group -->
                      </div><!-- /.col-md-12 -->
                    </div><!-- /.row -->
                    <div class="row">
                      <div class="col-md-12">
                        <div class="form-group">
                          <label for="remarks">Remarks</label>
                          <textarea name="remarks" id="remarks" class="form-control" rows="5"></textarea>
                        </div><!-- /.form-group -->
                      </div><!-- /.col-md-12 -->
                    </div><!-- /.row -->
                    <div class="row">
                      <div class="col-md-12">
                         <div class="checkbox pull-right">
                          <label>
                            <input type="checkbox" required> Yes. I am sure that all inputs are correct.
                          </label>
                        </div>
                      </div><!-- /.col-md-12 -->
                    </div><!-- /.row -->
                <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />                    
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success"><i class="fa fa-truck"></i> Move Items</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>


  <footer class="main-footer">    
    <?php $this->load->view('inc/footer')?>    
  </footer>

</div>
<!-- ./wrapper -->

    <script type="text/javascript" src="<?=base_url('assets/custom/js/jquery-1.11.2.min.js')?>"></script> 
    <script src="<?=base_url('assets/bower_components/bootstrap/dist/js/bootstrap.min.js')?>"></script>
    <script src="<?=base_url('assets/dist/js/adminlte.min.js')?>"></script>
    <script src="<?=base_url('assets/custom/js/jquery-ui.js');?>" type="text/javascript" language="javascript" charset="UTF-8"></script>
    <script type="text/javascript">
      $(function(){
      $("#item").autocomplete({    
        source: "<?php echo base_url('index.php/move/autocomplete_items/'.$info['id']);?>"
      });
    });
    </script>  

  
</body>
</html>
