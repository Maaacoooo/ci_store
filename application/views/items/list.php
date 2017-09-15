
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

      <!-- Default box -->
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Product List <span class="badge"><?=$total_result?></span></h3>
          <div class="box-tools pull-right">            
            <?=form_open('items', array('method' => 'get', 'class' => 'input-group input-group-sm', 'style' => 'width: 150px;'))?>
              <input type="text" name="search" class="form-control pull-right" placeholder="Search...">
              <div class="input-group-btn">
                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                <button type="button" class="btn btn-default btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                  <i class="fa fa-minus"></i>
                </button>  
              </div> 
            <?=form_close()?> 

          </div>
        </div>
        <div class="box-body table-responsive no-padding">
          <table class="table">            
            <?php if ($results): ?>
            <thead>
              <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Brand</th>
                <th>Category</th>
                <th>SRP</th>
                <th>DP</th>
                <th>QTY</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($results as $res): ?>
                <tr>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['id']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['name']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['brand']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['category']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['SRP']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['DP']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['qty']?></a></td>
                </tr>
              <?php endforeach; ?>
            </tbody>              
            <?php endif; ?>              
          </table><!-- /.table table-bordered -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <a href="<?=base_url('items/print_total_inventory')?>" target="_blank" class="btn btn-primary btn-sm"><i class="fa fa-print"></i> Print Total Inventory Report</a>          
          <div class="pull-right">
            <?php foreach ($links as $link) { echo $link; } ?>
          </div><!-- /.pull-right -->

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->


      <div class="box <?php if(!validation_errors())echo "collapsed-box"; else echo "box-danger";?>">
        <div class="box-header with-border">
          <h3 class="box-title">Register New Product</h3>
          <div class="box-tools pull-right">
              <button type="button" class="btn btn-default btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-plus"></i></button>            
          </div><!-- /.box-tools pull-right -->
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <?=form_open_multipart('items', array('class' => 'form-horizontal'))?>
          <div class="box-body">
            <div class="form-group">
              <label for="name" class="col-sm-2 control-label">Item Name</label>

              <div class="col-sm-10">
                <input type="text" name="name" class="form-control" id="name" placeholder="Item Name..." value="<?=set_value('name')?>" >
              </div>
            </div>
            <div class="form-group">
              <label for="serial" class="col-sm-2 control-label">Serial No. / Control No.</label>

              <div class="col-sm-10">
                <input type="text" name="serial" class="form-control" id="serial" placeholder="Serial No. " value="<?=set_value('serial')?>" >
              </div>
            </div>
            <div class="form-group">
              <label for="name" class="col-sm-2 col-md-2 control-label">Unit</label>
              <div class="col-sm-10 col-md-2">        
                  <select name="unit" class="form-control" required="">
                    <option disabled="" selected="">Select Unit...</option>
                     <?php 
                        if($units):
                        foreach($units as $unit):
                      ?>
                      <option value="<?=$unit['title']?>"><?=$unit['title']?></option>
                      <?php
                        endforeach;
                        endif;
                      ?>
                  </select>       
               </div>

              <label for="name" class="col-sm-2 col-md-2 control-label">Category</label>
              <div class="col-sm-10 col-md-2">        
                  <select name="category" class="form-control" required="">
                    <option disabled="" selected="">Select Category...</option>
                     <?php 
                        if($category):
                        foreach($category as $cat):
                      ?>
                      <option value="<?=$cat['title']?>"><?=$cat['title']?></option>
                      <?php
                        endforeach;
                        endif;
                      ?>
                  </select>       
               </div>

              <label for="brand" class="col-sm-2 col-md-2 control-label">Brand</label>
              <div class="col-sm-10 col-md-2">        
                  <select name="brand" class="form-control" required>
                    <option disabled="" selected="">Select Brand...</option>
                     <?php 
                        if($brands):
                        foreach($brands as $brn):
                      ?>
                      <option value="<?=$brn['title']?>"><?=$brn['title']?></option>
                      <?php
                        endforeach;
                        endif;
                      ?>
                  </select>       
               </div>
            </div>
            <div class="form-group">
              <label for="dp" class="col-sm-2 col-md-2 control-label">DP</label>
              <div class="col-sm-10 col-md-4">
                <input type="number" name="dp" class="form-control" id="dp" placeholder="Dealer's Price..." value="<?=set_value('dp')?>" required>
              </div>

              <label for="srp" class="col-sm-2 col-md-2 control-label">SRP</label>
              <div class="col-sm-10 col-md-4">
                <input type="number" name="srp" class="form-control" id="srp" placeholder="Retail Price..." value="<?=set_value('srp')?>" required>
              </div>
            </div>
            <div class="form-group">
              <label for="desc" class="col-sm-2 control-label">Description</label>
              <div class="col-sm-10">
                <textarea name="desc" id="desc" cols="30" rows="10" class="ckeditor"><?=set_value('description')?></textarea>
              </div>
            </div>         

          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <button type="submit" class="btn btn-info pull-right">Register New User</button>
          </div>
          <!-- /.box-footer -->
        <?=form_close()?>
      </div>



    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">    
    <?php $this->load->view('inc/footer')?>    
  </footer>

</div>
<!-- ./wrapper -->

    <?php $this->load->view('inc/js')?>    
    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>
    
</body>
</html>

