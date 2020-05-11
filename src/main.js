import Vue from 'vue'
import App from './App.vue'
import io from 'socket.io-client';
import VueSocketIOExt from 'vue-socket.io-extended';

const socket = io('http://localhost:3000');
Vue.use(VueSocketIOExt, socket);

new Vue({
    el: '#app',
    render: h => h(App),
    components: { App }
});
