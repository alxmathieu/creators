import $ from 'jquery';
import 'select2';

$('.select2-tags').select2({
  maximumSelectionLength: 3,
  placeholder: 'Tags',
  tags: false,
  allowClear: true,
});
