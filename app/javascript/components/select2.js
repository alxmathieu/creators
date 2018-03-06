import $ from 'jquery';
import 'select2';

$('.select2').select2({
  maximumSelectionLength: 3,
  placeholder: 'Tags',
  tags: false,
  allowClear: true
});

$('.select2lang').select2({
  maximumSelectionLength: 1,
  placeholder: 'Languages',
  tags: false,
  allowClear: true
});

$('.select2batches').select2({
  maximumSelectionLength: 1,
  placeholder: 'Week',
  tags: false,
  allowClear: true
});



// Requiring CSS! Path is relative to ./node_modules