import "bootstrap";

// User edition
import { showEditUserForm } from '../components/show_edit_form';
if (document.getElementById("edit-form-user")) {
  showEditUserForm();
};



$(".js-example-tokenizer").select2({
    tags: true,
    tokenSeparators: [',', ' ']
})
