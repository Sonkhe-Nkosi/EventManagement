

// Variables to keep track of cart and likes
let totalAmount = 0;
let cartItemCount = 0;
const cartItems = [];

// Like button functionality
function likePost(likeElement) {
    const likeCounter = likeElement.parentElement.querySelector('.like-counter');
    let counterValue = parseInt(likeCounter.textContent) || 0;
    const isLiked = likeElement.classList.contains('active');

    if (isLiked) {
        likeElement.classList.remove('active');
        likeCounter.textContent = `${counterValue - 1} Likes`;
    } else {
        likeElement.classList.add('active');
        likeCounter.textContent = `${counterValue + 1} Likes`;
    }
}

// Add to cart functionality with price check
function addToCart(eventName, price) {
    // Ensure the price doesn't exceed 5 per ticket
    const finalPrice = Math.min(price, 5); 

    totalAmount += finalPrice;
    cartItemCount += 1;
    cartItems.push({ name: eventName, price: finalPrice });
    updateCartUI();
    alert(`"${eventName}" has been added to your cart at R${finalPrice.toFixed(2)}.`);
}


// Add to cart from modal
function addToCartFromModal() {
    const name = document.getElementById('modal-event-name').textContent;
    const price = parseFloat(document.getElementById('modal-event-price').textContent);
    addToCart(name, price);
    closeDetailsModal();
}

// Update cart UI
function updateCartUI() {
    const cartCounter = document.querySelector('.cart-counter');
    cartCounter.textContent = cartItemCount;

    const totalAmountElement = document.getElementById('total-amount');
    totalAmountElement.textContent = totalAmount.toFixed(2);

    const cartItemsContainer = document.getElementById('cart-items');
    cartItemsContainer.innerHTML = ''; // Clear existing items

    cartItems.forEach((item, index) => {
        const itemDiv = document.createElement('div');
        itemDiv.style.display = 'flex';
        itemDiv.style.justifyContent = 'space-between';
        itemDiv.style.marginBottom = '10px';
        itemDiv.style.borderBottom = '1px solid #ecf0f1';
        itemDiv.style.paddingBottom = '5px';

        const itemName = document.createElement('span');
        itemName.textContent = item.name;

        const itemPrice = document.createElement('span');
        itemPrice.textContent = `R${item.price.toFixed(2)}`;

        itemDiv.appendChild(itemName);
        itemDiv.appendChild(itemPrice);

        cartItemsContainer.appendChild(itemDiv);
    });
}



// Open Cart Modal
function openCartModal() {
    const cartModal = document.getElementById('cartModal');
    cartModal.style.display = "block";
    cartModal.setAttribute('aria-hidden', 'false');
}

// Close Cart Modal
function closeCartModal(event) {
    if (event.target.id === 'cartModal' || event.target.className === 'close') {
        const cartModal = document.getElementById('cartModal');
        cartModal.style.display = "none";
        cartModal.setAttribute('aria-hidden', 'true');
    }
}

// Open Details Modal
function openModal(name, date, location, description, price) {
    document.getElementById('modal-event-name').textContent = name;
    document.getElementById('modal-event-date').textContent = date;
    document.getElementById('modal-event-location').textContent = location;
    document.getElementById('modal-event-description').textContent = description;
    document.getElementById('modal-event-price').textContent = price;
    const detailsModal = document.getElementById('detailsModal');
    detailsModal.style.display = "block";
    detailsModal.setAttribute('aria-hidden', 'false');
}

// Close Details Modal
function closeDetailsModal(event) {
    if (event.target.id === 'detailsModal' || event.target.className === 'close') {
        const detailsModal = document.getElementById('detailsModal');
        detailsModal.style.display = "none";
        detailsModal.setAttribute('aria-hidden', 'true');
    }
}

// Handle Payment Form Submission
function handlePayment(event) {
    event.preventDefault(); // Prevent default form submission

    // Basic form validation
    const fullName = document.getElementById('fullName').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const paymentMethod = document.getElementById('paymentMethod').value;

    if (!fullName || !email || !phone || !paymentMethod) {
        alert("Please fill in all required fields.");
        return false;
    }

    // Additional Email Validation using Regex (optional)
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailPattern.test(email)) {
        alert("Please enter a valid email address.");
        return false;
    }

    // Additional Phone Validation (pattern attribute handles basic validation)
    // You can add more sophisticated validation if needed

    // Prepare data for PayFast
    const payfastUrl = "https://www.payfast.co.za/eng/process"; // PayFast processing URL
    const params = {
        merchant_id: "24807472",
        merchant_key: "6uee48qso8z7k",
        amount: totalAmount.toFixed(2),
        item_name: "Event Tickets",
        name_first: fullName.split(' ')[0],
        name_last: fullName.split(' ').slice(1).join(' ') || 'Customer',
        email_address: email,
        m_payment_id: "EventTickets123", // Unique payment ID
        // Additional parameters as required by PayFast
        return_url: "http://localhost:8080/EventsManagement3.0/ticket.jsp",
        cancel_url: "http://localhost:8080/EventsManagement3.0/DashboardServlet",
        notify_url: "http://your-notify-url.com"
    };

    // Create form for PayFast
    const form = document.createElement("form");
    form.method = "POST";
    form.action = payfastUrl;

    for (const key in params) {
        const hiddenField = document.createElement("input");
        hiddenField.type = "hidden";
        hiddenField.name = key;
        hiddenField.value = params[key];
        form.appendChild(hiddenField);
    }

    document.body.appendChild(form);
    form.submit(); // Submit the form to PayFast
	generateTickets();
    return true;
}

// Proceed to payment using PayFast from cart modal
function proceedToPayment() {
    // Trigger the payment form submission
    const paymentForm = document.getElementById('paymentForm');
    paymentForm.requestSubmit(); // Modern browsers
}

// Function to generate tickets after successful payment
function generateTickets() {
    const ticketContainer = document.getElementById('ticket-container');
    ticketContainer.innerHTML = ''; // Clear any existing tickets

    cartItems.forEach((item, index) => {
        const ticketDiv = document.createElement('div');
        ticketDiv.classList.add('ticket');
        ticketDiv.style.border = '1px solid #3498db';
        ticketDiv.style.padding = '10px';
        ticketDiv.style.marginBottom = '10px';

        const ticketName = document.createElement('p');
        ticketName.textContent = `Ticket ${index + 1}: ${item.name}`;
        
        const ticketPrice = document.createElement('p');
        ticketPrice.textContent = `Price: R${item.price.toFixed(2)}`;

        ticketDiv.appendChild(ticketName);
        ticketDiv.appendChild(ticketPrice);
        ticketContainer.appendChild(ticketDiv);
    });

    alert('Your ticket(s) will be generated after payment');
}


// Close modals when clicking outside content
window.onclick = function(event) {
    const detailsModal = document.getElementById('detailsModal');
    const cartModal = document.getElementById('cartModal');
    if (event.target === detailsModal) {
        detailsModal.style.display = "none";
        detailsModal.setAttribute('aria-hidden', 'true');
    }
    if (event.target === cartModal) {
        cartModal.style.display = "none";
        cartModal.setAttribute('aria-hidden', 'true');
    }
}

