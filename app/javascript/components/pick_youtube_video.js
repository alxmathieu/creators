function pickVideo() {
  // const pickvideoBtn = document.getElementById("add-video-btn");
  const pickvideoBtn = document.querySelectorAll(".add-video-btn");
  const videoForm = document.getElementById("video-form");
  const all_video = document.querySelectorAll(".ytplayer-showcased");
  console.log(all_video);

  pickvideoBtn.forEach((button) => {
    button.addEventListener("click", (event) => {
      event.preventDefault();
      console.log(event);
      console.log(button.id);
      // const video = document.getElementById(`${button.id}`);
      // all_video.forEach( (video_player) => {
      //   video_player.classList.remove("selected-video");
      // });
      // video.classList.toggle("selected-video");
      pickvideoBtn.forEach ( (btn) => {
        btn.classList.remove("selected-video");
      })
      button.classList.toggle("selected-video");
      videoForm.value = `https://www.youtube.com/watch?v=${button.id}`;
    });
  });
}

export{pickVideo};

