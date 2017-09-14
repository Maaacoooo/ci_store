        <div class="modal modal-success fade" id="model_reset">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Warning!</h4>
              </div>
              <?=form_open('admin/imports/reset')?>
                <div class="modal-body">
                  <p>Are you sure you want to <u style="color:red;">RESET</u> all the import items?.</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cancel</button>
                  <button type="submit" class="btn btn-danger">Continue Reset</button>
                </div>
              <?=form_close()?>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->