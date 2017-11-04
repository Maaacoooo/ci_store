
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?=$title?> &middot; <?=$site_title?></title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="<?=base_url('assets/custom/css/jquery-ui.min.css')?>">  
  <?php $this->load->view('inc/css')?>

  <script type="text/javascript">
    function updateChange() {
      var tendered = document.getElementById("amt_tendered").value;
      var total_amt = document.getElementById("totAmt").innerHTML;

      //Set change
      document.getElementById("change").innerHTML = tendered - total_amt;
    }
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
        <li><a href="<?=base_url('dashboard')?>">Dashboard</a></li>
        <li><a href="<?=base_url('sales')?>">Sales</a></li>
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
            //WARNING ACTION                          
            if($this->session->flashdata('warning')): ?>
            <div class="alert alert-warning alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-check"></i> Uhoh!</h4>
              <?=$this->session->flashdata('warning')?>
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
        <div class="col-md-8">
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Items</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>      
              </div>
            </div>
            <div class="box-body">
                  <?=form_open('sales/add_item')?>
                    <div class="input-group">
                      <input type="text" name="item" autofocus id="item" placeholder="Scan Barcode / Type to Search / Input ITEM ID or Serial..." class="form-control">
                      <input type="hidden" name="sale_id" value="<?=$this->encryption->encrypt(0)?>" />
                      <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-shopping-cart"></i> Add Item</button>
                      </div>
                      <!-- /btn-group -->                
                    </div>
                  <?=form_close()?>
                  <?=form_open('sales/update_items')?>
                    <input type="hidden" name="sale_id" value="<?=$this->encryption->encrypt(0)?>" />
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                          <th width="15%">Batch ID</th>
                          <th width="10%">Item ID</th>
                          <th width="40%">Item Name</th>
                          <th>SRP</th>
                          <th>QTY</th>
                          <th>DISC</th>
                          <th>Sub Total</th>
                        </tr>
                      </thead>
                      <?php $sub[] = 0; if ($items): ?>
                      <tbody>
                        <?php foreach ($items as $t): $qty[]=$t['qty']; $sub[]=(($t['qty']*$t['srp']) - ($t['qty'] * $t['discount'])); $disc[] = ($t['qty'] * $t['discount']); ?>
                          <tr>
                            <td><?=$t['batch_id']?></td>
                            <td><?=$t['item_id']?></td>
                            <td><?=$t['name']?> - <?=$t['unit']?></td>
                            <td><?=$t['srp']?></td>
                            <td><input type="number" name="qty[]" value="<?=$t['qty']?>" style="width: 60px"/></td>
                            <td><input type="text" name="disc[]" value="<?=$t['discount']?>" style="width: 60px"/></td>
                            <td><?=(($t['qty']*$t['srp']) - ($t['qty'] * $t['discount']))?></td>
                          </tr>
                          <input type="hidden" name="id[]" value="<?=$this->encryption->encrypt($t['batch_id'])?>" />
                        <?php endforeach ?>
                      </tbody>
                      <tfoot>
                        <tr>
                          <th colspan="4" class="text-right">Total</th>
                          <th class="bg-success text-danger"><?=array_sum($qty)?></th><!-- /.bg-success text-danger -->
                          <th class="bg-success text-danger"><?=decimalize(array_sum($disc))?></th><!-- /.bg-success text-danger -->
                          <th class="bg-success text-danger"><?=decimalize(array_sum($sub))?></th><!-- /.bg-success text-danger -->
                        </tr>
                      </tfoot>
                      <button type="submit" class="hidden"></button>
                      <?php else: ?>
                        <tr>
                          <td colspan="7">
                            <div class="alert alert-info alert-dismissible">
                              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                              <p>Add an item</p>
                            </div>
                          </td>
                        </tr>
                      <?php endif ?>
                    </table><!-- /.table table-bordered -->
                    <?=form_close()?>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
          <!-- /.box -->
        </div><!-- /.col-md-8 -->
        <div class="col-md-4">
          <!-- Default box -->
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Sale Options</h3>
              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                        title="Collapse">
                  <i class="fa fa-minus"></i></button>      
              </div>
            </div>
            <div class="box-body">
            <?=form_open('sales/create')?>
             <div class="form-group">
                <label for="location">Store / Storage Location</label>
                <select name="location" id="location" class="form-control" required disabled>
                  <?php if ($locations): ?>
                  <?php foreach ($locations as $loc): ?>
                  <option value="<?=$loc['title']?>" <?php if($loc['title'] == $user['location'])echo 'selected';?>><?=$loc['title']?></option>
                  <?php endforeach ?>
                  <?php endif ?>
                </select>
              </div><!-- /.form-group -->
              <div class="form-group">
                <label for="customer">Customer</label>
                <input type="text" name="customer" id="customer" class="form-control" placeholder="Customer Name..." value="Walk-in" required="" />
              </div><!-- /.form-group -->
              <div class="form-group">
                <label for="remarks">Remarks</label>
                <textarea name="remarks" id="remarks" cols="30" rows="2" class="form-control"></textarea>
              </div><!-- /.form-group -->
              <div class="form-group">
                <label for="customer">Total Amount</label>
                <h3 class="text-danger" id="totAmt"><?=decimalize(array_sum($sub))?></h3>
              </div><!-- /.form-group -->
              <div class="form-group">
                <label for="amt_tendered">Amount Tendered</label>
                <input type="text" name="amt_tendered" id="amt_tendered" onkeyup="updateChange()" class="form-control" placeholder="Amount e.g 1000.00" value="<?=decimalize(array_sum($sub))?>" />
              </div><!-- /.form-group -->
              <div class="form-group bg-info">
                <label for="customer">Change</label>
                <h3 class="text-success" id="change">00.00</h3>
              </div><!-- /.form-group -->
              <div class="form-group">
                <button class="btn btn-block btn-lg btn-success"><i class="fa fa-money"></i> Submit Sale</button>
              </div><!-- /.form-group -->
            <?=form_close()?>
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
            </div>
            <!-- /.box-footer-->
          </div>
          <!-- /.box -->
        </div><!-- /.col-md-4 -->
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

    <script type="text/javascript" src="<?=base_url('assets/custom/js/jquery-1.11.2.min.js')?>"></script> 
    <script src="<?=base_url('assets/bower_components/bootstrap/dist/js/bootstrap.min.js')?>"></script>
    <script src="<?=base_url('assets/dist/js/adminlte.min.js')?>"></script>
    <script src="<?=base_url('assets/custom/js/jquery-ui.js');?>" type="text/javascript" language="javascript" charset="UTF-8"></script>
    <script type="text/javascript">
      $(function(){
      $("#item").autocomplete({    
        source: "<?php echo base_url('index.php/sales/autocomplete_items');?>"
      });
    });
    </script>   
  
</body>
</html>
