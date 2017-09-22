
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
            <div class="col-md-4">
               <table class="table">
                 <tr>
                   <th>Brand / Company</th>
                   <td class="text-blue"><?=$info['brand']?></td>
                 </tr>
                 <tr>
                   <th>Prepared by</th>
                   <td class="text-blue"><?=$info['user']?></td>
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
                   <th>Status</th>
                   <td>
                     <?php if ($info['status'] == 1): ?>
                       <span class="label bg-yellow">Pending</span>
                     <?php elseif($info['status'] == 2): ?>
                       <span class="label bg-blue">Verified</span>                      
                       <span class="label bg-blue">In-Transit</span>   
                     <?php elseif($info['status'] == 3): ?>
                       <span class="label label-info">Received</span>                                    
                       <span class="label label-warning">Verification</span>     
                     <?php elseif($info['status'] == 4): ?>
                       <span class="label bg-green">Imported</span>                                    
                       <span class="label bg-green">Verified</span>                                    
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
               </table><!-- /.table -->             
            </div><!-- /.col-md-4 -->
            <div class="col-md-8 table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th width="10%">Item ID</th>
                    <th width="40%">Item Name</th>
                    <th>Unit</th>
                    <th>DP</th>
                    <th class="bg-info">QTY</th>
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
                      <td class="bg-info"><?=$t['qty']?></td>
                      <td><?=($t['qty']*$t['DP'])?></td>
                    </tr>
                    <input type="hidden" name="id[]" value="<?=$this->encryption->encrypt($t['item_id'])?>" />
                  <?php endforeach ?>
                </tbody>
                <tfoot>
                  <tr>
                    <th colspan="4" class="text-right">Total</th>
                    <th class="bg-info text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                    <th class="bg-success text-danger"><?=array_sum($sub)?></th><!-- /.bg-success text-danger -->
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
              <?php if ($info['status'] == 2 && $user['usertype'] == 'Administrator'): ?>
                <button type="button" class="btn btn-success btn-lg pull-right" data-toggle="modal" data-target="#modalVerify">
                   <i class="glyphicon glyphicon-download-alt"></i> Receive Export
                 </button>
              <?php endif; ?>
            </div><!-- /.col-md-8 -->
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
          <?=form_open('imports/create')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="glyphicon glyphicon-download-alt"></i> Receive Export</h4>
              </div>
              <div class="modal-body">
                <p>
                Are you sure to Receive this Export? <br />
                You will be redirected to Import Verification Page to verify import.
              </div>
               <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />              
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Receive</button>
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
