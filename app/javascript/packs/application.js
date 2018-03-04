import "bootstrap";

// User edition
import { showEditUserForm } from '../components/show_edit_form';
if (document.getElementById("edit-form-user")) {
  showEditUserForm();
};

$(document).ready(function(){
    $('[data-toggle="popover"]').popover({
      html : true
    });
});
