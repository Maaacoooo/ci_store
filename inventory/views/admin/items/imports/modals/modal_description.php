<?php if($results): ?>
<?php foreach($results AS $inventory): ?>
<div class="modal fade" id="modal_description<?=$inventory['id']?>">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title"><?=$inventory['items_name']?></h4>
      </div>
      <div class="modal-body">
        <p><?=$inventory['items_description']?></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-right" data-dismiss="modal">Close</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<?php endforeach; ?>
<?php endif; ?>