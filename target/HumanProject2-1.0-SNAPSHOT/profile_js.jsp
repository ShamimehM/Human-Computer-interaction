document.addEventListener('DOMContentLoaded', function() {
    // Load existing profile data
    const username = <%=userProfile.getName()%> || 'WonderWoman';
    const birthday = <%=userProfile.getDateOfBirth()%> || null;
    const height = <%=userProfile.getHeight()%> || '80';
    const weight = <%=userProfile.getWeight()%> || '10';
    const gender = <%=userProfile.getGender()%> || 'Non'; 

    // Display the data
    document.getElementById('username').textContent = username;
    if (birthday) {
        calculateAndDisplayAge(birthday);
    }
    document.getElementById('height').textContent = height;
    document.getElementById('weight').textContent = weight;
    document.getElementById('gender').textContent = gender;  // Display gender

    // Example initial data - height, weight, and date
    const heightData = [height];  // In reality, you'd fetch previous entries from localStorage or a database
    const weightData = [weight];
    const entryDates = [new Date().toLocaleDateString()];  // Dates of the entries

    // Initialize the chart     initializeChart(weightData, heightData, entryDates);
    // Initialize the weight/height and BMI charts
    initializeChart([], [], []); // Empty data initially
    initializeBMIChart();

    
    // Edit Profile Button Listener
    document.getElementById('editProfileBtn').addEventListener('click', function() {
        document.getElementById('editForm').style.display = 'block';
        document.getElementById('updateForm').style.display = 'none';
    });

    // Update Weight/Height Button Listener
    document.getElementById('updateWeightHeightBtn').addEventListener('click', function() {
        document.getElementById('updateForm').style.display = 'block';
        document.getElementById('editForm').style.display = 'none';
    });

    // Example: When updating the weight/height, also update the BMI chart
    document.getElementById('updateWeightHeightBtn').addEventListener('click', function() {
        const weight = parseFloat(document.getElementById('weightInput').value);
        const height = parseFloat(document.getElementById('heightInput').value);
        updateBMIData(weight, height);  // Update BMI chart
        updateChart(weight, height, new Date().toLocaleDateString());  // Update weight-height chart
    });

});

// Save profile data (Name, Birthday, Gender)
function saveProfile() {
    const name = document.getElementById('nameInput').value;
    const birthday = document.getElementById('birthdayInput').value;
    const newGender = document.getElementById('newGender').value;

    // Save in localStorage
    if (name) {
        localStorage.setItem('username', name);
        document.getElementById('username').textContent = name;
    }

    if (birthday) {
        localStorage.setItem('birthday', birthday);
        calculateAndDisplayAge(birthday);
    }
    if (newGender) {
        localStorage.setItem('gender', newGender);  // Save gender to localStorage
        document.getElementById('gender').textContent = newGender;  // Update gender display
    }

    // Hide the form
    document.getElementById('editForm').style.display = 'none';
}

// Update Weight and Height
function updateWeightHeight() {
    const height = document.getElementById('heightInput').value;
    const weight = document.getElementById('weightInput').value;

    // Save in localStorage
    if (height) {
        localStorage.setItem('height', height);
        document.getElementById('height').textContent = height;
    }

    if (weight) {
        localStorage.setItem('weight', weight);
        document.getElementById('weight').textContent = weight;
    }

    // Update the chart
    const currentHeight = document.getElementById('height').textContent;
    const currentWeight = document.getElementById('weight').textContent;
    const currentDate = new Date().toLocaleDateString();
    updateChart(currentWeight, currentHeight, currentDate);

    // Hide the form
    document.getElementById('updateForm').style.display = 'none';
}

// Calculate age from birthday
function calculateAndDisplayAge(birthday) {
    const birthDate = new Date(birthday);
    const today = new Date();
    let age = today.getFullYear() - birthDate.getFullYear();
    const monthDifference = today.getMonth() - birthDate.getMonth();

    // Check if the birthday hasn't occurred yet this year
    if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }

    document.getElementById('age').textContent = age;
}


// Initialize chart with weight vs height data and date tooltips
function initializeChart(weightData, heightData, entryDates) {
    const ctx = document.getElementById('weightHeightChart').getContext('2d');
    window.myChart = new Chart(ctx, {
        type: 'line',  // Change to 'line' chart
        data: {
            labels: entryDates,  // Use entry dates for x-axis labels
            datasets: [{
                label: 'Height vs Weight',
                data: weightData.map((weight, index) => ({
                    x: weight,
                    y: heightData[index],
                    entryDate: entryDates[index]  // Store entry date in the data point
                })),
                fill: false,  // Don't fill the area under the line
                borderColor: 'rgba(93, 45, 145, 3)',  // Line color
                backgroundColor: 'rgba(39, 0, 94, 1)',  // Point color
                pointRadius: 5,  // Size of the data points
                pointHoverRadius: 7,  // Size of the points on hover
                tension: 0.3  // Curved line (optional)
            }]
        },
        options: {
            scales: {
                x: {
                    title: {
                        display: true,
                        text: 'Weight (kg)'
                    }
                },
                y: {
                    title: {
                        display: true,
                        text: 'Height (cm)'
                    }
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        // Custom tooltip to show the entry date
                        label: function(tooltipItem) {
                            const dataPoint = tooltipItem.raw;
                            return `Weight: ${dataPoint.x} kg, Height: ${dataPoint.y} cm, Date: ${dataPoint.entryDate}`;
                        }
                    }
                }
            }
        }
    });
}

// Update chart when weight or height is modified
function updateChart(newWeight, newHeight, newDate) {
    window.myChart.data.datasets[0].data.push({
        x: newWeight,
        y: newHeight,
        entryDate: newDate
    });
    window.myChart.update();
}




// bmi chart 
document.addEventListener('DOMContentLoaded', function () {
    // Load existing BMI data from localStorage or initialize empty arrays
    const bmiData = JSON.parse(localStorage.getItem('bmiData')) || [];
    const bmiDates = JSON.parse(localStorage.getItem('bmiDates')) || [];

    // Calculate BMI and update the chart
    function calculateBMI(weight, height) {
        const heightInMeters = height / 100;
        const bmi = (weight / (heightInMeters * heightInMeters)).toFixed(2);
        return bmi;
    }

    // Function to update and store BMI data
    function updateBMIData(weight, height) {
        const newBMI = calculateBMI(weight, height);
        const currentDate = new Date().toLocaleDateString();

        bmiData.push(newBMI);
        bmiDates.push(currentDate);

        localStorage.setItem('bmiData', JSON.stringify(bmiData));
        localStorage.setItem('bmiDates', JSON.stringify(bmiDates));

        updateBMIChart();
    }

    // Initialize BMI chart
    function initializeBMIChart() {
        const ctx = document.getElementById('bmiChart').getContext('2d');
        window.bmiChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: bmiDates,
                datasets: [{
                    label: 'BMI Over Time',
                    data: bmiData,
                    fill: false,
                    borderColor: 'rgba(75, 192, 192, 1)',
                    backgroundColor: 'rgba(75, 192, 192, 1)',
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    tension: 0.3,
                }]
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Date'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'BMI'
                        }
                    }
                }
            }
        });
    }

    // Update BMI chart with new data
    function updateBMIChart() {
        window.bmiChart.data.labels = bmiDates;
        window.bmiChart.data.datasets[0].data = bmiData;
        window.bmiChart.update();
    }

    // Initialize the chart on page load
    initializeBMIChart();

    // Example: updating BMI data (you would call this when weight/height is updated)
    document.getElementById('updateWeightHeightBtn').addEventListener('click', function () {
        const weight = parseFloat(document.getElementById('weightInput').value);
        const height = parseFloat(document.getElementById('heightInput').value);
        updateBMIData(weight, height);
    });
});




// Navigate to the respective pages
document.getElementById("home").addEventListener("click", () => {
    window.location.href = "home.html";
});

document.getElementById("profile").addEventListener("click", () => {
    alert("You are already on the Profile page, you silly.");
    
});

document.getElementById("notes").addEventListener("click", () => {
    window.location.href = "notes.html";
});

document.getElementById("learning").addEventListener("click", () => {
    window.location.href = "learning.html";
});
