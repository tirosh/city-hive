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
