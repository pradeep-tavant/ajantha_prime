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
  var table = $('.dataTable').DataTable({
    dom: 'lfBrtip',
    buttons: [
            'excel', 'pdf'
        ]
  });
  
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
});