import "bootstrap";
import '../components/select2';

// User edition
import { showEditUserForm } from '../components/show_edit_form';
if (document.getElementById("edit-form-user")) {
  showEditUserForm();
};


// User edition

import { pickVideo } from '../components/pick_youtube_video';
if (document.getElementById("video-form")) {
  pickVideo();
};

import { getSeconds } from '../components/countdown';
if (document.getElementById("days")) {
  getSeconds();
};


if (document.getElementById("id-user-infos")) {
  $(document).ready(function(){
      $('[data-toggle="popover"]').popover({
        html : true
      });
  });
};




