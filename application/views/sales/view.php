
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
        <li><a href="<?=base_url()?>">Home</a></li>
        <li><a href="<?=base_url('move')?>">Moving Queues</a></li>
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
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title">Sold Items</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>      
          </div>
        </div>
        <div class="box-body">
          <div class="row">           
            <div class="col-md-8 table-responsive">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th width="10%">Item ID</th>
                    <th width="40%">Item Name</th>
                    <th>SRP</th>
                    <th class="bg-info">QTY</th>
                    <th class="bg-info">DISC</th>
                    <th>Sub Total</th>
                  </tr>
                </thead>
                <?php if ($items): ?>
                <tbody>
                  <?php foreach ($items as $t): $qty[]=$t['qty']; $sub[]=(($t['qty']*$t['srp']) - ($t['qty']*$t['discount'])); $disc[] = ($t['qty']*$t['discount']);  ?>
                    <tr>
                      <td><?=$t['item_id']?></td>
                      <td><?=$t['name']?> - <?=$t['unit']?></td>
                      <td><?=$t['srp']?></td>
                      <td class="bg-info"><?=$t['qty']?></td>
                      <td class="bg-info"><?=$t['discount'] * $t['qty']?></td>
                      <td><?=decimalize(($t['qty']*$t['srp']) - ($t['qty'] * $t['discount']))?></td>
                    </tr>
                    <input type="hidden" name="id[]" value="<?=$this->encryption->encrypt($t['item_id'])?>" />
                  <?php endforeach ?>
                </tbody>
                <tfoot>
                  <tr>
                    <th colspan="3" class="text-right">Total</th>
                    <th class="bg-info text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                    <th class="bg-info text-danger"><?=array_sum($disc)?></th><!-- /.bg-success text-danger -->
                    <th class="bg-success text-danger"><?=decimalize(array_sum($sub))?></th><!-- /.bg-success text-danger -->
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
            <div class="col-md-4">
               <table class="table">
                 <tr>
                   <th class="bg-warning">Sold From</th>
                   <td class="text-blue bg-warning"><?=$info['location']?></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Customer</th>
                   <td class="text-blue bg-warning"><?=$info['customer']?></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Total Payables</th>
                   <td class="text-red bg-warning"><strong><?=decimalize(array_sum($sub))?></strong></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Amount Tendered</th>
                   <td class="text-blue bg-warning"><strong><?=$info['amount_tendered']?></strong></td>
                 </tr>
                 <tr>
                   <th class="bg-warning">Change</th>
                   <td class="text-green bg-warning"><strong><?=($info['amount_tendered'] - (array_sum($sub)))?></strong></td>
                 </tr>
                 <tr>
                   <th>Prepared by</th>
                   <td class="text-blue"><?=$info['user']?></td>
                 </tr>
                 <tr>
                   <th>Date Created</th>
                   <td><em><?=$info['created_at']?></em></td>
                 </tr>
                 <tr>
                   <th colspan="2">Remarks</th>
                 </tr>
                 <tr>
                   <td colspan="2" class="bg-info"><?=$info['remarks']?></td>
                 </tr>
               </table><!-- /.table -->             
            </div><!-- /.col-md-4 -->
          </div><!-- /.row -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
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

    <script type="text/javascript" src="<?=base_url('assets/custom/js/jquery-1.11.2.min.js')?>"></script> 
    <script src="<?=base_url('assets/bower_components/bootstrap/dist/js/bootstrap.min.js')?>"></script>
    <script src="<?=base_url('assets/dist/js/adminlte.min.js')?>"></script>
    <script src="<?=base_url('assets/custom/js/jquery-ui.js');?>" type="text/javascript" language="javascript" charset="UTF-8"></script>
    <script type="text/javascript">
      $(function(){
      $("#item").autocomplete({    
        source: "<?php echo base_url('index.php/exports/autocomplete_items');?>"
      });
    });
    </script>   
  
</body>
</html>
