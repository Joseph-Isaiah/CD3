import SmoothScroll from 'smooth-scroll'

const initSmoothScroll = () => {
  window.smoothScrollTo = new SmoothScroll().animateScroll;

  const multiScreenForm = document.querySelector('.multi-screen-form');
  if (!multiScreenForm) return;

  multiScreenForm.addEventListener('click', event => {
    const clickedTarget = event.target;

    if(!clickedTarget.closest(".scroll-next")) return;

    const nextScreen = clickedTarget.closest('.form-screen').nextElementSibling;
    setTimeout(_ => { window.smoothScrollTo(nextScreen) }, 5)
  });
};

export { initSmoothScroll };
