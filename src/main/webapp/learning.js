// Example: Dynamically load learning resources
document.addEventListener('DOMContentLoaded', function() {
    // If you want to dynamically load resources, you can fetch them from an API or localStorage here
    // For now, this is just a placeholder to show where you could add such functionality

    // Example for backend:
    // fetch('/api/getLearningResources')
    //   .then(response => response.json())
    //   .then(data => {
    //       // Process and display learning resources
    //   })
    //   .catch(error => console.error('Error fetching resources:', error));
    
    // You can also store and retrieve user-specific learning progress using localStorage
});


// Navigate to the respective pages
document.getElementById("home").addEventListener("click", () => {
    window.location.href = "home.html";
});

document.getElementById("profile").addEventListener("click", () => {
    window.location.href = "profile.html";
});

document.getElementById("notes").addEventListener("click", () => {
    window.location.href = "notes.html";
});

document.getElementById("learning").addEventListener("click", () => {
    alert("You are already on the learning section, goat!");
});
