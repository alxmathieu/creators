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

import { showBurstCard } from '../components/mojs.js';
if (document.querySelector(".icon-not-upvoted")) {
  showBurstCard();
};

import { showBurstCreatorShow } from '../components/mojs.js';

  showBurstCreatorShow();


$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})

$(function () {
  $('[data-toggle="popover"]').popover({
    container: 'body'
  })
})

