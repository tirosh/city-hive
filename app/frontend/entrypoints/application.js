import "./main.scss";

import { createApp } from 'vue';
import Home from "../components/views/Home.vue";
import HobbyPartner from "../components/views/HobbyPartner.vue"

if (document.querySelector('#home')) {
  const home = createApp(Home);
  home.mount('#home');
}

if (document.querySelector('#hobby-partner')) {
  const hobbyParnter = createApp(HobbyPartner);
  hobbyParnter.mount('#hobby-partner');
}

document.addEventListener('DOMContentLoaded', () => {

  // Get all "navbar-burger" elements
  const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

  // Add a click event on each of them
  $navbarBurgers.forEach( el => {
    el.addEventListener('click', () => {

      // Get the target from the "data-target" attribute
      const target = el.dataset.target;
      const $target = document.getElementById(target);

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      el.classList.toggle('is-active');
      $target.classList.toggle('is-active');

    });
  });

  // Add 'show' class to display notification on page load
  const flash = document.querySelector(".notification")
  flash.classList.add("show");

  // Set timeout to remove 'show' class after animation delay
  setTimeout(function () {
    flash.classList.remove("show");

    // Set timeout to add 'hidden' class after animation
    setTimeout(function () {
     flash.classList.add("hidden");
    }, 1000); // animation duration

  }, 4000); // animation delay
});
