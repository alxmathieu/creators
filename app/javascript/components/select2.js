import $ from 'jquery';
import 'select2';

$('.select2').select2({
  maximumSelectionLength: 3,
  placeholder: 'Tags',
  tags: true,
  allowClear: true
});



// Requiring CSS! Path is relative to ./node_modules
