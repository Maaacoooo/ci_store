
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
        <li><a href="#">Examples</a></li>
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
                This Export is subject for Verification. Please double check all the data before finalizing the export. <br />
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

      

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Export Items</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-8 table-responsive">
              <?=form_open('exports/add_item')?>
                <div class="input-group">
                  <input type="text" name="item" id="item" placeholder="Scan Barcode / Type to Search / Input ITEM ID or Serial..." class="form-control">
                  <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-shopping-cart"></i> Add Item</button>
                  </div>
                  <!-- /btn-group -->                
                </div>
              <?=form_close()?>
              <?=form_open('exports/update_items')?>
              <input type="hidden" name="exp_id" value="<?=$this->encryption->encrypt($info['id'])?>" />
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
            </div><!-- /.col-md-8 -->
            <div class="col-md-4">
            <?=form_open('exports/view/'.$info['id'])?>
              <div class="form-group">
                  <label for="courier">Courier</label>
                  <input type="text" name="courier" class="form-control" id="courier" placeholder="Courier..." value="<?=$info['courier']?>">
               </div>
               <div class="form-group">
                  <label for="track">Tracking No.</label>
                  <input type="text" name="track" class="form-control" id="track" placeholder="Tracking No. / Waybill..." value="<?=$info['tracking_no']?>">
               </div>
               <div class="form-group">
                  <label for="remarks">Remarks / Notes</label>
                  <textarea name="remarks" id="remarks" cols="30" rows="5" class="form-control"><?=$info['remarks']?></textarea>
               </div>
               <div class="form-group">
                 <button type="submit" class="btn btn-warning btn-block"><i class="fa fa-edit"></i> Update Info</button>
               </div><!-- /.form-group -->
               <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
               <div class="form-group">
                 <button type="button" class="btn btn-success btn-lg btn-block" data-toggle="modal" data-target="#modalVerify">
                   <i class="fa  fa-check-square-o"></i> Verify Export
                 </button>
               </div><!-- /.form-group -->
            <?=form_close()?>
            </div><!-- /.col-md-4 -->
          </div><!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->


      <div class="modal modal fade" id="modalVerify">
          <div class="modal-dialog">
          <?=form_open('exports/verify')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-check"></i> Verify Export</h4>
              </div>
              <div class="modal-body">
                <p>
                Are you sure to verify this Export? <br />
                Note that <strong class="text-danger">AFTER SUBMITTING</strong>, you <strong class="text-danger">CANNOT UNDO</strong> any input given.</p>
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
        source: "<?php echo base_url('index.php/exports/autocomplete_items');?>"
      });
    });
    </script>   
  
</body>
</html>
