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
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"><?=$title?></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>User</th>
                  <th>Activity</th>
                  <th>Data</th>
                  <th>Total Amount</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>User</td>
                  <td>Activity</td>
                  <td>Data</td>
                  <td>Total Amount</td>
                  <td>Action</td>
                  <td>
                    <a href="#" data-toggle="modal" class="btn btn-info btn-md btn-flat" title="View Description"><i class="fa fa-eye"></i></a>
                    <a href="#" class="btn btn-danger btn-md btn-flat"  title="delete user"><i class="fa fa-trash"></i>
                  </td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                  <th>Title</th>
                  <th>Unit</th>
                  <th>Original Price</th>
                  <th>Selling Price</th>
                  <th>Stock</th>
                  <th>Action</th>
                </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div><!-- /.box -->
          <!-- /.box -->
        </div><!-- /.col-lg-12 col-xs-3 -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- modal-description -->
  <?=$this->load->view('admin/items/modals/modal_description')?>
  <!-- /.modal-description -->

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
<!-- DataTables -->
<script src="<?=base_url('assets/AdminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/AdminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js')?>"></script>
<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>
