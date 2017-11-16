
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
        <li><a href="<?=base_url()?>">Dashboard</a></li>
        <li><a href="<?=base_url('categories')?>">Item Categories</a></li>
        <li class="active"><?=$title?></li>
      </ol>
    </section>

   <section class="content">

      <div class="row">
        <div class="col-xs-12">
          <?php
            //ALERT / NOTIFICATION
            //ERROR ACTION        
            $flash_error = $this->session->flashdata('error');
            $flash_success = $this->session->flashdata('success');
            $flash_valid =  validation_errors();   

            //show notif              
            echo $this->sessnotif->showNotif();

          ?>
        </div><!-- /.col-xs-12 -->
      </div><!-- /.row -->


       <!-- Default box -->
      <div class="box <?php if($this->session->flashdata('loc_item'))echo'collapsed-box'; ?>">
        <div class="box-header with-border">
          <h3 class="box-title"><?=$title?> Items <span class="badge"><?=$total_result?></span></h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-<?php if($this->session->flashdata('loc_item'))echo'plus';else echo 'minus';?>"></i></button>      
          </div>
        </div>
        <div class="box-body">
          <div class="row">
            <div class="col-md-12">
              <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                  <li <?php if(!($this->session->flashdata('flash_loc')))echo'class="active"'?>><a href="#items" data-toggle="tab">Item List</a></li>
                  <li><a href="#activity" data-toggle="tab">Activity Logs</a></li>
                  <li <?php if($this->session->flashdata('flash_loc'))echo'class="active"'?>><a href="#settings" data-toggle="tab">Settings</a></li>
                </ul>
                
                <!-- Item List -->
                <div class="tab-content">
                  <div class="tab-pane <?php if(!($this->session->flashdata('flash_loc')))echo'active'?>" id="items">
                    <?php if ($results): ?>
                      <table class="table table-bordered table-condensed table-hover">
                      <thead>
                        <tr>
                          <th>Item ID</th>
                          <th>Item Name</th>
                          <th>Unit</th>
                          <th>Brand</th>
                          <th class="bg-warning">Dealer</th>
                          <th class="bg-success">Actual</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($results as $res): ?>
                        <tr>
                        <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['id']?></a></td>
                        <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['name']?></a></td>
                        <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['unit']?></a></td>
                        <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['brand']?></a></td>
                        <td class="bg-warning"><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['dealer_price']?></a></td>
                        <td class="bg-success"><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['actual_price']?></a></td>
                      </tr>
                        <?php endforeach ?>
                      </tbody>
                      <tfoot>
                        <tr>
                          <td colspan="7">
                            <div class="pull-right">
                              <?php foreach ($links as $link) { echo $link; } ?>
                            </div><!-- /.pull-right -->
                          </td>
                        </tr>
                      </tfoot>
                    </table><!-- /.table table-condensed -->
                    <?php else: ?>
                      <div class="alert alert-warning">               
                        <h4><i class="icon fa fa-warning"></i> No item found!</h4>         
                        No items found in the system
                      </div>
                    <?php endif ?>
                  </div>
                  <!-- /.tab-pane -->

                <!-- Logs -->
                  <div class="tab-pane" id="activity">
                    <h4 class="title">Last 50 Activity</h4>
                    <?php if ($logs): ?>
                    <table class="table table-condensed">
                      <thead>
                        <tr>
                          <th>User</th>
                          <th>Action</th>
                          <th>Date Time</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($logs as $lg): ?>
                        <tr>
                          <td><?=$lg['user']?></td>
                          <td><?=$lg['action']?></td>
                          <td><?=$lg['date_time']?></td>
                        </tr>
                        <?php endforeach ?>
                      </tbody>
                    </table><!-- /.table table-condensed -->
                    <?php else: ?>
                      <div class="alert alert-warning">               
                        <h4><i class="icon fa fa-warning"></i> No records found!</h4>         
                        No Activity Logs record found in the system
                      </div>
                    <?php endif ?>
                  </div>
                  <!-- /.tab-pane -->
                  
                  <!-- Settings -->
                  <div class="tab-pane <?php if($this->session->flashdata('flash_loc'))echo'active'?>" id="settings">
                  <?=form_open('units/view/'.$info['id'], array('class' => 'form-horizontal'))?>                
                      <div class="form-group">
                        <label for="title" class="col-sm-2 control-label">Item Unit</label>

                        <div class="col-sm-10">
                          <input type="text" name="title" class="form-control" id="title" placeholder="Item Unit..." value="<?=$info['title']?>" >
                        </div>
                      </div>                 
                      <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />                 
                      <div class="form-group">
                          <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-warning pull-right">Update</button>                                        
                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete">Delete</button> 
                          </div>                                         
                      </div><!-- /.form-group -->
                  <?=form_close()?>
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
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->


      

    </section>
  </div>
  <!-- /.content-wrapper -->

  <!-- Modals -->
  
        <div class="modal modal-danger fade" id="modalDelete" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('units/delete')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Delete <?=$info['title']?></h4>
              </div>
              <div class="modal-body">
                <p>Are you sure to delete the record of <strong ><?=$info['title']?></strong>?</p>
                <p>You <strong>CANNOT UNDO</strong> this action.</p>
                <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline">Delete Item Unit</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>


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
        source: "<?php echo base_url('index.php/move/autocomplete_items/'.$info['id']);?>"
      });
    });
    </script>  

  
</body>
</html>
