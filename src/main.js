import { createApp } from 'vue'

import App from './App.vue'
import io from 'socket.io-client'
import VueSocketIOExt from 'vue-socket.io-extended'

// const socket = io('http://localhost:3000')

const app = createApp(App)
app.use(VueSocketIOExt, io("ws://localhost:3000"))
// app.use(VueSocketIOExt, socket)
app.mount('#app')