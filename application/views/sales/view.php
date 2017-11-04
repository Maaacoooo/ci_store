
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
        <li><a href="<?=base_url('sales')?>">Sales</a></li>
        <li class="active"><?=$title?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">    
      <div class="row">
        <div class="col-xs-12">
          <?php
            //ALERT / NOTIFICATION
            //ERROR ACTION                          
            if($this->session->flashdata('error')): ?>

            <div class="alert alert-danger alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-ban"></i> Oops!</h4>
              <?=$this->session->flashdata('error')?>
            </div>
                       
        <?php 
            endif; //error end
            //SUCCESS ACTION                          
            if($this->session->flashdata('success')): ?>
            <div class="alert alert-success alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-check"></i> Success!</h4>
              <?=$this->session->flashdata('success')?>
            </div>
        <?php 
            endif; //success end
            //FORM VALIDATION ERROR
            $this->form_validation->set_error_delimiters('<li>', '</li>');
            if(validation_errors()): ?>
            <div class="alert alert-warning alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-warning"></i> Warning!</h4>         
              <?=validation_errors()?>         
            </div>
        <?php endif; //formval end ?> 
        </div><!-- /.col-xs-12 -->
      </div><!-- /.row -->
      
      <?php if ($info['status'] ==1): ?>
      <div class="row">
        <div class="col-sm-12">
          <div class="callout callout-warning">
              <h4>Verify Sale</h4>
              <p>
                <div class="row">
                  <div class="col-sm-12">
                    Please verify all inputs provided. By verifying the sale, you <span class="strong text-red">CANNOT UNDO or MODIFY</span> any inputs.
                <button type="button" class="btn btn-flat btn-success btn-lg pull-right" data-toggle="modal" data-target="#modalVerify">
                       <i class="fa fa-check-square-o"></i> Verify Sale
                </button>
                  </div><!-- /.col-sm-12 -->
                </div><!-- /.row -->
              </p>
          </div>
        </div><!-- /.col-sm-12 -->
      </div><!-- /.row -->
      <?php endif ?>
      

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Sold Items</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
          </div>
        </div>
        <div class="box-body">
          <div class="row">           
            <div class="col-md-8 table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th width="10%">Batch ID</th>
                    <th width="10%">Item ID</th>
                    <th width="40%">Item Name</th>
                    <th>SRP</th>
                    <th class="bg-info">QTY</th>
                    <th class="bg-info">DISC</th>
                    <th>Sub Total</th>
                  </tr>
                </thead>
                <?php if ($items): ?>
                <tbody>
                  <?php foreach ($items as $t): $qty[]=$t['qty']; $sub[]=(($t['qty']*$t['srp']) - ($t['qty']*$t['discount'])); $disc[] = ($t['qty']*$t['discount']);  ?>
                    <tr>
                      <td><?=$t['batch_id']?></td>
                      <td><?=$t['item_id']?></td>
                      <td><?=$t['name']?> - <?=$t['unit']?></td>
                      <td><?=$t['srp']?></td>
                      <td class="bg-info"><?=$t['qty']?></td>
                      <td class="bg-info"><?=$t['discount'] * $t['qty']?></td>
                      <td><?=decimalize(($t['qty']*$t['srp']) - ($t['qty'] * $t['discount']))?></td>
                    </tr>
                  <?php endforeach ?>
                </tbody>
                <tfoot>
                  <tr>
                    <th colspan="4" class="text-right">Total</th>
                    <th class="bg-info text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                    <th class="bg-info text-danger"><?=array_sum($disc)?></th><!-- /.bg-success text-danger -->
                    <th class="bg-success text-danger"><?=decimalize(array_sum($sub))?></th><!-- /.bg-success text-danger -->
                  </tr>
                </tfoot>
                <button type="submit" class="hidden"></button>
                <?php else: ?>
                  <tr>
                    <td colspan="6">
                      <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <p>Oops! No Item Found!</p>
                      </div>
                    </td>
                  </tr>
                <?php endif ?>
              </table><!-- /.table table-bordered -->
            </div><!-- /.col-md-8 -->
            <div class="col-md-4">
               <table class="table">
                 <tr>
                   <th class="bg-warning">Sold From</th>
                   <td class="text-blue bg-warning"><?=$info['location']?></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Customer</th>
                   <td class="text-blue bg-warning"><?=$info['customer']?></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Total Payables</th>
                   <td class="text-red bg-warning"><strong><?=decimalize(array_sum($sub))?></strong></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Amount Tendered</th>
                   <td class="text-blue bg-warning"><strong><?=$info['amount_tendered']?></strong></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Change</th>
                   <td class="text-green bg-warning"><strong><?=($info['amount_tendered'] - (array_sum($sub)))?></strong></td>
                 </tr>
                 <tr>
                   <th>Sale Satus</th>
                   <td>
                     <?php if ($info['status'] == 1): ?>
                      <span class="label bg-yellow">Pending</span>
                     <?php elseif($info['status'] == 2): ?>
                      <span class="label bg-green">Served</span>
                     <?php elseif($info['status'] == 0): ?>
                      <span class="label bg-black">Cancelled</span>
                     <?php endif ?>
                   </td>
                 </tr>
                 <tr>
                   <th>Prepared by</th>
                   <td class="text-blue"><?=$info['user']?></td>
                 </tr>
                 <tr>
                   <th>Date Created</th>
                   <td><em><?=$info['created_at']?></em></td>
                 </tr>
                 <tr>
                   <th colspan="2">Remarks</th>
                 </tr>
                 <tr>
                   <td colspan="2" class="bg-info"><?=$info['remarks']?></td>
                 </tr>
                 <?php if ($info['status'] == 1): ?>
                <tr>
                   <td colspan="2">
                     <a href="<?=base_url('sales/update/'.$info['id'])?>" class="btn btn-lg btn-flat btn-block btn-warning">Update Sale</a>
                   </td>
                 </tr>
                 <tr>
                   <td colspan="2">
                      <button class="btn btn-block btn-sm btn-link" type="button" data-toggle="modal" data-target="#modalCancel"><i class="fa fa-trash"></i> Cancel Sale</button>
                   </td>
                 </tr>
                 <?php endif ?>
               </table><!-- /.table -->             
            </div><!-- /.col-md-4 -->
          </div><!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
     
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->


    <div class="modal modal fade" id="modalVerify">
          <div class="modal-dialog">
          <?=form_open('sales/verify')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-check-square-o"></i> Finalize Sale</h4>
              </div>
              <div class="modal-body">
                <p>
                Are you sure to Finalize this Sale? <br />
                Finalized Sale Items will be subtracted in the actual inventory. <br />
                Note that <strong class="text-danger">AFTER SUBMITTING</strong>, you <strong class="text-danger">CANNOT UNDO</strong> any input given.
                </p>
            
              </div>
               <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />              
               <input type="hidden" name="status" value="<?=$this->encryption->encrypt(2)?>" />              
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Verify Sale</button>
              </div>
            </div>
            <!-- /.modal-content -->
           <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->   


      <div class="modal modal fade" id="modalCancel">
          <div class="modal-dialog">
          <?=form_open('sales/verify')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="fa fa-trash"></i> Cancel Sale</h4>
              </div>
              <div class="modal-body">
                <p>
                Are you sure to <span class="strong text-red">CANCEL</span> this Sale? <br />
                Items listed will not be reflected in the actual inventory<br />
                Note that <strong class="text-danger">AFTER SUBMITTING</strong>, you <strong class="text-danger">CANNOT UNDO</strong> this action.
                </p>
            
              </div>
               <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />              
               <input type="hidden" name="status" value="<?=$this->encryption->encrypt(0)?>" />              
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-danger btn-flat"><i class="fa fa-trash"></i> Cancel Sale</button>
              </div>
            </div>
            <!-- /.modal-content -->
           <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->   

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
