// function message() {
//   const up = document.getElementById("message_up");
//   up.addEventListener("click", (e) => {
//     const formData = new FormData(document.getElementById("form"));
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", "/users", true);
//     XHR.responseType = "json";
//     XHR.send(formData);
//     XHR.onload = () => {
//       if (XHR.status != 200) {
//         alert(`Error ${XHR.status}: ${XHR.statusText}`);
//         return null;
//       }
//       const item = XHR.response.f;
//       const list = document.getElementById("list");
//       const formText = document.getElementById("content");
//       const HTML = `
//         <div class= "btn" data-id = <%= @user.id %> data-check=<%= @user.followed %>>
//           <%= render "relationships/follow_button",user: @user%>
//         </div>
//         <div class="post" data-id=${item.id}>
//           <div class="post-date">
//             投稿日時：${item.created_at}
//           </div>
//           <div class="post-content">
//           ${item.content}
//           </div>
//         </div>`;
//       list.insertAdjacentHTML("afterend", HTML);
//       formText.value = "";
//     };
//   });
// }
// window.addEventListener("load", message);

