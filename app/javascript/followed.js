function follow() {
  const users = document.querySelectorAll(".btn");
  users.forEach(function (user) {
    if (user.getAttribute("data-load") != null) {
      return null;
    }
    user.setAttribute("data-load", "true");
    user.addEventListener("click", () => { 
      const userId = user.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/user/${userId}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const flw = XHR.response.user;
        if (flw.followed === true) {
          user.setAttribute("data-check", "true");
        } else if (flw.followed === false) {
          user.removeAttribute("data-check");
        }
      };
    });
  });
}
setInterval(follow, 1000);