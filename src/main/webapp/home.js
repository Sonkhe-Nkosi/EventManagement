
// Array of image sources
const images = ['http://localhost:8080/EventsManagement/images/img1.jpg', 'http://localhost:8080/EventsManagement/images/img2.jpg', 'http://localhost:8080/EventsManagement/images/img3.jpg', 'http://localhost:8080/EventsManagement/images/img4.jpg', 'http://localhost:8080/EventsManagement/images/img5.jpg', 'http://localhost:8080/EventsManagement/images/img6.jpg', 'http://localhost:8080/EventsManagement/images/img7.jpg'];
const imageSlider = document.getElementById('imageSlider');

// Create and append the images
images.forEach((src) => {
    const img = document.createElement('img');
    img.src = src;
    imageSlider.appendChild(img);
});

// Function to animate the sliding effect
let offset = 0;
const slideImages = () => {
    offset -= 1; // Move left by 1px
    if (offset <= -100 * images.length) {
        offset = 0; // Reset offset when all images have slid out
    }
    imageSlider.style.transform = `translateX(${offset}vw)`;
};

// Slide the images smoothly every 50 milliseconds
setInterval(slideImages, 120); // Increased frequency for smoother movement

// Search functionality
const searchButton = document.getElementById('searchButton');
const searchInput = document.getElementById('searchInput');

searchButton.addEventListener('click', () => {
    const query = searchInput.value.trim();
    if (query) {
        // Replace with your search logic or redirection
        window.open(`https://www.google.com/search?q=${encodeURIComponent(query)}`, '_blank');
    } else {
        alert('Please enter a search term.');
    }
});

// Optional: Allow pressing Enter to search
searchInput.addEventListener('keypress', (event) => {
    if (event.key === 'Enter') {
        searchButton.click();
    }
});
