function showEditUserForm() {
  const editForm = document.getElementById("edit-form-user");
  const editBioBtn = document.getElementById("edit-user-btn");
  const userInfo = document.getElementById("id-user-infos");
  editBioBtn.addEventListener("click", (event) => {
    event.preventDefault();
    editForm.classList.remove("hidden");
    userInfo.classList.add("hidden");
    editBioBtn.classList.add("hidden");
  });
};

export{showEditUserForm};
