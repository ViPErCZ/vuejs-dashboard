<template>
    <div>
        <canvas ref="gauge" :height="height" :width="width"></canvas>
    </div>
</template>

<script>
    import { Gauge } from "gaugeJS/dist/gauge.min";
    export default {
        name: "RevenueChart",
        props: {
            unit: {
                type: String,
                default: ""
            },
            height: {
                type: String,
                default: "150px"
            },
            width: {
                type: String,
                default: "300px"
            },
            decimalPlace: {
                type: Number,
                default: 0
            },
            gaugeValueClass: {
                type: String,
                default: ""
            },
            top: {
                type: Boolean,
                default: false
            },
            maxValue: {
                type: Number,
                default: 100
            },
            minValue: {
                type: Number,
                default: 0
            },
            options: {
                type: Object,
                default: function() {
                    return {
                        angle: 0.15,
                        lineWidth: 0.44,
                        radiusScale: 1,
                        pointer: {
                            length: 0.6,
                            strokeWidth: 0.035,
                            color: "#000000"
                        },
                        limitMax: true,
                        limitMin: true,
                        colorStart: "#6FADCF",
                        colorStop: "#8FC0DA",
                        strokeColor: "#E0E0E0",
                        generateGradient: true,
                        highDpiSupport: true
                    };
                }
            },
            animationSpeed: {
                type: Number,
                default: 10
            },
            initialValue: {
                type: Number,
                default: 0
            },
            value: {
                type: Number,
                default: 50
            }
        },
        data() {
            return {
                gauge: null
            };
        },
        mounted() {
            this.initializeGauge();
        },
        watch: {
            value: function(newVal) {
                this.gauge.set(newVal);
            }
        },
        methods: {
            initializeGauge() {
                this.gauge = new Gauge(this.$refs.gauge);
                this.gauge.maxValue = this.maxValue;
                this.gauge.setMinValue(this.minValue);
                this.gauge.animationSpeed = this.animationSpeed;
                this.gauge.setOptions(this.options);
                this.gauge.set(this.value);
            }
        }
    };
</script>

<style scoped>
    .gauge-title span {
        display: inline;
        text-align: center;
    }
</style>