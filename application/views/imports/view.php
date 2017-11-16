
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
        <li><a href="<?=base_url('imports')?>">Imports</a></li>
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

      

    <div class="row">      
      <div class="col-sm-12">
        <!-- Default box -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">Import Items</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
              </div>
            </div>
            <div class="box-body">
              <div class="row">             
                <div class="col-md-12 table-responsive">
                  <table class="table table-bordered table-condensed">
                    <thead>
                      <tr>
                        <th>Batch ID</th>
                        <th>Item ID</th>
                        <th width="40%">Item Name</th>
                        <th>Unit</th>
                        <th>DP <small><a href="#"><i class="fa fa-question-circle-o"></i></a></small></th>
                        <th>SRP <small><a href="#"><i class="fa fa-question-circle-o"></i></a></small></th>
                        <th class="bg-warning">ARP <small><a href="#"><i class="fa fa-question-circle-o"></i></a></small></th>
                        <th>Est. Fee <small><a href="#"><i class="fa fa-question-circle-o"></i></a></small></th>
                        <th>Est. Prof <small><a href="#"><i class="fa fa-question-circle-o"></i></a></small></th>
                        <th class="bg-info">QTY</th>
                        <th>Sub Total <small><a href="#"><i class="fa fa-question-circle-o"></i></a></small></th>
                      </tr>
                    </thead>
                    <?php if ($items): ?>
                    <tbody>
                      <?php foreach ($items as $t): $qty[]=$t['qty']; $sub[]=($t['qty']*$t['dealer_price']); ?>
                        <tr>
                          <td><?=$t['batch_id']?></td>
                          <td><?=$t['item_id']?></td>
                          <td><?=$t['name']?></td>
                          <td><?=$t['unit']?></td>
                          <td class="text-red"><?=$t['dealer_price']?></td>
                          <td class="text-green"><?=($t['dealer_price'])*1.25?></td>
                          <td class="bg-warning strong"><?=$t['actual_price']?></td>
                          <td class="text-yellow">00.00</td>
                          <td class="text-blue strong"><?=decimalize(($t['actual_price'])-($t['dealer_price']))?></td>
                          <td class="bg-info"><?=$t['qty']?></td>
                          <td><?=decimalize($t['qty']*$t['dealer_price'])?></td>
                        </tr>
                      <?php endforeach ?>
                    </tbody>
                    <tfoot>
                      <tr>
                        <th colspan="8" class="text-right">Total</th>
                        <th class="bg-info text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                        <th class="bg-success text-danger"><?=array_sum($sub)?></th><!-- /.bg-success text-danger -->
                      </tr>
                      <tr>
                        <th colspan="9" class="text-right">Total Est. Profit</th>
                        <th class="bg-success text-blue"><?=array_sum($sub)?></th><!-- /.bg-success text-blue -->
                      </tr>
                    </tfoot>
                    <button type="submit" class="hidden"></button>
                    <?php else: ?>
                      <tr>
                        <td colspan="6">
                          <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <p>Oops! No Item Found!</p>
                          </div>
                        </td>
                      </tr>
                    <?php endif ?>
                  </table><!-- /.table table-bordered -->
                </div><!-- /.col-md-8 -->
              </div><!-- /.row -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
          <!-- /.box -->
      </div><!-- /.col-md-8 div col-sm-12 -->
    </div><!-- /.row -->
    <div class="row">
      <div class="col-sm-12">
        <div class="row">
          <div class="col-md-12">
            <!-- Default box -->
              <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">Import Details</h3>
                  <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
                  </div>
                </div>
                <div class="box-body">
                       <table class="table">                         
                         <tr>
                           <th>Import ID</th>
                           <td class="bg-warning text-red">IMP #<?=$info['id']?></td>
                         </tr>
                         <tr>
                           <th>Verified by</th>
                           <td class="text-blue"><?=$info['user']?></td>
                         </tr>
                         <tr>
                           <th>Storage</th>
                           <td class="text-blue"><?=$info['location']?></td>
                         </tr>
                         <tr>
                           <th>Status</th>
                           <td>
                             <?php if ($info['status'] == 1): ?>
                               <span class="label bg-yellow">Pending</span>
                             <?php elseif($info['status'] == 2): ?>
                               <span class="label bg-green">Verified</span>                      
                               <span class="label bg-green">Imported</span>                       
                             <?php endif ?>
                           </td>
                         </tr>
                         <tr>
                           <th>Last Update</th>
                           <td><em><?=$info['updated_at']?></em></td>
                         </tr>
                         <tr>
                           <th>Date Created</th>
                           <td><em><?=$info['created_at']?></em></td>
                         </tr>
                         <tr>
                           <th colspan="2">Remarks</th>
                         </tr>
                         <tr>
                           <td colspan="2"><?=$info['remarks']?></td>
                         </tr>
                       </table><!-- /.table -->             
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                </div>
                <!-- /.box-footer-->
              </div>
              <!-- /.box -->
          </div><!-- /.col-md-12 -->
        </div><!-- /.row -->
      </div><!-- /.col-sm-12 -->
    </div><!-- /.row -->

      

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
    
</body>
</html>
