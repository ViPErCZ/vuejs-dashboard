<template>

    <div>
        <div class="row">

    <!--        <info-->
    <!--            icon="icon-lg pe-7f-cart"-->
    <!--            bgclass="bg-flat-color-1"-->
    <!--            symbol="$"-->
    <!--            counter=23569-->
    <!--            title="Revenue"-->
    <!--        >-->
    <!--        </info>-->

    <!--        <info-chart-->
    <!--            icon="icon-lg pe-7f-cart"-->
    <!--            symbol="%"-->
    <!--            hasPercentage="yes"-->
    <!--            bgclass="bg-flat-color-6"-->
    <!--            counter=85-->
    <!--            canvasId="flotBar1"-->
    <!--            title="Sales Increase"-->
    <!--        >-->
    <!--        </info-chart>-->

    <!--        <info-->
    <!--            icon="icon-lg pe-7f-users"-->
    <!--            bgclass="bg-flat-color-3"-->
    <!--            counter=6596-->
    <!--            title="Total Clients"-->
    <!--        >-->
    <!--        </info>-->

    <!--        <info-chart-two-->
    <!--            icon="icon-lg pe-7f-cart"-->
    <!--            bgclass="bg-flat-color-2"-->
    <!--            counter=1490-->
    <!--            canvasId="flotLine1"-->
    <!--            title="New Users"-->
    <!--        >-->
    <!--        </info-chart-two>-->

    <!--        <RealTime title="Real time"/>-->
    <!--        <Traffic title="Real time"/>-->
    <!--        <EarningStats/>-->
    <!--        <Download/>-->
            <Revenue title="CPU load" :value="cpu" />
            <Memory title="Memory usage" :value="mem" />
        </div>
        <div class="row">
            <RealTime title="Network (received kbytes / second)" :value="rx_sec" :has-percentage="true" />
        </div>
    </div>

</template>

<script>
import Revenue from './dashboard/Revenue.vue';
import Memory from './dashboard/Download.vue';
import RealTime from './dashboard/RealTime.vue';

export default {
    name: 'dashboard',
    components: {
        Revenue,
        Memory,
        RealTime
    },
    data() {
        return {
            cpu: 0,
            mem: 0,
            rx_sec: 0
        }
    },
    sockets: {
        messageChannel(data) {
            this.cpu = data.avg;
        },
        messageMemory(data) {
            this.mem = (data.used / data.total) * 100;
        },
        messageNetwork(data) {
            // console.log(data);
            this.rx_sec = data.rx_sec / 1024; // kilo bytes
        }
    },
}

</script>