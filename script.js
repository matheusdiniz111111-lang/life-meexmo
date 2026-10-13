const enterBtn = document.getElementById('enterBtn');
const loginScreen = document.getElementById('login-screen');
const dashboardScreen = document.getElementById('dashboard-screen');
const tabs = document.querySelectorAll('.tab');
const panels = document.querySelectorAll('.panel');

enterBtn?.addEventListener('click', () => {
  loginScreen.classList.remove('active');
  dashboardScreen.classList.add('active');
});

tabs.forEach((tab) => {
  tab.addEventListener('click', () => {
    const target = tab.dataset.tab;
    tabs.forEach((el) => {
      el.classList.toggle('active', el === tab);
      el.setAttribute('aria-selected', String(el === tab));
    });

    panels.forEach((panel) => {
      panel.classList.toggle('active', panel.id === target);
    });
  });
});
