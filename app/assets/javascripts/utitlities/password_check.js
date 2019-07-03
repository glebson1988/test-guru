document.addEventListener('turbolinks:load', () => {
    let control = document.querySelector('.check-pass');

    if (control) { control.addEventListener('input', passwordCheck) }
});

let passwordCheck = () => {

    let password = document.getElementById('user_password');
    let confirmation = document.getElementById('user_password_confirmation');

    if (password.value === '' || confirmation.value === '') {
    } else if (password.value === confirmation.value) {
        document.querySelector('.octicon-check').classList.remove('hide');
        document.querySelector('.octicon-x').classList.add('hide');
        password.classList.add('border-green');
        confirmation.classList.add('border-green');
        password.classList.remove('border-red');
        confirmation.classList.remove('border-red');
    } else {
        document.querySelector('.octicon-x').classList.remove('hide');
        document.querySelector('.octicon-check').classList.add('hide');
        password.classList.remove('border-green');
        confirmation.classList.remove('border-green');
        password.classList.add('border-red');
        confirmation.classList.add('border-red');
    }
};
