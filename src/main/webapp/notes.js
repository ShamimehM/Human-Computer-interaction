// showing the notes

document.addEventListener('DOMContentLoaded', function() {
    const notesList = document.getElementById('notesList');
    const notes = JSON.parse(localStorage.getItem('notes')) || [];

    // Sort the notes by date
    notes.sort((a, b) => new Date(a.date) - new Date(b.date));

    notes.forEach(note => {
        // Create a container for each note
        const noteContainer = document.createElement('div');
        noteContainer.classList.add('note-entry'); // For CSS styling
         
        // Create a bold date element
        const boldDate = document.createElement('strong');
        boldDate.textContent = note.date;
         
        // Create the time and response part
        const noteText = document.createElement('p');
        noteText.textContent = ` - ${note.time} - ${note.response}`;
        
        // Append the date and response to the note container
        noteContainer.appendChild(boldDate);
        noteContainer.appendChild(noteText);
 
        // Add the note container to the notes list
        notesList.appendChild(noteContainer);
    });
 });


// Navigate to the respective pages
document.getElementById("home").addEventListener("click", () => {
    window.location.href = "home.html";
});

document.getElementById("profile").addEventListener("click", () => {
    window.location.href = "profile.html";
});

document.getElementById("notes").addEventListener("click", () => {
    alert("You are already on the Notes' page, boo.");
});

document.getElementById("learning").addEventListener("click", () => {
    window.location.href = "learning.html";
});
