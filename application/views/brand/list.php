
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
          <h3 class="box-title">Affiliated Brands and Companies  <span class="badge"><?=$total_result?></span></h3>
          <div class="box-tools pull-right">            
            <?=form_open('brands', array('method' => 'get', 'class' => 'input-group input-group-sm', 'style' => 'width: 150px;'))?>
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
            <tbody>
              <?php foreach ($results as $res): ?>
                <tr>
                  <td width="8%">
                    <a href="<?=base_url('brands/view/'.$res['id'])?>">
                      <?php if (filexist($res['logo']) && $res['logo']): ?>
                        <img class="profile-user-img img-responsive" src="<?=base_url('uploads/'.$res['logo'])?>" alt="User profile picture">
                      <?php else: ?>
                        <img class="profile-user-img img-responsive" src="<?=base_url('assets/img/no_image.gif')?>" alt="User profile picture">                
                      <?php endif ?>
                    </a>
                  </td>
                  <td><a href="<?=base_url('brands/view/'.$res['id'])?>"><?=$res['title']?></a></td>
                  <td><a href="<?=base_url('brands/view/'.$res['id'])?>"><?=$res['email']?></a></td>
                  <td><a href="<?=base_url('brands/view/'.$res['id'])?>"><?=$res['contact']?></a></td>
                  <td><a href="<?=base_url('brands/view/'.$res['id'])?>"><?=$res['web']?></a></td>
                </tr>
              <?php endforeach; ?>
            </tbody>              
            <?php endif; ?>              
          </table><!-- /.table table-bordered -->
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


      <div class="box <?php if(!validation_errors())echo "collapsed-box"; else echo "box-danger";?>">
        <div class="box-header with-border">
          <h3 class="box-title">Register Affiliate</h3>
          <div class="box-tools pull-right">
              <button type="button" class="btn btn-default btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-plus"></i></button>            
          </div><!-- /.box-tools pull-right -->
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <?=form_open_multipart('brands', array('class' => 'form-horizontal'))?>
          <div class="box-body">
            <div class="form-group">
              <label for="title" class="col-sm-2 control-label">Affiliate Company / Brand</label>

              <div class="col-sm-10">
                <input type="text" name="title" class="form-control" id="title" placeholder="Brand / Company..." value="<?=set_value('title')?>" >
              </div>
            </div>
            <div class="form-group">
              <label for="desc" class="col-sm-2 control-label">Description</label>
              <div class="col-sm-10">
                <textarea name="desc" id="desc" cols="30" rows="10" class="ckeditor"><?=set_value('description')?></textarea>
              </div>
            </div>
            <div class="form-group">
              <label for="address" class="col-sm-2 control-label">Address</label>
              <div class="col-sm-10">
                <input type="text" name="address" class="form-control" id="address" placeholder="Company Address..." value="<?=set_value('address')?>">
              </div>
            </div>
            <div class="form-group">
              <label for="email" class="col-sm-2 col-md-2 control-label">Email Address</label>
              <div class="col-sm-10 col-md-4">
                <input type="email" name="email" class="form-control" id="email" placeholder="Email Address..." value="<?=set_value('email')?>" required>
              </div>

              <label for="contact" class="col-sm-2 col-md-2 control-label">Contact Number</label>
              <div class="col-sm-10 col-md-4">
                <input type="text" name="contact" class="form-control" id="contact" placeholder="Contact Number..." value="<?=set_value('contact')?>">
              </div>

            </div>
            <div class="form-group">
              <label for="web" class="col-sm-2 col-md-2 control-label">Web Address</label>
              <div class="col-sm-10 col-md-4">
                <input type="web" name="web" class="form-control" id="web" placeholder="http://webadress.com" value="<?=set_value('web')?>" required>
              </div>

              <label for="img" class="col-sm-2 col-md-2 control-label">Company Logo</label>
              <div class="col-sm-10 col-md-4">        
                  <input type="file" name="img" id="img">       
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


