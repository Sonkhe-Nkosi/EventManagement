// Script to handle toggling of the registration form
const addEventIcon = document.getElementById('addEventIcon');
const registrationFormContainer = document.getElementById('registrationFormContainer');
const closeBtn = document.querySelector('.close');

addEventIcon.addEventListener('click', () => {
    registrationFormContainer.style.display = 'block';
});

closeBtn.addEventListener('click', () => {
    registrationFormContainer.style.display = 'none';
});

// Make the form draggable
const dragHandle = document.getElementById('dragHandle');
const draggable = document.querySelector('.draggable');

dragHandle.addEventListener('mousedown', function (e) {
    let shiftX = e.clientX - draggable.getBoundingClientRect().left;
    let shiftY = e.clientY - draggable.getBoundingClientRect().top;

    function moveAt(pageX, pageY) {
        draggable.style.left = pageX - shiftX + 'px';
        draggable.style.top = pageY - shiftY + 'px';
    }

    function onMouseMove(event) {
        moveAt(event.pageX, event.pageY);
    }

    document.addEventListener('mousemove', onMouseMove);

    document.addEventListener('mouseup', function () {
        document.removeEventListener('mousemove', onMouseMove);
    }, { once: true });
});

dragHandle.ondragstart = function () {
    return false;
};
