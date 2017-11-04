
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title?> &middot; <?=$site_title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

  <?php $this->load->view('inc/css')?>
  <link rel="stylesheet" href="<?=base_url('assets/custom/css/print.css')?>" />

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body onload="window.print();">
<div class="wrapper">
  <!-- Main content -->
  <section class="invoice">
    <!-- title row -->
    <div class="row">
      <div class="col-xs-12">
        <h2 class="page-header">
          <?=$site_title?>
          <small class="pull-right">Printed: <?=unix_to_human(now())?></small>
          <small>Total Inventory Report</small>
        </h2>
      </div>
      <!-- /.col -->
    </div>
   
    <!-- Table row -->
    <div class="row">
      <div class="col-xs-12 table-responsive">
        <table class="table table-striped">
          <thead>
          <tr>
              <th></th>
              <th>Batch ID</th>
              <th>Location</th>
              <th>Item ID</th>
              <th>Name</th>
              <th>Category</th>
              <th>Brand</th>
              <th>Unit</th>
              <th>DP</th>
              <th>SRP</th>
              <th>QTY</th>
          </tr>
          </thead>
          <tbody>
            <?php if ($items): $x=1; ?>
            <?php foreach ($items as $item): $qty[]=$item['qty'];?>
            <tr>
              <td class="text-center"><?=$x++?>.</td>
              <td><?=$item['batch_id']?></td>
              <td><?=$item['location']?></td>
              <td><?=$item['id']?></td>
              <td><?=$item['name']?></td>
              <td><?=$item['category']?></td>
              <td><?=$item['brand']?></td>
              <td class="text-blue"><?=$item['unit']?></td>
              <td class="text-red"><?=$item['DP']?></td>
              <td class="text-green"><?=$item['SRP']?></td>
              <td>
                <?php if ($item['qty'] <= 10 || $item['qty'] <= $item['critical_level']): ?>
                  <span class="badge bg-red"><?=$item['qty']?></span>                    
                <?php elseif($item['qty'] <= 20 || $item['qty'] <= ($item['critical_level']*1.3)): ?>                                      
                  <span class="badge bg-yellow"><?=$item['qty']?></span>
                <?php else: ?>
                  <?=$item['qty']?>
                <?php endif ?>
              </td>              
            </tr>
            <?php endforeach ?>
            <?php else: ?>
            <tr>
              <td colspan="4">No items found!</td>
            </tr>
            <?php endif ?>
          </tbody>
        </table>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->

    <div class="row">
      <!-- accepted payments column -->
      <div class="col-xs-6">
        <div class="signature-container">
            <div class="signature" style="width: 200px;">
              <span class="signee"><?=$user['name']?></span>
              <span class="signee-title">Verified and Printed by</span>
              </div><!-- /.signature -->
         </div><!-- /.signature-container -->
      </div>
      <!-- /.col -->
      <div class="col-xs-6">
        <div class="table-responsive">
          <table class="table">
            <tr>
              <th style="width:50%">Total Quantity:</th>
              <td><h3 class="text-red"><?=array_sum($qty)?></h3></td>
            </tr>            
          </table>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!-- ./wrapper -->
</body>
</html>
