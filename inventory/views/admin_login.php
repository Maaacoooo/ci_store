
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- CSS -->
  <?=$this->load->view('css.php')?>

</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="<?=base_url('admin/admin_login')?>"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
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
    <!-- Login-Form -->
    <?= form_open('admin/admin_login', array('class' => 'form-signin')) ?>
      <div class="form-group has-feedback">
        <input type="text" name="username" class="form-control" placeholder="Username">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4 pull-right">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>
    <!-- /.login-form -->
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- JS -->
<?=$this->load->view('js.php')?>

</body>
</html>
