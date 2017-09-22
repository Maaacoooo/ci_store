<!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <?php if (filexist($user['img']) && $user['img']): ?>
            <img src="<?=base_url('uploads/'.$user['img'])?>" class="img-circle" alt="User Image">
          <?php else: ?>
            <img src="<?=base_url('assets/img/no_image.gif')?>" class="img-circle" alt="User Image">                
          <?php endif ?>
        </div>
        <div class="pull-left info">
          <p><?=$user['name']?></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li><a href="<?=base_url()?>"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>        

        <?php if ($user['usertype'] == 'Supplier User'): ?>
        <li><a href="<?=base_url('items')?>"><i class="fa fa-flask"></i> <span>My Items</span></a></li>
        <li><a href="<?=base_url('exports')?>"><i class="fa fa-share-square"></i> <span>My Exports</span></a></li>
        <li><a href="<?=base_url('exports/pending')?>"><i class="fa fa-pencil-square-o"></i> <span>Pending Exports</span></a></li>
        <li><a href="<?=base_url('exports/in_transit')?>"><i class="fa fa-truck"></i> <span>In-Transit Exports</span></a></li>
        <li><a href="<?=base_url('exports/received')?>"><i class="fa fa-cart-arrow-down"></i> <span>Received Exports</span></a></li>       
        <?php endif ?>     

        <?php if ($user['usertype'] == 'Administrator'): ?>
        <li class="header">ADMIN OPTIONS</li>
        <li><a href="<?=base_url('items')?>"><i class="fa fa-flask"></i> <span>Item Inventory</span></a></li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-opencart"></i> <span>Exports</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="<?=base_url('exports')?>"><i class="fa fa-share-square"></i> <span>Overall Exports</span></a></li>
            <li><a href="<?=base_url('exports/pending')?>"><i class="fa fa-pencil-square-o"></i> <span>Pending Exports</span></a></li>            
            <li><a href="<?=base_url('exports/in_transit')?>"><i class="fa fa-truck"></i> <span>In-Transit Exports</span></a></li>
            <li><a href="<?=base_url('exports/received')?>"><i class="fa fa-cart-arrow-down"></i> <span>Received Exports</span></a></li>   
          </ul>
        </li>             
        <li><a href="<?=base_url('brands')?>"><i class="fa fa-bookmark"></i> <span>Affiliated Brands / Company</span></a></li>
        <li><a href="<?=base_url('locations')?>"><i class="fa fa-building"></i> <span>Storage Locations</span></a></li>
        <li><a href="<?=base_url('users')?>"><i class="fa fa-users"></i> <span>Users</span></a></li>
        <?php endif ?>      



      </ul>
    </section>
    <!-- /.sidebar -->