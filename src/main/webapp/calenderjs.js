
// JavaScript for handling month navigation and rendering the calendar
const calendar = document.getElementById('calendar');
const currentMonthYear = document.getElementById('currentMonthYear');
let currentDate = new Date();

function renderCalendar() {
    calendar.innerHTML = ''; // Clear the calendar

    const month = currentDate.getMonth();
    const year = currentDate.getFullYear();

    // Update the month and year display
    currentMonthYear.textContent = currentDate.toLocaleDateString('en-US', {
        month: 'long',
        year: 'numeric'
    });

    // Get the first and last day of the current month
    const firstDay = new Date(year, month, 1).getDay();
    const lastDate = new Date(year, month + 1, 0).getDate();

    // Add blank days for the start of the month
    for (let i = 0; i < firstDay; i++) {
        const emptyDay = document.createElement('div');
        calendar.appendChild(emptyDay);
    }

    // Add days with event markers
    for (let day = 1; day <= lastDate; day++) {
        const dayElement = document.createElement('div');
        dayElement.className = 'day';

        const dayNumber = document.createElement('span');
        dayNumber.className = 'day-number';
        dayNumber.textContent = day;
        dayElement.appendChild(dayNumber);

        // Add some demo events
        if (year === 2024 && month === 2) { // March 2024
            if (day === 3 || day === 6 || day === 11 || day === 13 || day === 19) {
                dayElement.classList.add('event');
            }
        }

        calendar.appendChild(dayElement);
    }
}

// Event listeners for navigation buttons
document.getElementById('prevMonth').addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() - 1);
    renderCalendar();
});

document.getElementById('nextMonth').addEventListener('click', () => {
    currentDate.setMonth(currentDate.getMonth() + 1);
    renderCalendar();
});

// Initial render
renderCalendar();
