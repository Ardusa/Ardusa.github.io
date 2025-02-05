// Smooth scrolling for navigation links
document.querySelectorAll('nav ul li a').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();
        document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
        });
        document.getElementById('sidebar').classList.add('collapsed');
    });
});

// Auto collapse sidebar
const sidebar = document.getElementById('sidebar');

sidebar.addEventListener('mouseenter', () => {
    sidebar.classList.remove('collapsed');
});

sidebar.addEventListener('mouseleave', () => {
    sidebar.classList.add('collapsed');
});

document.addEventListener('DOMContentLoaded', () => {
    setTimeout(() => sidebar.classList.add('collapsed'), 300);
});

console.log("Welcome to Ardusa's Personal Website!");