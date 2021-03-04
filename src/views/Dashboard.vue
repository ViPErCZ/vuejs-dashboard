<template>
    <div>
        <div class="row">
            <Revenue title="CPU usage" :value="cpu" />
            <Memory title="Memory usage" :value="mem" id="memory" />
            <Disk title="Disk usage" :value="disksize" id="disksize" />
        </div>
        <div class="row">
            <RealTime title="Network (received kbytes / second)" :value="rx_sec" :has-percentage="true" />
        </div>
    </div>
</template>

<script>
import Revenue from './dashboard/Revenue.vue';
import Memory from './dashboard/Download.vue';
import Disk from './dashboard/Download.vue';
import RealTime from './dashboard/RealTime.vue';

export default {
    name: 'dashboard',
    components: {
        Revenue,
        Memory,
        RealTime,
        Disk
    },
    data() {
        return {
            cpu: 0,
            mem: 0,
            rx_sec: 0,
            disksize: 0
        }
    },
    sockets: {
        messageCPU(data) {
            this.cpu = data.currentLoadSystem;
            this.$emit('notification', this.cpu);
        },
        messageMemory(data) {
            this.mem = (data.active / data.total) * 100;
        },
        messageNetwork(data) {
            // console.log(data);
            this.rx_sec = data.rx_sec / 1024; // kilo bytes
        },
        messageDiskspace(data) {
            this.disksize = data.use; // used in %
        }
    },
}

</script>