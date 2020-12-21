$(document).ready(function() {
    $("#sort").DataTable({
       columnDefs : [
     { type : 'date', targets : [3] }
    ],  
    });
});
 
 $(document).ready(function () {
    $('#dtBasicExample').DataTable({
        "pagingType": "simple_numbers"
    });
    $('.dataTables_length').addClass('bs-select');
});

$('#dtBasicExample').mdbEditor({
    mdbEditor: true
});
    
$('.dataTables_length').addClass('bs-select');

$('#your-table-id').mdbEditor({
    headerLength: 6,
    evenTextColor: '#000',
    oddTextColor: '#000',
    bgEvenColor: '',
    bgOddColor: '',
    thText: '',
    thBg: '',
    modalEditor: false,
    bubbleEditor: false,
    contentEditor: false,
    rowEditor: false
});