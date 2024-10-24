document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const errorMessage = document.getElementById('error-message');

    // Predefined user credentials
    const validUsers = {
        parent: '1111',
        oliver: '1111'
    };

    // Check if username exists and password matches
    if (validUsers[username] && validUsers[username] === password) {
        errorMessage.style.display = 'none'; // Hide error message
        alert('Login successful! Welcome ' + username + '!');
        // Redirect to another page or take further actions here
    } else {
        errorMessage.style.display = 'block'; // Show error message
    }
    // After successful login:
    if (validUsers[username] && validUsers[username] === password) {
        window.location.href = 'avatar.html'; // Redirect to avatar page
    }

});
