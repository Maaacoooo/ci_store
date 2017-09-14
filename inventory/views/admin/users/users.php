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
  <style>
    .img-thumbnail{
      width:120px;
      height:100px;
    }
  </style>
  <!-- DataTables -->
  <link rel="stylesheet" href="<?=base_url('assets/AdminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css')?>">
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
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title"><?=$title?></h3>
                  <div class="box-tools">
                    <div class="input-group input-group-sm" style="width: 150px;">
                      <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                      <th>Profile</th>
                      <th>User</th>
                      <th>Last Login</th>
                      <th>Usertype</th>
                      <th>Action</th>
                    </tr>
                    <?php if($results): ?>
                      <?php foreach($results AS $users): ?>
                      <tr>
                        <td width="20%">
                         <?php if($users['img']){?>
                         <a href="<?=base_url('admin/users/update/'. $users['id'])?>"><img src="<?=base_url('uploads/'.$users['img'])?>" alt="..." class="img-thumbnail profile"></a>
                         <?php } else { ?>
                         <a href="<?=base_url('admin/users/update/'. $users['id'])?>"><img src="<?=base_url('assets/images/user.png')?>" alt="..." class="img-thumbnail profile"></a>
                         <?php } ?>
                        </td>
                        <td><a href="<?=base_url('admin/users/update/'. $users['id'])?>"><?=$users['name']?></a></td>
                        <td>
                          <span class="badge">
                            <?php
                            if($users['last_login']){
                                echo timespan($users['last_login']) . ' Ago';
                              } else {
                                echo 'No Login Data';
                              }
                            ?>
                          </span>
                        </td>
                        <td>
                          <?php if($users['typetitle'] == 'Administrator') { ?>
                            <a href="<?=base_url('admin/users/update/'. $users['id'])?>"><span class="label label-danger"><?=$users['typetitle']?></span></a>
                          <?php } elseif($users['typetitle'] == 'Sales') { ?>
                            <a href="<?=base_url('admin/users/update/'. $users['id'])?>"><span class="label label-info"><?=$users['typetitle']?></span></a>
                          <?php } elseif($users['typetitle'] == 'Customer') {?>
                            <a href="<?=base_url('admin/users/update/'. $users['id'])?>"><span class="label label-success"><?=$users['typetitle']?></span></a>
                          <?php } ?>
                        </td>
                        <td>
                          <a href="#" class="btn btn-info btn-md btn-flat"  title="view profile"><i class="fa fa-eye"></i></a>
                          <a href="#" class="btn btn-danger btn-md btn-flat"  title="delete user"><i class="fa fa-trash"></i></a>
                        </td>
                      </tr>
                      <?php endforeach; ?>
                    <?php endif; ?>
                  </table><!-- /.table -->
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col-xs-12 -->
          </div><!-- /.row -->
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
<!-- DataTables -->
<script src="<?=base_url('assets/AdminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/AdminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js')?>"></script>
</body>
</html>
