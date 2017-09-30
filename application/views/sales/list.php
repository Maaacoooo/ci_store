
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title?> &middot; <?=$site_title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <?php $this->load->view('inc/css')?>
  <!-- daterange picker -->
  <link rel="stylesheet" href="<?=base_url('assets/bower_components/bootstrap-daterangepicker/daterangepicker.css')?>">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="<?=base_url('assets/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css')?>">
   
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
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Sales <span class="badge"><?=$total_result?></span></h3>
          <div class="box-tools pull-right">    
            <?=form_open('sales', array('method' => 'get', 'class' => 'input-group input-group-sm pull-left', 'style' => 'width: 250px;'))?>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="date" class="form-control input-sm pull-right" id="dateSearch">
                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default btn-sm"><i class="fa fa-search"></i></button>  
                  </div> 
                </div>
            <?=form_close()?>  
            <?=form_open('sales', array('method' => 'get', 'class' => 'input-group input-group-sm pull-right', 'style' => 'width: 150px;'))?>
              <input type="text" name="search" class="form-control pull-right" placeholder="Search...">
              <div class="input-group-btn">
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                <button type="button" class="btn btn-default btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fa fa-minus"></i>
                </button>  
              </div> 
            <?=form_close()?> 
          </div>
        </div>
        <div class="box-body <?php if($results)echo 'table-responsive no-padding';?>">
            <?php if ($results): ?>
              <table class="table">          
                <thead>
                  <tr>
                    <th>Sale ID</th>
                    <th>Preparer</th>           
                    <th>Customer</th>     
                    <th>Total Amount</th>                    
                    <th>Date Time</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($results as $res): ?>
                    <tr>
                      <td><a href="<?=base_url('sales/view/'.$res['id'])?>">#<?=prettyID($res['id'])?></a></td>   
                      <td><a href="<?=base_url('sales/view/'.$res['id'])?>"><?=$res['user']?></a></td>             
                      <td><a href="<?=base_url('sales/view/'.$res['id'])?>"><?=$res['customer']?></a></td>
                      <td><a href="<?=base_url('sales/view/'.$res['id'])?>"><?=$res['totalAmt']?></a></td>                      
                      <td><a href="<?=base_url('sales/view/'.$res['id'])?>"><?=$res['created_at']?></a></td>                  
                    </tr>
                  <?php endforeach; ?>
                </tbody>  
              </table><!-- /.table -->
            <?php else: ?>
            <div class="row">
              <div class="col-md-12">
                <div class="callout callout-info">
                  <h4>No Sales Found!</h4>
                  <p>No records found in the database</p>
                </div><!-- /.callout callout-info -->
              </div><!-- /.col-md-12 -->
            </div><!-- /.row -->            
            <?php endif; ?>              
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <div class="pull-left">
            <button class="btn btn-primary" data-toggle="modal" data-target="#modalPrint"><i class="fa fa-print"></i> Print Sales Report</button>
          </div><!-- /.pull-left -->
          <div class="pull-right">
            <?php foreach ($links as $link) { echo $link; } ?>
          </div><!-- /.pull-right -->

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->


      <div class="modal fade" id="modalPrint" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('sales/print_report', array('method' => 'get', 'target' => '_blank'))?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Print Sales Report</h4>
              </div>
              <div class="modal-body">
                <p>When printing a Summary Sales Report, select the range of date.</p>
                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" name="date" class="form-control input-sm pull-right" id="dateReport">
                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default btn-sm"><i class="fa fa-print"></i> Print Report</button>  
                  </div> 
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>



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
    <!-- date-range-picker -->
    <script src="<?=base_url('assets/bower_components/moment/min/moment.min.js')?>"></script>
    <script src="<?=base_url('assets/bower_components/bootstrap-daterangepicker/daterangepicker.js')?>"></script>
    <!-- bootstrap datepicker -->
    <script src="<?=base_url('assets/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js')?>"></script>

    <!-- Page script -->
<script>
  $(function () {  
    //Date range picker
    $('#dateSearch').daterangepicker()
    $('#dateReport').daterangepicker()

  })
</script>

    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>
    
</body>
</html>


