
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
          <?=$this->sessnotif->showNotif()?>
        </div><!-- /.col-xs-12 -->
      </div><!-- /.row -->

      <!-- Default box -->
      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title">Exports <span class="badge"><?=$total_result?></span></h3>
          <div class="box-tools pull-right">            
            <?=form_open('exports', array('method' => 'get', 'class' => 'input-group input-group-sm', 'style' => 'width: 150px;'))?>
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
                    <th>Export ID</th>                
                    <th>Courier</th>
                    <th>Tracking No.</th>
                    <th>Brand</th>
                    <th>Preparer</th>
                    <th>Last Update</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($results as $res): ?>
                    <tr>
                      <td>
                        <a href="<?=base_url('exports/view/'.$res['id'])?>">#<?=prettyID($res['id'])?></a>
                        <?php if ($res['status'] == 1): ?>
                           <span class="label bg-yellow">Pending</span>
                         <?php elseif($res['status'] == 2): ?>
                           <span class="label bg-blue">Verified</span>                      
                           <span class="label bg-blue">In-Transit</span>   
                         <?php elseif($res['status'] == 3): ?>
                           <span class="label label-info">Received</span>                                    
                           <span class="label label-warning">Verification</span>     
                         <?php elseif($res['status'] == 4): ?>
                           <span class="label bg-green">Imported</span>                                    
                           <span class="label bg-green">Verified</span>                                    
                         <?php endif ?>
                      </td>                  
                      <td class="bg-warning"><a href="<?=base_url('exports/view/'.$res['id'])?>"><?=$res['courier']?></a></td>
                      <td class="bg-warning"><a href="<?=base_url('exports/view/'.$res['id'])?>"><?=$res['tracking_no']?></a></td>
                      <td><a href="<?=base_url('exports/view/'.$res['id'])?>"><?=$res['brand']?></a></td>
                      <td><a href="<?=base_url('exports/view/'.$res['id'])?>"><?=$res['user']?></a></td>
                      <td><a href="<?=base_url('exports/view/'.$res['id'])?>"><?=$res['updated_at']?></a></td>                  
                    </tr>
                  <?php endforeach; ?>
                </tbody>  
              </table><!-- /.table -->
            <?php else: ?>
            <div class="row">
              <div class="col-md-12">
                <div class="callout callout-info">
                  <h4>No Export Found!</h4>
                  <p>No records found in the database</p>
                </div><!-- /.callout callout-info -->
              </div><!-- /.col-md-12 -->
            </div><!-- /.row -->            
            <?php endif; ?>              
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
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

    <?php $this->load->view('inc/js')?>    
    <script src="<?=base_url('assets/bower_components/ckeditor/ckeditor.js')?>"></script>
    
</body>
</html>


