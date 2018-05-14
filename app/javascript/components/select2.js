import $ from 'jquery';
import 'select2';

$('.select2-tags').select2({
  maximumSelectionLength: 3,
  placeholder: 'Tags',
  tags: false,
  allowClear: true
});

$('.select2-search-tags').select2({
  maximumSelectionLength: 1,
  placeholder: 'Selectionne des tags',
  tags: false,
  allowClear: true
});

$('.select2lang').select2({
  maximumSelectionLength: 1,
  placeholder: 'Choisis une langue',
  tags: false,
  allowClear: true
});

$('.select2batches').select2({
  maximumSelectionLength: 1,
  placeholder: 'Découvre par semaine',
  tags: false,
  allowClear: true
});

import 'select2/dist/css/select2.css';
