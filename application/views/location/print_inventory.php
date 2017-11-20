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
  <body onload="#window.print();">
    <div class="wrapper">
      <!-- Main content -->
      <section class="invoice">
        <!-- title row -->
        <div class="row">
          <div class="col-xs-12">
            <h2 class="page-header">
            <?=$site_title?>
            <small class="pull-right">Printed: <?=unix_to_human(now())?></small>
            <small>Storage Inventory Report &middot; <?=$info['title']?></small>
            </h2>
          </div>
          <!-- /.col -->
        </div>
        
        <!-- Table row -->
        <div class="row">
          <div class="col-xs-12 table-responsive">
            <table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th></th>
                  <th>Batch ID</th>
                  <th>Item ID</th>
                  <th>Name</th>
                  <th>Serial</th>
                  <th>Category</th>
                  <th>Brand</th>
                  <th>Dealer</th>
                  <th>Actual</th>
                  <th>QTY</th>
                  <th>Total Cost(DP)</th>
                </tr>
              </thead>
              <tbody>
                <?php if ($results): $x=1; ?>
                <?php 
                foreach ($results as $item): 
                  $qty[]=$item['qty']; //build an array of qty
                  $total_cost[] = $item['qty']*$item['dealer_price']; //build an array of total cost per item
                ?>
                <tr>
                  <td class="text-center"><?=$x?>.</td>
                  <td><?=$item['batch_id']?></td>
                  <td><?=$item['id']?></td>
                  <td><?=$item['name']?></td>
                  <td><?=$item['serial']?></td>
                  <td><?=$item['category']?></td>
                  <td><?=$item['brand']?></td>
                  <td class="bg-danger"><?=$item['dealer_price']?></td>
                  <td class="bg-success"><?=$item['actual_price']?></td>
                  <td>
                    <?php
                    $critical = 10; //default critical level
                    if($item['critical_level']) {
                    $critical = $item['critical_level']; //override critical level
                    }
                    ?>
                    <?php if ($item['qty'] <= $critical): ?>
                    <span class="text-red strong">
                      <?=$item['qty']?>
                      <i class="fa fa-exclamation-circle"></i>
                    </span>
                    <?php elseif($item['qty'] <= ($critical)*1.3): ?>
                    <span class="text-yellow">
                      <?=$item['qty']?>
                    </span>
                    <?php else: ?>
                    <span class="text-green">
                      <?=$item['qty']?>
                    </span>
                    <?php endif ?>
                    
                  </td>
                  <td><?=$total_cost[$x-1]?></td>
                </tr>
                <?php $x++; endforeach ?>
                <?php else: ?>
                <tr>
                  <td colspan="10">No items found!</td>
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
                      <td><?=array_sum($qty)?></td>
                    </tr>
                    <tr>
                      <th style="width:50%">Total Storage Cost (DP):</th>
                      <td><?=moneytize(array_sum($total_cost))?></td>
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