
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
          <table class="table table-condensed table-hover">            
            <?php if ($results): ?>
            <thead>
              <tr>
                <th>ID</th>
                <th>Item Name</th>
                <th>Unit</th>
                <th>Brand</th>
                <th>Category</th>
                <th class="bg-warning">Dealer</th>
                <th class="bg-success">Actual</th>
                <th>QTY</th>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($results as $res): ?>
                <tr>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['id']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['name']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['unit']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['brand']?></a></td>
                  <td><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['category']?></a></td>
                  <td class="bg-warning"><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['dealer_price']?></a></td>
                  <td class="bg-success"><a href="<?=base_url('items/view/'.$res['id'])?>"><?=$res['actual_price']?></a></td>
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


      <div class="box <?php if(!validation_errors())echo "collapsed-box"; else echo "box-danger";?>">
        <div class="box-header with-border">
          <h3 class="box-title">Register New Product</h3>
          <div class="box-tools pull-right">
              <button type="button" class="btn btn-default btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-plus"></i></button>            
          </div><!-- /.box-tools pull-right -->
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <?=form_open_multipart('items/product_list', array('class' => 'form-horizontal'))?>
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
                      <option value="<?=$unit['title']?>" <?php if($unit['title']==set_value('unit'))echo'selected';?>><?=$unit['title']?></option>
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
                      <option value="<?=$cat['title']?>" <?php if($cat['title']==set_value('category'))echo'selected';?>><?=$cat['title']?></option>
                      <?php
                        endforeach;
                        endif;
                      ?>
                  </select>       
               </div>

              <?php if ($user['usertype'] == 'Administrator'): ?>
              <label for="brand" class="col-sm-2 col-md-2 control-label">Brand</label>
              <div class="col-sm-10 col-md-2">        
                  <select name="brand" class="form-control" required>
                    <option disabled="" selected="">Select Brand...</option>
                     <?php 
                        if($brands):
                        foreach($brands as $brn):
                      ?>
                      <option value="<?=$brn['title']?>" <?php if($brn['title']==set_value('brand'))echo'selected';?>><?=$brn['title']?></option>
                      <?php
                        endforeach;
                        endif;
                      ?>
                  </select>       
               </div>
              <?php endif ?>
            </div>
            <div class="form-group">
              <label for="dp" class="col-sm-2 col-md-2 control-label">Dealer's Price</label>
              <div class="col-sm-10 col-md-2">
                <input type="text" name="dp" class="form-control" id="dp" placeholder="Dealer's Price. e.g 500.00" value="<?=set_value('dp')?>">
              </div>

              <label for="srp" class="col-sm-2 col-md-2 control-label">Actual Price</label>
              <div class="col-sm-10 col-md-2">
                <input type="text" name="srp" class="form-control" id="srp" placeholder="Retail Price. e.g 1000.00" value="<?=set_value('srp')?>">
              </div>

              <label for="critical_level" class="col-sm-2 col-md-2 control-label">Critical Level</label>
              <div class="col-sm-10 col-md-2">
                <input type="number" name="critical_level" class="form-control" id="critical_level" placeholder="Critical Qty..." value="<?=set_value('critical_level')?>">
              </div>
            </div>
            <div class="form-group">
              <label for="desc" class="col-sm-2 control-label">Description</label>
              <div class="col-sm-10">
                <textarea name="desc" id="desc" cols="30" rows="10" class="ckeditor"><?=set_value('description')?></textarea>
              </div>
            </div>    
            <div class="form-group">    
                  <label for="img" class="col-sm-2 control-label">Item Image</label>    
                  <div class="col-sm-10">
                    <input type="file" name="img" id="img">   
                  </div>    
            </div>     

          </div>
          <!-- /.box-body -->
          <div class="box-footer">
            <button type="submit" class="btn btn-info pull-right">Register New Item</button>
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


