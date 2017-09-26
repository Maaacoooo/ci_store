
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
        <li><a href="#">Home</a></li>
        <li><a href="#">Examples</a></li>
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
          <div class="box box-primary">
            <div class="box-body box-profile">             
              <img class="img-responsive" src="<?=base_url('barcode.php?barcode='.$info['id'].'&width=230&text='.$info['id'])?>" alt="User profile picture">

              <h3 class="profile-username text-center"><?=$info['name']?></h3>
              <p class="text-muted text-center"><?=$info['serial']?></p>

              <ul class="list-group list-group-unbordered">
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
                  <b>SRP</b> <a class="pull-right"><?=$info['SRP']?></a>
                </li>
                <li class="list-group-item">
                  <b>DP</b> <a class="pull-right"><?=$info['DP']?></a>
                </li>
                <li class="list-group-item">
                  <b>Description</b>
                  <p><?=$info['description']?></p>
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
              <li <?php if(!($flash_error || $flash_success || $flash_valid))echo'class="active"'?>><a href="#inventory" data-toggle="tab">Inventory</a></li>
              <li><a href="#activity" data-toggle="tab">Activity Logs</a></li>
              <li <?php if($flash_error || $flash_success || $flash_valid)echo'class="active"'?>><a href="#settings" data-toggle="tab">Settings</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane <?php if(!($flash_error || $flash_success || $flash_valid))echo'active'?>" id="inventory">
                <?php if ($inventory): ?>
                <table class="table table-condensed table-bordered">
                  <thead>
                    <tr>
                      <th>Location</th>
                      <th>QTY</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($inventory as $inv): ?>
                    <?php $qty[] = $inv['qty']; ?>
                    <tr>
                      <td><?=$inv['title']?></td>
                      <td><?=$inv['qty']?></td>                     
                    </tr>
                    <?php endforeach ?>
                  </tbody>
                  <tfoot>
                    <tr>
                      <td class="text-right bold">Total Items</td>
                      <td><?=array_sum($qty)?></td>
                    </tr>
                  </tfoot>
                </table><!-- /.table table-condensed -->
                <?php else: ?>
                  <div class="alert alert-warning">               
                    <h4><i class="icon fa fa-warning"></i> No records found!</h4>         
                    No Item found in all Locations
                  </div>
                <?php endif ?>
              </div>
              <!-- /.tab-pane -->

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
                      <td><?=$lg['action']?>
                        <?php if ($lg['tag'] == 'user'): ?>
                          <a href="<?=base_url('users/update/'.$lg['tag_id'])?>" title="Check out..."><i class="fa fa-external-link"></i></a>
                        <?php endif ?>
                      </td>
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

              <div class="tab-pane <?php if($flash_error || $flash_success || $flash_valid)echo'active'?>" id="settings">
              <?=form_open('items/view/'.$info['id'], array('class' => 'form-horizontal'))?>                
                  <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Item Name</label>

                    <div class="col-sm-10">
                      <input type="text" name="name" class="form-control" id="name" placeholder="Item Name..." value="<?=$info['name']?>" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="serial" class="col-sm-2 control-label">Serial No. / Control No.</label>

                    <div class="col-sm-10">
                      <input type="text" name="serial" class="form-control" id="serial" placeholder="Serial No. " value="<?=$info['serial']?>" >
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="name" class="col-sm-2 col-md-2 control-label">Unit</label>
                    <div class="col-sm-10 col-md-2">        
                        <select name="unit" class="form-control" required="">
                          <option disabled="">Select Unit...</option>
                           <?php 
                              if($units):
                              foreach($units as $unit):
                            ?>
                            <option value="<?=$unit['title']?>"  <?php if($unit['title']==$info['unit'])echo'selected';?>><?=$unit['title']?></option>
                            <?php
                              endforeach;
                              endif;
                            ?>
                        </select>       
                     </div>

                    <label for="name" class="col-sm-2 col-md-2 control-label">Category</label>
                    <div class="col-sm-10 col-md-2">        
                        <select name="category" class="form-control" required="">
                          <option disabled="">Select Category...</option>
                           <?php 
                              if($category):
                              foreach($category as $cat):
                            ?>
                            <option value="<?=$cat['title']?>" <?php if($cat['title']==$info['category'])echo'selected';?>><?=$cat['title']?></option>
                            <?php
                              endforeach;
                              endif;
                            ?>
                        </select>       
                     </div>

                    <?php if ($user['usertype']=='Administrator'): ?>
                    <label for="brand" class="col-sm-2 col-md-2 control-label">Brand</label>
                    <div class="col-sm-10 col-md-2">        
                        <select name="brand" class="form-control" required>
                          <option disabled="">Select Brand...</option>
                           <?php 
                              if($brands):
                              foreach($brands as $brn):
                            ?>
                            <option value="<?=$brn['title']?>" <?php if($brn['title']==$info['brand'])echo'selected';?>><?=$brn['title']?></option>
                            <?php
                              endforeach;
                              endif;
                            ?>
                        </select>       
                     </div>  
                    <?php endif ?>
                  </div>
                  <div class="form-group">
                    <label for="dp" class="col-sm-2 col-md-2 control-label">DP</label>
                    <div class="col-sm-10 col-md-4">
                      <input type="number" name="dp" class="form-control" id="dp" placeholder="Dealer's Price..." value="<?=$info['DP']?>" required>
                    </div>

                    <label for="srp" class="col-sm-2 col-md-2 control-label">SRP</label>
                    <div class="col-sm-10 col-md-4">
                      <input type="number" name="srp" class="form-control" id="srp" placeholder="Retail Price..." value="<?=$info['SRP']?>" required>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="desc" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                      <textarea name="desc" id="desc" cols="30" rows="10" class="ckeditor"><?=$info['description']?></textarea>
                    </div>
                  </div>
                  <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-warning pull-right">Update</button>                    
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#modalDelete">Delete</button> 
                      </div>                                            
                    </div>
                  </div>
                  <!-- /.tab-pane -->
              <?=form_close()?>            
              
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
        <div class="modal modal-danger fade" id="modalDelete" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('items/delete')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Delete <?=$info['name']?></h4>
              </div>
              <div class="modal-body">
                <p>Are you sure to delete the record of <strong ><?=$info['name']?></strong>?</p>
                <p>You <strong>CANNOT UNDO</strong> this action.</p>
                <input type="hidden" name="id" value="<?=$this->encryption->encrypt($info['id'])?>" />
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-outline">Delete Item</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>


    <?php $this->load->view('inc/js')?>    
  
</body>
</html>
