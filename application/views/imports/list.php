
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
          <h3 class="box-title">Imports <span class="badge"><?=$total_result?></span></h3>
          <div class="box-tools pull-right">            
            <?=form_open('imports', array('method' => 'get', 'class' => 'input-group input-group-sm', 'style' => 'width: 150px;'))?>
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
        <div class="box-body <?php if($results)echo 'table-responsive no-padding';?>">
            <?php if ($results): ?>
              <table class="table">          
                <thead>
                  <tr>
                    <th>Import ID</th>               
                    <th>Verifier</th>
                    <th>Date Time</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($results as $res): ?>
                    <tr>
                      <td>
                        <a href="<?=base_url('imports/view/'.$res['id'])?>">#<?=prettyID($res['id'], 5)?></a>
                        <?php if ($res['status'] == 1): ?>
                           <span class="label bg-yellow">Pending</span>
                         <?php elseif($res['status'] == 2): ?>
                           <span class="label bg-green">Verified</span>                      
                           <span class="label bg-green">Imported</span>               
                         <?php endif ?>
                      </td>                 
                      <td><a href="<?=base_url('imports/view/'.$res['id'])?>"><?=$res['user']?></a></td>
                      <td><a href="<?=base_url('imports/view/'.$res['id'])?>"><?=$res['created_at']?></a></td>                  
                    </tr>
                  <?php endforeach; ?>
                </tbody>  
              </table><!-- /.table -->
            <?php else: ?>
            <div class="row">
              <div class="col-md-12">
                <div class="callout callout-info">
                  <h4>No Import Found!</h4>
                  <p>No records found in the database</p>
                </div><!-- /.callout callout-info -->
              </div><!-- /.col-md-12 -->
            </div><!-- /.row -->            
            <?php endif; ?>              
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <button class="btn btn-success" data-target="#modalCreate" data-toggle="modal"><i class="fa fa-cart-arrow-down"></i> Import Items</button>
          <div class="pull-right">
            <?php foreach ($links as $link) { echo $link; } ?>
          </div><!-- /.pull-right -->

        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->
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
    <div class="modal fade" id="modalCreate" style="display: none;">
          <div class="modal-dialog">
          <?=form_open('imports')?>
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">Create an Import Queue</h4>
              </div>
              <div class="modal-body">
                <div class="form-group">
                  <label for="supplier" class="control-label">Supplier / Source</label>      
                  <select name="supplier" class="form-control" required="">
                    <option disabled="" <?php if(!set_value('supplier'))echo'selected';?>>Select Supplier...</option>
                      <?php 
                        if($suppliers):
                        foreach($suppliers as $suppl):
                      ?>
                      <option value="<?=$suppl['title']?>" <?php if($suppl['title']==set_value('supplier'))echo'selected';?>><?=$suppl['title']?></option>
                      <?php
                         endforeach;
                         endif;
                       ?>
                  </select>       
                </div><!-- /.form-group -->
                <div class="form-group">
                  <label for="location" class="control-label">Location to Import</label>      
                  <select name="location" class="form-control" required="">
                    <option disabled="" <?php if(!set_value('supplier'))echo'selected';?>>Select Location...</option>
                      <?php 
                        if($locations):
                        foreach($locations as $loc):
                      ?>
                      <option value="<?=$loc['title']?>" <?php if($loc['title']==set_value('location'))echo'selected';?>><?=$loc['title']?></option>
                      <?php
                         endforeach;
                         endif;
                       ?>
                  </select>       
                </div><!-- /.form-group -->
                <div class="form-group">
                    <label for="desc" class="control-label">Remarks</label>              
                    <textarea name="remarks" id="remarks" cols="30" rows="10" class="ckeditor"></textarea>              
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success">Import</button>
              </div>
            </div>
            <!-- /.modal-content -->
          <?=form_close()?>
          </div>
          <!-- /.modal-dialog -->
        </div>

<!-- End Modals -->

    <?php $this->load->view('inc/js')?>    
    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>
    
</body>
</html>


