
// Set today's date as the default registration date
const today = new Date().toISOString().split('T')[0];
document.getElementById('registration_date').value = today;

document.getElementById('registrationForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent traditional form submission

    // Collect form data
    const user_id = document.getElementById('user_id').value;
    const event_id = document.getElementById('event_id').value;
    const payment_status = document.getElementById('payment_status').value;
    const ticket_number = document.getElementById('ticket_number').value;
    const registration_date = document.getElementById('registration_date').value;

    // Simulate form data handling (this is where you'd send it to your backend)
    console.log({
        user_id,
        event_id,
        payment_status,
        ticket_number,
        registration_date
    });

    // Display success message
    alert('Successfully registered for the event!');

    // Redirect to home page after a short delay
    setTimeout(function() {
        window.location.href = 'admin.html'; // Replace with your actual home file path
    }, 2000); // 2 seconds delay
});
