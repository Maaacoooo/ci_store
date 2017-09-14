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
  <!-- Select2 Type -->
  <link rel="stylesheet" href="<?=base_url('assets/select2/select2.min.css')?>">
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
              <div class="col-md-12"> 
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
              <!-- Get-object-records -->
              <?=form_open('admin/imports/create_object_record')?>
              <div class="col-md-12">                           
                <div class="col-md-6">
                  <div class="form-group">
                  <select class="form-control select2-object" id="objects" name="obj_id" style="width:100%" required>       
                      <option selected disabled>Select Item...</option>                      
                  </select>
                  </div><!-- /form-group -->
                </div><!-- /.col-lg-6 -->
                 <div class="col-md-3">
                  <div class="form-group">
                    <input type="number" name="qty" min="1" class="form-control" required/>
                  </div><!-- /form-group -->
                </div><!-- /.col-lg-3 --> 
                <div class="col-md-1">
                  <div class="form-group">
                    <button type="submit" class="btn btn-app"><i class="fa fa-plus"></i>Add</button>
                  </div><!-- /.form-group -->
                </div><!-- /.col-md-1 -->  
                  <?php if($results) { ?>
                 <div class="col-md-1">
                  <div class="form-group">
                    <a href="#modal_import" data-toggle="modal" title="View Description" class="btn btn-app"><i class="fa fa-inbox"></i>Import</a>
                  </div><!-- /form-group -->
                </div><!-- /.col-lg-2 --> 
                  <?php } ?>
                 <div class="col-md-1">
                  <div class="form-group">
                    <a href="#model_reset" data-toggle="modal" title="Reset Imported Items" class="btn btn-app"><i class="fa fa-repeat"></i>Reset</a>
                  </div><!-- /form-group -->
                </div><!-- /.col-lg-2 --> 
              </div><!-- /.col-md-12 -->
              <?=form_close()?>
              <!-- /.Get-object-records -->
              <!-- Start-table -->
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>Unit</th>
                  <th>Original Price</th>
                  <th>Quantity</th>
                  <th>Amount</th>
                  <th>Action</th>
                </tr>
                </thead>
                  <?php 
                  // xD xD xD xD xD
                  if($results) { 
                    $total_price = 0;
                  ?>
                <tbody>
                  <?php foreach($results AS $inventory): ?>
                    <tr>
                      <td><?=$inventory['items_name']?></td>
                      <td><?=$inventory['items_unit']?></td>
                      <td>₱ <?= number_format((float)$inventory['items_op'] , 2, '.', ',') ?></td>
                      <td><?=$inventory['qty']?></td>
                      <td>₱ <?= number_format((float)$amount = $inventory['items_op'] * $inventory['qty'] , 2, '.', ',')?></td>
                      <?php $total_price = $total_price+$amount; ?>
                      <td>
                        <a href="#modal_description<?=$inventory['id']?>" data-toggle="modal" class="btn btn-info btn-md btn-flat" title="View Description"><i class="fa fa-eye"></i></a>
                        <a href="#" class="btn btn-danger btn-md btn-flat" title="Reject item"><i class="fa fa-trash"></i></a>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                </tbody>
                <tfoot>
                <tr>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th>Total Quantity:</th>
                  <th>Total Amount:</th>
                  <th></th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td class="danger"><?=$qty?></td>
                  <td class="danger">
                    ₱ <?= number_format((float)$total_price , 2, '.', ',')?>
                  </td>
                  <td></td>  
                </tr>
                </tfoot>
              <?php } ?>
              </table><!-- /.import-table -->
              </div><!-- /.col-md-12 -->
            </div><!-- /.box-body -->
          </div><!-- /.box -->
        </div><!-- /.col-lg-12 col-xs-12 -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- modal-import -->
  <div class="modal fade" id="modal_import">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Import Description</h4>
        </div>
        <!-- form-import -->
        <?=form_open('admin/imports/create')?>
        <div class="modal-body">
          <div class="form-group">
            <label for="description">Description</label>
            <div class="box-body pad">
              <textarea class="textarea" name="description" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">   
              </textarea>
            </div><!-- /.box-body pad -->
          </div><!-- /.form-group -->
        </div><!-- /.modal-body -->
        <div class="modal-footer">
            <?php
             if($results) { ?>
            <input type="hidden" name="total_amount" value="<?=$total_price; ?>"/>
            <?php } ?>
            <a href="#" class="btn btn-default pull-left" data-dismiss="modal">Close</a>
          <button type="submit" class="btn btn-primary">Continue Import</button>
        </div><!-- /.modal-footer -->
        <?=form_close()?>
        <!-- /.form-import -->
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal-import -->
<!-- modal-reset -->
  <?=$this->load->view('admin/items/imports/modals/modal_reset')?>
<!-- /.modal-reset -->
<!-- modal-description -->
  <?=$this->load->view('admin/items/imports/modals/modal_description')?>
<!-- /.modal-description -->
  <!-- main-footer -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.4.0
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="#">BlahBlahBlah Studio</a>.</strong> All rights
    reserved.
  </footer><!-- /.main-footer -->
</div>
<!-- ./wrapper -->

<!-- JS -->
<?=$this->load->view('admin/js')?>
<!-- DataTables -->
<script src="<?=base_url('assets/AdminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js')?>"></script>
<script src="<?=base_url('assets/AdminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js')?>"></script>
<!-- Select2 -->
<script type="text/javascript" src="<?= base_url('assets/select2/select2.min.js') ?>" id="datepicker"></script>
<!-- page script -->
<script type="text/javascript">
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
// AJax searching objects 
$(document).ready(function() {
      $(".select2-object").select2({
      ajax: {
        url: '<?=base_url('admin/imports/get_json_objects')?>',
        dataType: 'json',
        delay: 20,
        data: function (params) {
            return {
                term: params.term
            };
        },
        processResults: function (data) {
            var myResults = [];
            $.each(data, function (index, item) {
                myResults.push({
                    'id': item.id,
                    'text': item.text
                });
            });
            return {
                results: myResults
            };
        }
    },
    minimumInputLength: 1,
    tags: true,
    placeholder: 'Choose Item...'
    });

});

</script>

</body>
</html>
