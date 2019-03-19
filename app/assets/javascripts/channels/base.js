/* Custom filtering function which will filter based on block */
$.fn.dataTable.ext.search.push(
  function( settings, data, dataIndex ) {
    if ($('.members-wrapper').length > 0) {
      var block = $('#block').val();
      var floor = $('#floor').val();
      var flat = data[1];
      if ( (block == undefined || block == "" || flat.indexOf(block) != -1) && (floor == undefined || floor == "" || flat.indexOf(floor) != -1) ) {
        return true;
      }
    }
    else if ($('.posts-wrapper').length > 0) {
      var active = $('#active').val();
      var visible = $('#visible').val();
      if ((active == undefined || active == "" || active == data[3]) && (visible == undefined || visible == "" || visible == data[4])) {
        return true;
      }
    }
    else if ($('.vehicles-wrapper').length > 0) {
      var category = $('#category').val();
      if (category == undefined || category == "" || category == data[2]) {
        return true;
      }
    }
    else if ($('.transactions-wrapper .admin-view').length > 0) {
      var status = $('#tr_sub_category').val();
      if (status == undefined || status == "" || status == data[5]) {
        return true;
      }
    }
    else if ($('.feedbacks-wrapper').length > 0) {
      var status = $('#feedback_status').val();
      if (status == undefined || status == "" || status == data[4]) {
        return true;
      }
    }
    else {
      return true;
    }
    return false;
  }
);

$(window).load(function() {
  $(".loader").fadeOut("slow");
});
$(window).bind('beforeunload', function(){
  $(".loader").fadeIn();
});

$(document).ready(function() {

  var today = new Date().toLocaleDateString().replace(/\//g,'-');

  $('.datepicker').datepicker({
    autoclose: true,
    format: 'dd/M/yyyy',
    orientation: "bottom left"
    // startDate: new Date()
  });

  $('.monthpicker').datepicker({
    autoclose: true,
    format: "M-yyyy",
    startView: "months", 
    minViewMode: "months",
    orientation: "bottom left"
  });
  
  $('input[type=file]').bootstrapFileInput();

  if ($('.members-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      lengthMenu: [[25, 50, -1], [25, 50, 'All']],
      pageLength: 25,
      columnDefs: [{ orderable: false, "targets": -1 }],
      dom: 'lfBrtip',
      buttons: [
            {
                extend: 'excelHtml5',
                autoFilter: true,
                title: 'AjanthaPrime-Members-'+today,
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'csvHtml5',
                title: 'AjanthaPrime-Members-'+today,
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                title: 'AjanthaPrime-Members-'+today,
                exportOptions: {
                    columns: ':visible'
                }
            },
            'colvis'
        ]
    });
  }
  else if ($('.members-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      lengthMenu: [[25, 50, -1], [25, 50, 'All']],
      pageLength: 25
    });
  }
  else if ($('.posts-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      order: [[ 2, 'desc' ]],
      columnDefs: [{ orderable: false, "targets": -1 }]
    })
  }
  else if ($('.vehicles-wrapper').length > 0 && window.location.search == '') {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ orderable: false, "targets": -1 }]
    })
  }
  else if ($('.vehicles-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      order: [[ 3, 'desc' ]],
      columnDefs: [{ orderable: false, "targets": -1 }]
    })
  }
  else if ($('.vehicles-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      order: [[ 3, 'asc' ]]
    })
  }
  else if ($('.polls-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      order: [[ 2, 'desc' ]],
      columnDefs: [{ orderable: false, "targets": [-1,-2] }]
    })
  }
  else if ($('.polls-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      order: [[ 2, 'desc' ]],
      columnDefs: [{ orderable: false, "targets": [-1] }]
    })
  }
  else if ($('.facilities-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ orderable: false, "targets": -1 }]
    })
  }
  else if ($('.transactions-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [
                    { orderable: false, "targets": -1 },
                    { targets: [ 5 ], visible: false }
                  ],
      order: [[ 3, 'desc' ]],
      dom: 'lfBrtip',
      buttons: [
            {
                extend: 'excelHtml5',
                autoFilter: true,
                title: 'AjanthaPrime-Transactions-'+today,
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'csvHtml5',
                title: 'AjanthaPrime-Transactions-'+today,
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'pdfHtml5',
                title: 'AjanthaPrime-Transactions-'+today,
                exportOptions: {
                    columns: ':visible'
                }
            },
            'colvis'
        ]
    })
  }
  else if ($('.transactions-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ orderable: false, "targets": -1 }],
      order: [[ 3, 'desc' ]],
    })
  }
  else if ($('.categories-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ visible: false, searchable: false, "targets": 0 }]
    })
  }
  else if ($('.feedbacks-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ orderable: false, "targets": -1 }],
      order: [[ 2, 'desc' ]],
    })
  }
  else if ($('.bookings-wrapper .admin-view').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ orderable: false, "targets": -1 }],
      order: [[ 2, 'asc' ]]
    })
  }
  else if ($('.bookings-wrapper').length > 0) {
    table = $('.dataTable').DataTable({
      responsive: true,
      columnDefs: [{ orderable: false, "targets": -1 }],
      order: [[ 1, 'desc' ]]
    })
  }
  else if ($('.accounts-wrapper').length > 0) {
    $('.sortable').railsSortable();
    if (window.location.search == "")
    {
      month = new Date().toLocaleString("en", { month: "short"  }) + '-' + new Date().getFullYear();
    }
    else {
      month = window.location.search.split('=')[1];
    }
    table = $('.dataTable').DataTable({
      responsive: true,
      paging: false,
      ordering: false,
      dom: 'lfBrtip',
      buttons: [
          {
              extend: 'excelHtml5',
              autoFilter: true,
              footer: true,
              title: 'AjanthaPrime-Accounts-'+month+'-'+today,
              exportOptions: {
                  columns: ':visible'
              }
          },
          {
              extend: 'csvHtml5',
              footer: true,
              title: 'AjanthaPrime-Accounts-'+month+'-'+today,
              exportOptions: {
                  columns: ':visible'
              }
          },
          {
              extend: 'pdfHtml5',
              footer: true,
              title: 'AjanthaPrime-Accounts-'+month+'-'+today,
              exportOptions: {
                  columns: ':visible'
              }
          },
          'colvis'
      ]
    })
    // To hide the No Data text & Row count bottom text in DataTable
    $(".dataTables_empty, .dataTables_info").hide();
  }
  else {
    table = $('.dataTable').DataTable({
      responsive: true
    });
  }
  
  if ($(".members-wrapper").length > 0) {
    $('<label class="mleft10">'+
          'Block:&nbsp;&nbsp;'+
          '<select class="form-control" id="block">'+
          '<option value="">All</option>'+
          '<option>A</option>'+
          '<option>B</option>'+
          '</select>'+
          '</label>'+
          '<label class="mleft10">' +
          'Floor:&nbsp;&nbsp;'+
          '<select class="form-control" id="floor">'+
          '<option value="">All</option>'+
          '<option>GF</option>'+
          '<option>FF</option>'+
          '<option>SF</option>'+
          '<option>TF</option>'+
          '<option>FOF</option>'+
          '</select>'+
          '</label>').appendTo(".members-wrapper .dataTables_wrapper .dataTables_filter");
  }

  $('#block, #floor').change( function() {
    table.draw();
  });

  $('.rented:checkbox').change(function() {
    // use the :checked selector to find any that are checked
    if ($('.rented:checkbox:checked').length) {
        $('.tenant-section').slideDown('slow');
    } else {
        $('.tenant-section').slideUp('slow');
    }
  });

  if ($(".posts-wrapper").length > 0) {
    $('<label class="mleft10">' +
          'Published?:&nbsp;&nbsp;'+
          '<select class="form-control" id="visible">'+
          '<option value="">All</option>'+
          '<option value="Yes">Published</option>'+
          '<option value="No">Unpublished</option>'+
          '</select>'+
          '</label>'+
          '<label class="mleft10">'+
          'Status:&nbsp;&nbsp;'+
          '<select class="form-control" id="active">'+
          '<option value="">All</option>'+
          '<option>Open</option>'+
          '<option>Closed</option>'+
          '</select>'+
          '</label>').appendTo(".posts-wrapper .dataTables_wrapper .dataTables_filter");
  }

  $('#visible, #active').change( function() {
    table.draw();
  });

  $('.comment-reply').on('click', function() {
    $(this).text($(this).text() == 'Reply' ? 'Close' : 'Reply');
    $(this).closest('.comment').find('.reply-form').toggle();
    return false;
  });

  if ($(".vehicles-wrapper").length > 0) {
    $('<label class="mleft10">'+
          'Category:&nbsp;&nbsp;'+
          '<select class="form-control" id="category">'+
          '<option value="">All</option>'+
          '<option>Bike/Scooter</option>'+
          '<option>Car</option>'+
          '</select>'+
          '</label>').appendTo(".vehicles-wrapper .dataTables_wrapper .dataTables_filter");
  }

  $('#category').change( function() {
    table.draw();
  });

  if ($('.transactions-wrapper .admin-view').length > 0 && window.location.search.match("category=Maintenance")) {
    $('<label class="mleft10">'+
          'Duration:&nbsp;&nbsp;'+
          '<select class="form-control" id="tr_sub_category">'+
          '<option value="">All</option>'+
          '<option>Jan-Mar 2019</option>'+
          '<option>Apr-Jun 2019</option>'+
          '</select>'+
          '</label>').appendTo(".transactions-wrapper .dataTables_wrapper .dataTables_filter");
  }

  $('#tr_sub_category').change( function() {
    table.draw();
  });

  if ($(".feedbacks-wrapper").length > 0 && window.location.search == "?filter=all") {
    $('<label class="mleft10">'+
          'Status:&nbsp;&nbsp;'+
          '<select class="form-control" id="feedback_status">'+
          '<option value="">All</option>'+
          '<option>Open</option>'+
          '<option>InProgress</option>'+
          '<option>InAppropriate</option>'+
          '<option>Duplicate</option>'+
          '<option>Closed</option>'+
          '</select>'+
          '</label>').appendTo(".feedbacks-wrapper .dataTables_wrapper .dataTables_filter");
  }

  $('#feedback_status').change( function() {
    table.draw();
  });

  $('.modal-content input[name="feedback[subject]"]').on('input change', function () {
    if ($(this).val() != '') {
      $('button[type="submit"]').prop('disabled', false);
    }
    else {
      $('button[type="submit"]').prop('disabled', true);
    }
  });

  $('select[name="transaction[payment_mode]"]').on('change', function() {
    if (this.value == 'Cheque') {
      $(".transaction_label").text("Cheque Number *");
    }
    else {
      $(".transaction_label").text("Transaction # *")
    }
    if (this.value == 'Cash') {
      $('input[name="transaction[transaction_id]"]').val('N/A').prop('readonly', true);
    }
    else {
      $('input[name="transaction[transaction_id]"]').val('').prop('readonly', false);
    }
  })

  $('select[name="transaction[category]"]').on('change', function() {
    if (this.value == 'Maintenance') {
      $(".sub-category").slideDown();
    }
    else {
      $(".sub-category").slideUp();
    }
    if (this.value == 'PartyHall') {
      $(".for-date").slideDown();
    }
    else {
      $(".for-date").slideUp();
    }
  })

  $(".sub-category select").on('change', function() {
    if (this.value == 'Jan-Mar 2019') {
      $('input[name="transaction[amount_paid]"]').val('7500');
    }
    else if (this.value == 'Apr-Jun 2019') {
      $('input[name="transaction[amount_paid]"]').val('8700');
    }
  })

  $("select.start_time:first, select.end_time:first").on('change', function(){
    if (this.value == 22) { // No booking after 10PM
      $(this).siblings('select').val("00").attr('readonly', true).css('pointer-events','none');
    }
    else {
      $(this).siblings('select').attr('readonly', false).css('pointer-events','auto');
    }
  })

  $("select#for_month").on('change', function(){
    window.location.search = "?month="+this.value;
  })

  $("select#tr_category").on('change', function(){
    window.location.search = "?category="+this.value;
  })

});
