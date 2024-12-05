

// Toggle Navigation Menu
const hamburger = document.getElementById('hamburger');
const navMenu = document.getElementById('navMenu');

hamburger.addEventListener('click', () => {
    navMenu.style.display = navMenu.style.display === 'block' ? 'none' : 'block';
});

// Sample Data for Charts
const salesData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [{
        label: 'Tickets Sold',
        data: [120, 150, 180, 130, 170, 210],
        backgroundColor: 'rgba(0, 174, 255, 0.7)',
    }]
};

const engagementData = {
    labels: ['Active Users', 'Inactive Users'],
    datasets: [{
        label: 'User Engagement',
        data: [75, 25],
        backgroundColor: ['rgba(75, 192, 192, 0.7)', 'rgba(255, 99, 132, 0.7)'],
    }]
};

const revenueData = {
    labels: ['January', 'February', 'March', 'April', 'May', 'June'],
    datasets: [{
        label: 'Revenue',
        data: [500, 700, 800, 600, 900, 1200],
        backgroundColor: 'rgba(255, 206, 86, 0.7)',
    }]
};

// Config for the Charts
const salesConfig = {
    type: 'bar',
    data: salesData,
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'top' },
            title: { display: true, text: 'Ticket Sales Analysis' },
        },
        scales: {
            y: { beginAtZero: true }
        }
    },
};

const engagementConfig = {
    type: 'pie',
    data: engagementData,
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'top' },
            title: { display: true, text: 'User Engagement Analysis' },
        }
    }
};

const revenueConfig = {
    type: 'line',
    data: revenueData,
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'top' },
            title: { display: true, text: 'Revenue Analysis' },
        },
        scales: {
            y: { beginAtZero: true }
        }
    },
};

// Create the Charts
new Chart(document.getElementById('salesChart'), salesConfig);
new Chart(document.getElementById('engagementChart'), engagementConfig);
new Chart(document.getElementById('revenueChart'), revenueConfig);
