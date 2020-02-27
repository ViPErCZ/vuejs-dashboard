import Vue from 'vue'
import App from './App.vue'
import socketio from 'socket.io-client';// import socketio from 'socket.io';
import VueSocketIO from 'vue-socket.io';

const SocketInstance = socketio.connect('http://localhost:3000', {
    query: {
        token: window.localStorage.getItem('auth')
    }
});

Vue.use(new VueSocketIO({
    debug: false,
    connection: SocketInstance
}));

new Vue({
    el: '#app',
    render: h => h(App),
    components: { App }
});