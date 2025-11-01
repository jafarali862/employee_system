

<?php $__env->startSection('content'); ?>
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-header d-flex justify-content-between align-items-center">
        <h5 class="mb-0">Employee List</h5>
        <button class="btn btn-success" id="createNew">Add Employee</button>
      </div>

      <div class="card-body">
        <table id="employees-table" class="table table-bordered table-striped align-middle nowrap w-100">
          <thead class="table-light">
            <tr>
              <th>#</th>
              <th>Avatar</th>
              <th>Full Name</th>
              <th>Email</th>
              <th>Mobile</th>
              <th>Department</th>
              <th>Designation</th>
              <th>Created At</th>
              <th>Action</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- Employee Modal -->
<div class="modal fade" id="employeeModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form id="employeeForm" enctype="multipart/form-data">
       <?php echo csrf_field(); ?>
        <input type="hidden" id="employee_id" name="employee_id">

        <div class="modal-header">
          <h5 class="modal-title">Employee</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <div class="modal-body">
          <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="full_name" id="full_name" class="form-control" required>
          </div>
          <div class="mb-3">
            <label>Email</label>
            <input type="email" name="email" id="email" class="form-control" required>
          </div>
          <div class="mb-3">
            <label>Mobile</label>
            <input type="text" name="mobile" id="mobile" class="form-control">
          </div>
          <div class="mb-3">
            <label>Department</label>
            <input type="text" name="department" id="department" class="form-control">
          </div>
          <div class="mb-3">
            <label>Designation</label>
            <input type="text" name="designation" id="designation" class="form-control">
          </div>
          <div class="mb-3">
            <label>Avatar</label>
            <input type="file" name="avatar" id="avatar" class="form-control">
            <div id="avatar-preview" class="mt-2"></div>
          </div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="saveBtn">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('scripts'); ?>
<script>
$(function () {

  // ✅ Ensure CSRF token is available globally
  $.ajaxSetup({
    headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
  });

  // ✅ Initialize DataTable
  let table = $('#employees-table').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: "<?php echo e(route('employees.index')); ?>",
    columns: [
      { data: 'DT_RowIndex', name: 'DT_RowIndex', orderable: false, searchable: false },
      { data: 'avatar', name: 'avatar', orderable: false, searchable: false },
      { data: 'full_name', name: 'full_name' },
      { data: 'email', name: 'email' },
      { data: 'mobile', name: 'mobile' },
      { data: 'department', name: 'department' },
      { data: 'designation', name: 'designation' },
      { data: 'created_at', name: 'created_at' },
      { data: 'action', name: 'action', orderable: false, searchable: false }
    ]
  });

  // ✅ Create New Employee
  $('#createNew').click(function () {
    $('#employeeForm')[0].reset();
    $('#employee_id').val('');
    $('#avatar-preview').html('');
    $('#employeeModal').modal('show');
  });

  // ✅ Save Employee (Create or Update)
 $('#employeeForm').on('submit', function (e) {
  e.preventDefault();

  let id = $('#employee_id').val();
  let formData = new FormData(this);
  $('#saveBtn').prop('disabled', true).text('Saving...');

  // detect create or update URL
  let url = id
    ? `/employees/${id}`      // update URL
    : `<?php echo e(route('employees.store')); ?>`; // create URL

  // if updating, append _method=PUT (Laravel requires it)
  if (id) {
    formData.append('_method', 'PUT');
  }

  $.ajax({
    url: url,
    type: 'POST', // always POST, but with _method=PUT for updates
    data: formData,
    processData: false,
    contentType: false,
    cache: false,
    success: function (res) {
      $('#saveBtn').prop('disabled', false).text('Save');
      $('#employeeModal').modal('hide');
      $('#employeeForm')[0].reset();
      table.ajax.reload(null, false);
      Swal.fire('Success', res.message || 'Employee saved successfully', 'success');
    },
    error: function (xhr) {
      $('#saveBtn').prop('disabled', false).text('Save');
      let msg = xhr.responseJSON?.message || 'Something went wrong.';
      Swal.fire('Error', msg, 'error');
    }
  });
});



  // ✅ Edit Employee
  $('body').on('click', '.editBtn', function () {
    let id = $(this).data('id');
    $.get(`/employees/${id}/edit`, function (data) {
      $('#employee_id').val(data.id);
      $('#full_name').val(data.full_name);
      $('#email').val(data.email);
      $('#mobile').val(data.mobile);
      $('#department').val(data.department);
      $('#designation').val(data.designation);

      if (data.avatar) {
        $('#avatar-preview').html(`<img src="/storage/${data.avatar}" width="60" class="rounded-circle">`);
      } else {
        $('#avatar-preview').html('');
      }

      $('#employeeModal').modal('show');
    }).fail(function () {
      Swal.fire('Error!', 'Failed to fetch employee details.', 'error');
    });
  });

  // ✅ Delete Employee
  $('body').on('click', '.deleteBtn', function () {
    let id = $(this).data('id');

    Swal.fire({
      title: 'Are you sure?',
      text: 'This will delete the employee permanently.',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Yes, delete it!',
      cancelButtonText: 'Cancel'
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: `/employees/${id}`,
          type: 'DELETE',
          data: {
            _token: $('meta[name="csrf-token"]').attr('content')
          },
          success: function (res) {
            table.ajax.reload(null, false);
            Swal.fire('Deleted!', 'Employee deleted successfully.', 'success');
          },
          error: function () {
            Swal.fire('Error!', 'Unable to delete employee.', 'error');
          }
        });
      }
    });
  });

});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\USER\Desktop\Employee\resources\views/employees/index.blade.php ENDPATH**/ ?>