let authentication = {
  loginButton: null,
  registerButton: null,
  login: null,
  password: null,
  init: () => {
    authentication.loginButton = document.querySelector('.loginBtn');
    authentication.registerButton = document.querySelector('.registerBtn');

    authentication.login = document.querySelector('.loginInput');
    authentication.password = document.querySelector('.passwordInput');

    authentication.loginButton.onclick = authentication.signIn;
    authentication.registerButton.onclick = authentication.signUp;
  },
  signIn: () => {
    SignIn(authentication.login.value, authentication.password.value);
  },
  signUp: () => {
    SignUp(authentication.login.value, authentication.password.value);
  },
};

window.addEventListener('load', authentication.init());

async function SignIn(loginValue, passwordValue) {
  let responce = await fetch('/auth/sign-in', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: JSON.stringify({
      Username: loginValue,
      Password: passwordValue,
    }),
  })
    .then(response => {
      if (response.ok) {
        window.location.replace('/account');
      }
    })
    .catch(error => {
      console.error(error);
    });
}

async function SignUp(loginValue, passwordValue) {
  let responce = await fetch('/auth/sign-up', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json;charset=utf-8',
    },
    body: JSON.stringify({
      Username: loginValue,
      Password: passwordValue,
    }),
  })
    .then(response => {
      return response.json();
    })
    .then(data => {
      console.log(data);
    })
    .catch(error => {
      console.error(error);
    });
}
