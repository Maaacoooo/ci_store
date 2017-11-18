
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
        <?=$title?>        
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?=base_url()?>">Dashboard</a></li>
        <li><a href="<?=base_url('brands')?>">Item Brands</a></li>
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
         ?>    
          <?=$this->sessnotif->showNotif()?>
        </div><!-- /.col-xs-12 -->
      </div><!-- /.row -->

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">             
              <?php if (filexist($info['logo']) && $info['logo']): ?>
                <img class="profile-user-img img-responsive" src="<?=base_url($info['logo'])?>" alt="User profile picture">
              <?php else: ?>
                <img class="profile-user-img img-responsive" src="<?=base_url('assets/img/no_image.gif')?>" alt="User profile picture">                
              <?php endif ?>

              <h3 class="profile-username text-center"><?=$info['title']?></h3>

              <ul class="list-group list-group-unbordered">                
                <li class="list-group-item">
                  <b>Web Address</b> <a class="pull-right"><?=$info['web']?></a>
                </li>            
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
              <li <?php if(!($flash_error || $flash_success || $flash_valid))echo'class="active"'?>><a href="#items" data-toggle="tab">Item List</a></li>
              <li><a href="#activity" data-toggle="tab">Activity Logs</a></li>
              <li <?php if($flash_error || $flash_success || $flash_valid)echo'class="active"'?>><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            
            <!-- Item List -->
            <div class="tab-content">
              <div class="tab-pane <?php if(!($flash_error || $flash_success || $flash_valid))echo'active'?>" id="items">
                <?php if ($results): ?>
                <table class="table table-condensed table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Item Name</th>
                      <th>Category</th>
                      <th>Unit</th>
                      <th>DP</th>
                      <th>SRP</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($results as $item): ?>
                    <tr>
                      <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['id']?></a></td>
                      <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['name']?></a></td>
                      <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['category']?></a></td>
                      <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['unit']?></a></td>
                      <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['dealer_price']?></a></td>
                      <td><a href="<?=base_url('items/view/'.$item['id'])?>"><?=$item['actual_price']?></a></td>
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
                      <th>IP Address</th>
                      <th>Date Time</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($logs as $lg): ?>
                    <tr>
                      <td><?=$lg['user']?></td>
                      <td><?=$lg['action']?></td>
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
              
              <!-- Settings -->
              <div class="tab-pane <?php if($flash_error || $flash_success || $flash_valid)echo'active'?>" id="settings">
              <?=form_open_multipart('brands/view/'.$info['id'], array('class' => 'form-horizontal'))?>                
                  <div class="form-group">
                    <label for="title" class="col-sm-2 control-label">Item Brand</label>

                    <div class="col-sm-10">
                      <input type="text" name="title" class="form-control" id="title" placeholder="Brand..." value="<?=$info['title']?>" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="web" class="col-sm-2 col-md-2 control-label">Web Address</label>
                    <div class="col-sm-10 col-md-4">
                      <input type="web" name="web" class="form-control" id="web" placeholder="http://webadress.com" value="<?=$info['web']?>" required>
                    </div>

                    <label for="img" class="col-sm-2 col-md-2 control-label">Brand Logo</label>
                    <div class="col-sm-10 col-md-4">        
                        <input type="file" name="img" id="img">       
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

    </section>
  </div>
  <!-- /.content-wrapper -->

  <!-- Modals -->
  
        <div class="modal modal-danger fade" id="modalDelete" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('brands/delete')?>
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
                <button type="submit" class="btn btn-outline">Delete Brand</button>
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

    <?php $this->load->view('inc/js')?>    
    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>

  
</body>
</html>
