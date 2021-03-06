
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title?> &middot; <?=$site_title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <?php $this->load->view('inc/css')?>
  <script type="text/javascript">
    
  </script>
   
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
          <h3 class="box-title">Inventory Batch List <span class="badge"><?=$total_result?></span></h3>
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
          <table class="table table-bordered table-condensed table-hover">            
            <?php if ($results): ?>
            <thead>
              <tr>
                <th>Batch ID</th>
                <th>Item ID</th>
                <th>Item Name</th>
                <th>Unit</th>
                <th>Brand</th>
                <th>Category</th>
                <th>Location</th>
                <th class="bg-warning">Dealer</th>
                <th class="bg-success">Actual</th>
                <th>QTY</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($results as $res): ?>
                <tr>
                  <td><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['batch_id']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['id']?> <a class="text-maroon" href="<?=base_url('items/view/'.$res['id'])?>"><small>[view Item]</small></a></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['name']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['unit']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['brand']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['category']?></a></td>
                  <td><a class="text-danger" href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['location']?></a></td>
                  <td class="bg-warning"><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['dealer_price']?></a></td>
                  <td class="bg-success"><a href="<?=base_url('items/view/'.$res['id'].'/batch/'.$res['batch_id'])?>"><?=$res['actual_price']?></a></td>
                  <td>
                    <?php 
                      $critical = 10; //default critical level
                      if($res['critical_level']) {
                        $critical = $res['critical_level']; //override critical level
                      }
                    ?>     
                    <a href="<?=base_url('items/view/'.$res['id'])?>">                    
                      <?php if ($res['qty'] <= $critical): ?>
                          <span class="text-red strong">
                            <?=$res['qty']?>
                            <i class="fa fa-exclamation-circle"></i>                       
                          </span>
                      <?php elseif($res['qty'] <= ($critical)*1.3): ?>
                          <span class="text-yellow">
                            <?=$res['qty']?>                  
                          </span>
                      <?php else: ?>
                          <span class="text-green">
                            <?=$res['qty']?>                  
                          </span>
                      <?php endif ?>
                    </a>
                  </td>
                </tr>
              <?php endforeach; ?>
            </tbody>              
            <?php endif; ?>              
          </table><!-- /.table table-bordered -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          <?php if ($user['usertype']=='Administrator'): ?>
          <a href="<?=base_url('items/print_total_inventory')?>" target="_blank" class="btn btn-primary btn-sm"><i class="fa fa-print"></i> Print Total Inventory Report</a>            
          <?php endif ?>
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


