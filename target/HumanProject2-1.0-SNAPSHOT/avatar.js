/*
function chooseAvatar(avatarId) {
    // Hide the other avatar
    const avatars = document.querySelectorAll('.avatar');
    avatars.forEach(avatar => {
        if (avatar.id !== avatarId) {
            avatar.style.display = 'none';
        } else {
            avatar.style.width = '200px'; // Make the chosen avatar larger
        }
    });

    // Show the dialogue
    document.getElementById('dialogue').style.display = 'block';
} */

    
// Load the avatar if it has been selected previously
window.onload = function() {
    const selectedAvatar = localStorage.getItem('selectedAvatar');
    if (selectedAvatar) {
        showAvatar(selectedAvatar);
    }
};

function chooseAvatar(avatarId) {
    // Save the chosen avatar in localStorage
    localStorage.setItem('selectedAvatar', avatarId);

    showAvatar(avatarId);
}

function showAvatar(avatarId) {
    // Hide the other avatars
    const avatars = document.querySelectorAll('.avatar');
    avatars.forEach(avatar => {
        if (avatar.id !== avatarId) {
            avatar.style.display = 'none';
        } else {
            avatar.style.width = '200px'; // Make the chosen avatar larger
        }
    });

    // Show the dialogue
    document.getElementById('dialogue').style.display = 'block';

    // Add a button to change the avatar
    const changeAvatarButton = document.createElement('button');
    changeAvatarButton.textContent = "Change Avatar";
    changeAvatarButton.style.position = 'absolute';
    changeAvatarButton.style.top = '10px';
    changeAvatarButton.style.right = '10px';
    changeAvatarButton.onclick = resetAvatar;
    document.body.appendChild(changeAvatarButton);
}

function resetAvatar() {
    // Clear avatar selection
    localStorage.removeItem('selectedAvatar');
    location.reload();
}

function saveResponse() {
    const response = document.getElementById('response').value;
    const date = new Date().toLocaleDateString();
    const time = new Date().toLocaleTimeString();

    // Save the response in localStorage
    let notes = JSON.parse(localStorage.getItem('notes')) || [];
    notes.push({ date, time, response });
    localStorage.setItem('notes', JSON.stringify(notes));

    alert('Response saved!');
    window.location.href = 'home.html'; // Redirect to the home page
}

