
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title?> &middot; <?=$site_title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <?php $this->load->view('inc/css')?>
   
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
        <li><a href="<?=base_url('items')?>">Item Inventory</a></li>
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
            $flash_error = $this->session->flashdata('error');
            $flash_success = $this->session->flashdata('success');
            $flash_valid =  validation_errors();                 
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

      
      
      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">             
              <img class="img-responsive" src="<?=base_url('barcode.php?barcode='.$info['id'].'&width=230&text='.$info['id'])?>" alt="User profile picture">

              <h3 class="profile-username text-center"><?=$info['name']?></h3>
              <p class="text-muted text-center"><?=$info['serial']?></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Unit</b> <a class="pull-right"><?=$info['unit']?></a>
                </li>
                <li class="list-group-item">
                  <b>Category</b> <a class="pull-right"><?=$info['category']?></a>
                </li>
                <li class="list-group-item">
                  <b>Brand</b> <a class="pull-right"><?=$info['brand']?></a>
                </li>
                <li class="list-group-item">
                  <b>Critical Level</b> <a class="badge bg-red pull-right"><?=$info['critical_level']?></a>
                </li>
                <li class="list-group-item">
                  <b>Description</b>
                  <p><?=$info['description']?></p>
                </li>     
                <li class="list-group-item">
                  <a href="<?=base_url('items/view/'.$info['id'].'/barcode')?>" target="_blank" class="btn btn-block btn-primary btn-sm"><i class="fa fa-print"></i> Print Barcode</a>
                </li><!-- /.list-group-item -->           
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->


        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li <?php if(!($flash_error || $flash_success || $flash_valid))echo'class="active"'?>><a href="#inventory" data-toggle="tab">Exports</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane <?php if(!($flash_error || $flash_success || $flash_valid))echo'active'?>" id="inventory">
                <?php if ($exports): ?>
                <table class="table table-condensed table-bordered">
                  <thead>
                    <tr>
                      <th>Export ID</th>
                      <th class="bg-warning">DP</th>
                      <th>QTY</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($exports as $inv): ?>
                    <?php $qty[] = $inv['qty']; ?>
                    <tr>
                      <td>
                        <a href="<?=base_url('exports/view/'.$inv['export_id'])?>"><?=prettyID($inv['export_id'])?></a>
                      </td>
                      <td class="text-yellow"><?=$inv['dp']?></td>
                      <td><?=$inv['qty']?></td>                     
                    </tr>
                    <?php endforeach ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td colspan="2" class="text-right bold">Total Items Exported</td>
                      <td><?=array_sum($qty)?></td>
                    </tr>
                  </tfoot>
                </table><!-- /.table table-condensed -->
                <?php else: ?>
                  <div class="alert alert-warning">               
                    <h4><i class="icon fa fa-warning"></i> No records found!</h4>         
                    No Item found in all Locations
                  </div>
                <?php endif ?>
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


    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">    
    <?php $this->load->view('inc/footer')?>    
  </footer>

</div>
<!-- ./wrapper -->



    <?php $this->load->view('inc/js')?>    
    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>
   
</body>
</html>
