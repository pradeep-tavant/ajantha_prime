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
    else {
      return true;
    }
    return false;
  }
);

$(document).ready(function() {
  var table;
  if ($('.admin-view').length > 0) {
    table = $('.dataTable.admin-view').DataTable({
      dom: 'lfBrtip',
      buttons: [
              'excel', 'pdf'
          ]
    });
  }
  else {
    table = $('.dataTable').DataTable();
  }
  
  $('<label class="pull-right mleft20">' +
        'Floor:&nbsp;&nbsp;'+
        '<select class="form-control" id="floor">'+
        '<option value="">All</option>'+
        '<option>GF</option>'+
        '<option>FF</option>'+
        '<option>SF</option>'+
        '<option>TF</option>'+
        '<option>FOF</option>'+
        '</select>'+
        '</label>'+
        '<label class="pull-right mleft20">'+
        'Block:&nbsp;&nbsp;'+
        '<select class="form-control" id="block">'+
        '<option value="">All</option>'+
        '<option>A</option>'+
        '<option>B</option>'+
        '</select>'+
        '</label>').appendTo(".members-wrapper .dataTables_wrapper .dataTables_filter");

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

  $('<label class="pull-right mleft20">' +
        'Published?:&nbsp;&nbsp;'+
        '<select class="form-control" id="visible">'+
        '<option value="">All</option>'+
        '<option value="Yes">Published</option>'+
        '<option value="No">Unpublished</option>'+
        '</select>'+
        '</label>'+
        '<label class="pull-right mleft20">'+
        'Status:&nbsp;&nbsp;'+
        '<select class="form-control" id="active">'+
        '<option value="">All</option>'+
        '<option>Open</option>'+
        '<option>Closed</option>'+
        '</select>'+
        '</label>').appendTo(".posts-wrapper .dataTables_wrapper .dataTables_filter");

  $('#visible, #active').change( function() {
    table.draw();
  });

  $('.comment-reply').on('click', function() {
    $(this).text($(this).text() == 'Reply' ? 'Close' : 'Reply');
    $(this).closest('.comment').find('.reply-form').toggle();
    return false;
  });

  $('<label class="pull-right mleft20">'+
        'Category:&nbsp;&nbsp;'+
        '<select class="form-control" id="category">'+
        '<option value="">All</option>'+
        '<option>Bike/Scooter</option>'+
        '<option>Car</option>'+
        '</select>'+
        '</label>').appendTo(".vehicles-wrapper .dataTables_wrapper .dataTables_filter");

  $('#category').change( function() {
    table.draw();
  });


});