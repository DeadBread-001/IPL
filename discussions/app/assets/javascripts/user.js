function check(input) {
    if (input.value != document.getElementById('user_password').value) {
      input.setCustomValidity(input.dataset.message);
    } else {
      input.setCustomValidity('');
    }
  }
  