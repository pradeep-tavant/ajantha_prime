/* Custom filtering function which will filter based on block */
$.fn.dataTable.ext.search.push(
  function( settings, data, dataIndex ) {
    var block = $('#block').val();
    var flat = data[1];
    if ( block == undefined || block == "" || flat.indexOf(block) != -1 ) {
      return true;
    }
    return false;
  }
);

$(document).ready(function() {
  var table = $('.dataTable').DataTable({
    dom: 'lfBrtip',
    buttons: [
            'excel', 'pdf'
        ]
  });
  
  $('<label class="pull-right mleft20">' +
        'Block:&nbsp;&nbsp;'+
        '<select class="form-control" id="block">'+
        '<option value="">All</option>'+
        '<option>A</option>'+
        '<option>B</option>'+
        '</select>' + 
        '</label>').appendTo(".dataTables_wrapper .dataTables_filter");

  $('#block').change( function() {
    table.draw();
  });
});