
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
        Batch <?=$batch['batch_id']?>    
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?=base_url()?>">Dashboard</a></li>
        <li><a href="<?=base_url('items')?>">Item Inventory</a></li>
        <li><a href="<?=base_url('items/view/'.$info['id'])?>"><?=$info['name']?></a></li>
        <li class="active"><?=$batch['batch_id']?></li>
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
          <div class="box box-warning">
            <div class="box-body box-profile">             
              <img class="img-responsive" src="<?=base_url('barcode.php?barcode='.$info['id'].'&width=230&text='.$info['id'])?>" alt="User profile picture">

              <h3 class="profile-username text-center"><?=$info['name']?></h3>
              <p class="text-muted text-center"><?=$info['serial']?></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Batch ID</b> <a class="pull-right"><?=$batch['batch_id']?></a>
                </li>
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
                  <b>DP</b> <a class="pull-right strong text-red"><?=$batch['dp']?></a>
                </li>
                <li class="list-group-item">
                  <b>SRP</b> <a class="pull-right strong text-green"><?=$batch['srp']?></a>
                </li>
                <li class="list-group-item">
                  <b>Total In Stock</b>
                  <?php if ($batch['qty'] <= 10 || $batch['qty'] <= $info['critical_level']): ?>
                     <a class="badge bg-red pull-right"><?=$batch['qty']?></a>
                  <?php elseif($batch['qty'] <= 20 || $batch['qty'] <= ($info['critical_level']*1.3)): ?>
                     <a class="badge bg-yellow pull-right"><?=$batch['qty']?></a>
                  <?php else: ?>                    
                     <a class="badge bg-green pull-right"><?=$batch['qty']?></a>                    
                  <?php endif ?>
                </li>
                <li class="list-group-item">
                  <b>Description</b>
                  <p><?=$info['description']?></p>
                </li>     
                <li class="list-group-item">
                  <button class="btn btn-block btn-primary btn-sm" data-target="#modalRebatch" data-toggle="modal"><i class="fa fa-gift"></i> Rebatch</a>
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
              <li class="active"><a href="#activity" data-toggle="tab">Activity Logs</a></li>
            </ul>
            <div class="tab-content">

              <div class="tab-pane active" id="activity">
                <h4 class="title">Last 50 Activity</h4>
                <?php if ($logs): ?>
                <table class="table table-condensed">
                  <thead>
                    <tr>
                      <th>User</th>
                      <th>Action</th>
                      <th>IP Address</th>
                      <th>Date Time</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($logs as $lg): ?>
                    <tr>
                      <td><?=$lg['user']?></td>
                      <td><?=$lg['action']?>
                        <?php if ($lg['tag'] == 'user'): ?>
                          <a href="<?=base_url('users/update/'.$lg['tag_id'])?>" title="Check out..."><i class="fa fa-external-link"></i></a>
                        <?php endif ?>
                      </td>
                      <td><?=$lg['ip_address']?></td>
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

<!-- Modals -->  
        <div class="modal fade" id="modalRebatch" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('items/rebatch')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Rebatch <?=$info['name']?> Batch <?=$batch['batch_id']?></h4>
              </div>
              <div class="modal-body">
                <p>Rebatching is a process to modify the DP and SRP. <br />
                Once DP and/or SRP are changed, the system will generate a new batch.</p>
                
                <p>To rebatch this current batch, please fill up the following:</p>
                <div class="row form-group">
                  <div class="col-sm-4">
                    <label for="qty">Quantity to Rebatch</label>
                    <input type="number" name="qty" id="qty" class="form-control" value="<?=$batch['qty']?>" required/>
                  </div><!-- /.col-sm-4 -->
                  <div class="col-sm-4">
                    <label for="dp">DP</label>
                    <input type="text" name="dp" id="dp" class="form-control" value="<?=$batch['dp']?>" required/>
                  </div><!-- /.col-sm-4 -->
                  <div class="col-sm-4">
                    <label for="srp">SRP</label>
                    <input type="text" name="srp" id="srp" class="form-control" value="<?=$batch['srp']?>" required/>
                  </div><!-- /.col-sm-4 -->
                </div><!-- /.form-group -->

                <p>Please note that you <strong class="text-red">CANNOT UNDO</strong> this action.</p>
                <input type="hidden" name="id" value="<?=$this->encryption->encrypt($batch['batch_id'])?>" />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-warning btn-flat">Rebatch</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>


    <?php $this->load->view('inc/js')?>    
    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>
   
</body>
</html>
