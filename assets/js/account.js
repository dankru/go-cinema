let account = {
  logoutBtn: null,
  init: () => {
    account.logoutBtn = document.querySelector('.logoutBtn');

    account.logoutBtn.onclick = Logout;
  },
};

window.addEventListener('load', account.init());

async function Logout() {
  let responce = await fetch('/account/logout', {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
  });
  window.location.replace("/auth")
}
