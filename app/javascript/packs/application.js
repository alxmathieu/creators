import "bootstrap";
import '../components/select2';

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

// User edition

import { pickVideo } from '../components/pick_youtube_video';
pickVideo();

import { getSeconds } from '../components/countdown';
getSeconds();
