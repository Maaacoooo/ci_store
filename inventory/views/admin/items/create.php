<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$site_title?> | <?=$title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- CSS -->
  <?=$this->load->view('admin/css')?>

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Header -->
  <?=$this->load->view('admin/header')?>
  <!-- /.Header -->
  <!-- Sidebar -->
  <?=$this->load->view('admin/sidebar')?>
  <!-- /.sidebar -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?=$group?>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"><?=$title?></li>
      </ol>
    </section><!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <!-- general form elements -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"><?=$title?></h3>
            </div><!-- /.box-header -->
            <!-- form start -->
            <?=form_open('admin/items/create')?>
              <div class="box-body">
                <div class="col-md-12"> 
                <!-- ALERT -->
                <?php
                  //SUCCESS ACTION                          
                       if($this->session->flashdata('error')) { ?>
                      <div class="alert alert-danger alert-dismissible" role="alert">
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                         </button>
                         <p><i class="fa fa-warning"></i> <?php echo $this->session->flashdata('error'); ?></p>
                      </div>
                <?php } ?> 
                <?php
                  //SUCCESS ACTION                          
                       if($this->session->flashdata('success')) { ?>
                      <div class="alert alert-success alert-dismissible" role="alert">
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                         </button>
                         <p><i class="fa fa-check"></i> <?php echo $this->session->flashdata('success'); ?></p>
                      </div>
                <?php } ?>             
                <?php
                  //FORM VALIDATION ERROR
                      $this->form_validation->set_error_delimiters('<p><i class="fa fa-times-circle"></i> ', '</p>');
                       if(validation_errors()) { ?>
                      <div class="alert alert-danger alert-dismissible" role="alert">
                         <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                         </button>
                         <?php echo validation_errors(); ?>
                      </div>
                <?php } ?>  
                <!-- /.ALERT -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="title">Title</label>
                      <input type="text" name="title" class="form-control" id="title" placeholder="Enter Title">
                    </div><!-- /.form-group -->
                    <div class="form-group">
                      <label for="unit">Unit</label>
                      <input type="text" name="unit" class="form-control" id="unit" placeholder="Enter Unit">
                    </div><!-- /.form-group -->
                    <div class="form-group">
                      <label for="description">Description</label>
                      <div class="box-body pad">
                        <textarea class="textarea" name="description" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">   
                        </textarea>
                      </div><!-- /.box-body pad -->
                    </div><!-- /.form-group -->
                  </div><!-- /.col-md-6 -->
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="op">Original Price</label>
                      <input type="number" name ="op" class="form-control" id="op" placeholder="Enter Original Price">
                    </div>
                    <div class="form-group">
                      <label for="sp">Selling Price</label>
                        <input type="number" name="sp" class="form-control" id="sp" placeholder="Enter Selling Price">
                    </div><!-- /.form-group -->
                    <div class="form-group pull-right">
                      <button type="submit" class="btn btn-success btn-flat">Create</button>
                      <input type="reset" class="btn btn-info btn-flat" value="Reset"/> 
                    </div><!-- /.form-group pull-right -->
                  </div><!-- /.col-md-6 -->
                </div><!-- /.col-md-12 -->
              </div><!-- /.box-body -->
            <?=form_close()?><!-- /.form -->
          </div><!-- /.box box-info -->
        </div><!-- /.col-lg-12 col-xs-12 -->
      </div><!-- /.row -->
    </section><!-- /.content -->
  </div><!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="#">BlahBlahBlah Studio</a>.</strong> All rights
    reserved.
  </footer>
</div><!-- ./wrapper -->

<!-- JS -->
<?=$this->load->view('admin/js')?>
</body>
</html>
