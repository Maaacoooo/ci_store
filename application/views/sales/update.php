
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
        <li><a href="#">Home</a></li>
        <li><a href="<?=base_url('imports')?>">Imports</a></li>
        <li class="active"><?=$title?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-sm-12">
          <div class="callout callout-warning">
              <h4>Pending for Verification</h4>
              <p>
                This Import is subject for Verification. Please double check all the data before finalizing the Import. <br />
                Finalized Import Items will be added in the actual inventory. <br />
                Note that <strong class="text-danger">AFTER SUBMITTING</strong>, you <strong class="text-danger">CANNOT UNDO</strong> any input given.
              </p>
          </div>
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->

      
      <div class="row">
        <div class="col-xs-12">
          <?=$this->sessnotif->showNotif()?>
        </div><!-- /.col-xs-12 -->
      </div><!-- /.row -->

      

    <div class="row">
      <div class="col-md-4 col-sm-12">
        <div class="row">
          <div class="col-md-12">
            <!-- Default box -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Import Details</h3>
                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
                  </div>
                </div>
                <div class="box-body">
                       <table class="table">                         
                         <tr>
                           <th>Import ID</th>
                           <td class="bg-warning text-red">IMP #<?=prettyID($info['id'])?></td>
                         </tr>
                         <tr>
                           <th>Verified by</th>
                           <td class="text-blue"><?=$info['user']?></td>
                         </tr>
                         <tr>
                           <th>Status</th>
                           <td>
                             <?php if ($info['status'] == 1): ?>
                               <span class="label bg-yellow">Pending</span>
                             <?php elseif($info['status'] == 2): ?>
                               <span class="label bg-green">Verified</span>                      
                               <span class="label bg-green">Imported</span>                       
                             <?php endif ?>
                           </td>
                         </tr>
                         <tr>
                           <th>Last Update</th>
                           <td><em><?=$info['updated_at']?></em></td>
                         </tr>
                         <tr>
                           <th>Date Created</th>
                           <td><em><?=$info['created_at']?></em></td>
                         </tr>
                         <tr>
                           <th colspan="2">Remarks</th>
                         </tr>
                         <tr>
                           <td colspan="2"><?=$info['remarks']?></td>
                         </tr>
                       </table><!-- /.table -->             
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                </div>
                <!-- /.box-footer-->
              </div>
              <!-- /.box -->
          </div><!-- /.col-md-12 -->
        </div><!-- /.row -->
        <div class="row">
          <div class="col-md-12">
            <!-- Default box -->
              <div class="box collapsed-box">
                <div class="box-header with-border">
                  <h3 class="box-title">Export Details</h3>
                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-plus"></i></button>      
                  </div>
                </div>
                <div class="box-body">
                       <table class="table">
                         <tr>
                           <th>Brand / Company</th>
                           <td class="text-blue"><?=$info['brand']?></td>
                         </tr>
                         <tr>
                           <th>Export ID</th>
                           <td class="text-blue"><a href="<?=base_url('exports/view/'.$info['export_id'])?>">EXP #<?=prettyID($info['export_id'])?></a></td>
                         </tr>
                         <tr>
                           <th>Courier</th>
                           <td class="bg-warning text-red"><?=$info['courier']?></td>
                         </tr>
                         <tr>
                           <th>Tracking No.</th>
                           <td class="bg-warning text-red"><?=$info['tracking_no']?></td>
                         </tr>                       
                         <tr>
                           <th>Last Update</th>
                           <td><em><?=$info['export_updated_at']?></em></td>
                         </tr>
                         <tr>
                           <th>Date Created</th>
                           <td><em><?=$info['export_created_at']?></em></td>
                         </tr>
                         <tr>
                           <th colspan="2">Remarks</th>
                         </tr>
                         <tr>
                           <td colspan="2"><?=$info['export_remarks']?></td>
                         </tr>
                       </table><!-- /.table -->             
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                </div>
                <!-- /.box-footer-->
              </div>
              <!-- /.box -->
          </div><!-- /.col-md-12 -->
        </div><!-- /.row -->
      </div><!-- /.col-md-4 col-sm-12 -->

      <div class="col-md-8 div col-sm-12">
        <!-- Default box -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">Verify Import Items</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
              </div>
            </div>
            <div class="box-body">
              <div class="row">            
                <div class="col-md-12 table-responsive">
                  <?=form_open('imports/add_item')?>
                    <div class="input-group">
                      <input type="text" name="item" id="item" placeholder="Scan Barcode / Type to Search / Input ITEM ID or Serial..." class="form-control">
                      <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-shopping-cart"></i> Add Item</button>
                      </div>
                      <!-- /btn-group -->                
                    </div>
                  <?=form_close()?>
                  <?=form_open('imports/update_items')?>
                    <input type="hidden" name="imp_id" value="<?=$this->encryption->encrypt($info['id'])?>" />
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
                    <button type="button" class="btn btn-success btn-lg pull-right" data-toggle="modal" data-target="#modalVerify">
                       <i class="fa fa-check-square-o"></i> Finalize Import
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
      </div><!-- /.col-md-8 div col-sm-12 -->
    </div><!-- /.row -->

      <div class="modal modal fade" id="modalVerify">
          <div class="modal-dialog">
          <?=form_open('imports/view/'.$info['id'])?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-check-square-o"></i> Finalize Import</h4>
              </div>
              <div class="modal-body">
                <p>
                Are you sure to Finalize this Import? <br />
                Finalized Import Items will be added in the actual inventory. <br />
                Note that <strong class="text-danger">AFTER SUBMITTING</strong>, you <strong class="text-danger">CANNOT UNDO</strong> any input given.
                </p>
     
                  <div class="form-group">
                    <select name="location" class="form-control" required>
                    <option disabled="" selected="">Select Storage Location...</option>
                     <?php 
                        if($locations):
                        foreach($locations as $loc):
                      ?>
                      <option value="<?=$this->encryption->encrypt($loc['id'])?>"><?=$loc['title']?></option>
                      <?php
                        endforeach;
                        endif;
                      ?>
                    </select>  
                  </div><!-- /.form-group -->
                  <div class="form-group">
                      <label for="remarks">Import Remarks</label>
                      <textarea name="remarks" id="remarks" cols="30" rows="5" class="form-control"></textarea>                    
                  </div><!-- /.form-group -->
              </div>
               <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />              
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Verify</button>
              </div>
            </div>
            <!-- /.modal-content -->
           <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->           

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

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
        source: "<?php echo base_url('index.php/imports/autocomplete_items');?>"
      });
    });
    </script>   
  
</body>
</html>
