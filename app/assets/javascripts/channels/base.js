/* Custom filtering function which will filter based on block */
$.fn.dataTable.ext.search.push(
  function( settings, data, dataIndex ) {
    var block = $('#block').val();
    var floor = $('#floor').val();
    var flat = data[1];
    console.log(floor);
    if ( (block == undefined || block == "" || flat.indexOf(block) != -1) && (floor == undefined || floor == "" || flat.indexOf(floor) != -1) ) {
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
        '</label>').appendTo(".dataTables_wrapper .dataTables_filter");

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

  $('.postsTable').DataTable();

  $('.comment-reply').on('click', function() {
    $(this).text($(this).text() == 'Reply' ? 'Close' : 'Reply');
    $(this).closest('.comment').find('.reply-form').toggle();
    return false;
  });
});