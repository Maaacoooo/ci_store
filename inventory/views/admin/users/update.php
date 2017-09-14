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
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <div class="row">
            <div class="col-xs-12">
              <!-- general form elements -->
              <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title"><?=$title?></h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <div class="box-body">
                  <?=form_open_multipart('admin/users/update/'.$items['id'],array('class' => 'form-horizontal'))?>
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
                    <div class="form-group">
                      <label for="name" class="col-sm-2 control-label">Name</label>

                      <div class="col-sm-10">
                        <input type="text" name="name" value="<?=$items['name']?>" class="form-control" id="name" placeholder="Name">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="username" class="col-sm-2 control-label">Username</label>

                      <div class="col-sm-10">
                        <input type="text" name="username" value="<?=$items['username']?>" class="form-control" id="username" placeholder="Username">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="oldpassword" class="col-sm-2 control-label">Old Password</label>

                      <div class="col-sm-10">
                        <input type="password" name="oldpassword" class="form-control" id="oldpassword" placeholder="Password">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="newpassword" class="col-sm-2 control-label">New Password</label>

                      <div class="col-sm-10">
                        <input type="password" name="password" class="form-control" id="newpassword" placeholder="New Password">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="usertype" class="col-sm-2 control-label">Usertype</label>

                      <div class="col-sm-10">

                        <select name="usertype" class="form-control select2" style="width: 100%;">
                          <option disabled selected>Choose...</option>
                          <?php if($types): ?>
                            <?php foreach($types as $type): ?>
                              <option value="<?=$type['id']?>"<?php if($type['id'] == $items['type_id']) { echo 'selected'; } ?>><?=$type['title']?></option>
                            <?php endforeach; ?>
                          <?php endif; ?>
                        </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="image" class="col-sm-2 control-label">Profile Image</label>

                      <div class="col-sm-10">
                        <input type="file" name="image" class="form-control" id="image" placeholder="Profile Image">
                      </div>
                    </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <input type="hidden" name="id" value="<?=$items['id']?>"/>
                          <input type="hidden" name="img" value="<?=$items['img']?>"/>
                          <button type="submit" class="btn btn-success btn-flat">Update</button>
                          <input type="reset" class="btn btn-info btn-flat" value="Reset"/> 
                          <a href="javascript: submitform()" class="btn btn-danger btn-flat">Delete</a>
                        </div>
                      </div><!-- /.form-group pull-right -->
                  <?=form_close()?><!-- /.form-close -->
                  <!-- this-delete -->
                  <?=form_open('admin/users/delete', array('name' => 'myform'))?>
                      <input type="hidden" name="id" value="<?= $items['id'] ?>"/>
                  </form><!-- /.this-delete -->
                </div>
                <!-- /.box-body -->
              </div>
              <!-- /.box -->
            </div><!-- /.col-xs-12 -->
          </div><!-- /.row -->
        </div><!-- /.col-lg-12 col-xs-12 -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="#">BlahBlahBlah Studio</a>.</strong> All rights
    reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- JS -->
<?=$this->load->view('admin/js')?>
<!-- Delete form -->
<script type="text/javascript">
    function submitform() {
        document.myform.submit();
    }
</script>
</body>
</html>
