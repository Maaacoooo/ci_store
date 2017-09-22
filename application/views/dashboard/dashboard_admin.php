
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


      <?php if($passwordverify): ?>
        <div class="callout callout-danger">
          <h4><i class="fa fa-warning"></i> Change your Password!</h4>
          <p>The system has detected that you haven't changed your default password. Please change your password for additional security.</p>
          <p>To change your password, go to your <em>Profile</em> and check out the <em>Settings Tab</em>. <a href="<?=base_url('settings/profile')?>">Click here to change!</a></p>
        </div
      <?php endif ?>

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">In-Transit Exports</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
          </div>
        </div>
        <div class="box-body">
          <?php if ($intransit_exports): ?>
          <table class="table table-condensed table-striped">
            <thead>
              <tr>
                <th>EXP. ID</th>
                <th>Courier</th>
                <th>Tracking</th>
                <th>Last Updated</th>
                <th>User</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($intransit_exports as $exp): ?>
                <tr>
                  <td><a href="<?=base_url('exports/view/'.$exp['id'])?>">#<?=prettyID($exp['id'])?></a></td>
                  <td><a href="<?=base_url('exports/view/'.$exp['id'])?>"><?=$exp['courier']?></a></td>
                  <td><a href="<?=base_url('exports/view/'.$exp['id'])?>"><?=$exp['tracking_no']?></a></td>
                  <td><a href="<?=base_url('exports/view/'.$exp['id'])?>"><?=$exp['updated_at']?></a></td>
                  <td><a href="<?=base_url('exports/view/'.$exp['id'])?>"><?=$exp['user']?></a></td>
                </tr>
              <?php endforeach ?>
            </tbody>
          </table><!-- /.table table-condensed table-striped -->  
          <?php else: ?>
            <div class="callout callout-info">
              <h4>No In-Transit Exports</h4>
              <p>You have no In-Transit Exports.</p>
            </div>
          <?php endif ?>
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
        
  <footer class="main-footer">    
    <?php $this->load->view('inc/footer')?>    
  </footer>

</div>
<!-- ./wrapper -->

    <?php $this->load->view('inc/js')?>    
    
  
</body>
</html>
