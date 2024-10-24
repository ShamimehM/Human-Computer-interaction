// Event listeners for logging actions
document.getElementById("log-food").addEventListener("click", logFood);
document.getElementById("log-sleep").addEventListener("click", logSleep);
document.getElementById("log-exercise").addEventListener("click", logExercise);

// Simulated log functions for now (you can enhance these to take input)
function logFood() {
    const foodLog = document.getElementById("food-log");
    const newLog = document.createElement("p");
    newLog.innerText = "Food entry logged for today!";
    foodLog.appendChild(newLog);
}

function logSleep() {
    const sleepLog = document.getElementById("sleep-log");
    const newLog = document.createElement("p");
    newLog.innerText = "Sleep entry logged!";
    sleepLog.appendChild(newLog);
}

function logExercise() {
    const exerciseLog = document.getElementById("exercise-log");
    const newLog = document.createElement("p");
    newLog.innerText = "Exercise entry logged!";
    exerciseLog.appendChild(newLog);
}

// Navigation buttons (for now, this just alerts; later, you can redirect)
document.getElementById("home").addEventListener("click", () => {
    alert("You are already on the Home page.");
});

document.getElementById("profile").addEventListener("click", () => {
    window.location.href = "profile.jsp"; // Replace with actual profile page path
});

document.getElementById("notes").addEventListener("click", () => {
    window.location.href = "notes.jsp"; // Replace with actual notes page path
});

document.getElementById("learning").addEventListener("click", () => {
    window.location.href = "learning.jsp"; // Replace with actual learning page path
});
