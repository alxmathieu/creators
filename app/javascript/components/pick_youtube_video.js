function pickVideo() {
  const pickvideoBtn = document.querySelectorAll(".add-video-btn");
  const videoForm = document.getElementById("video-form");
  const all_video = document.querySelectorAll(".ytplayer-showcased");
  const inputVideo = document.getElementById("custom-video-input");

  pickvideoBtn.forEach((button) => {
    button.addEventListener("click", (event) => {
      event.preventDefault();
      pickvideoBtn.forEach ( (btn) => {
        btn.classList.remove("selected-video");
      })
      button.classList.toggle("selected-video");
      videoForm.value = `https://www.youtube.com/watch?v=${button.id}`;
    });
  });

  inputVideo.addEventListener("click", (event) => {
    pickvideoBtn.forEach ( (btn) => {
      btn.classList.remove("selected-video");
    })
    videoForm.value = inputVideo.value;;
  });

  inputVideo.addEventListener('keyup', (event) => {
    videoForm.value = inputVideo.value;
  });
}

export{pickVideo};
