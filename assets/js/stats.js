document.addEventListener('DOMContentLoaded', function() {
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const statsContainer = entry.target;
                const numbers = statsContainer.querySelectorAll('.stat-number');
                
                numbers.forEach(number => {
                    const target = parseInt(number.getAttribute('data-target'));
                    const duration = 2000; // Animation duration in milliseconds
                    const increment = target / (duration / 16); // Update every 16ms (60fps)
                    let current = 0;

                    const updateNumber = () => {
                        current += increment;
                        if (current < target) {
                            number.textContent = Math.round(current);
                            requestAnimationFrame(updateNumber);
                        } else {
                            number.textContent = target;
                            // Add % symbol for satisfaction stat
                            if (target === 100) {
                                number.textContent += '%';
                            }
                        }
                    };

                    updateNumber();
                });

                observer.unobserve(statsContainer);
            }
        });
    }, { threshold: 0.5 });

    const statsContainer = document.querySelector('.stats-container');
    if (statsContainer) {
        observer.observe(statsContainer);
    }
});
