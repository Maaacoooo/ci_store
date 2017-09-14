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
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="../../index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
            <li><a href="../../index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
          </ul>
        </li>
        <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
        <li class="header">ADMIN OPTIONS</li>
        <li><a href="<?=base_url('users')?>"><i class="fa fa-users"></i> <span>Users</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->