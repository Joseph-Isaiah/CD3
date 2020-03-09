import SmoothScroll from 'smooth-scroll'

const initSmoothScroll = () => {
  window.smoothScrollTo = new SmoothScroll().animateScroll;

  const nextScrollLinks = document.querySelectorAll('.scroll-next');
  nextScrollLinks.forEach(link => {
    const nextScreen = link.closest('.form-screen').nextElementSibling;
    link.addEventListener('click', _ => {
      setTimeout(_ => { window.smoothScrollTo(nextScreen) }, 5)
    });
  });
};

export { initSmoothScroll };
