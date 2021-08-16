const selected = document.getElementById("selected");
const selectedImg = document.getElementById("selectedImg");
const selectedName = document.getElementById("selectedName");
const selectedNull = document.getElementById("selectedNull");
const virtualFaceList = document.querySelectorAll(".virtualFaceList");
selected.addEventListener('click', function(event) {
   selectedImg.setAttribute("src", null);
   selectedName.innerHTML = "";
   selectedNull.innerHTML = "장착할<br>아이템을<br>선택하세요";
   selectedImg.style.display = "none";
   selectedName.style.display = "none";
});
for (const virtualFace of virtualFaceList) {
   virtualFace.addEventListener('click', function(event) {
      const virtualFaceSrc = virtualFace.childNodes[1].getAttribute("src");
      const virtualFaceName = virtualFace.childNodes[4].innerHTML;
      console.log(virtualFaceSrc);
      console.log(virtualFaceName);
      selectedImg.style.display = "block";
      selectedName.style.display = "block";
      selectedImg.setAttribute("src", virtualFaceSrc);
      selectedName.innerHTML = virtualFaceName;
      selectedNull.innerHTML = "";
   });
};

function save() {
   window.location.href = "mypageKR.jsp?data2=" + selectedImg.getAttribute("src").split("/")[3];
}