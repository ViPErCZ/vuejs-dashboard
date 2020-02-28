<template>
  <div class="chart-download">
    <canvas ref="gauge" width="160px" height="160px" v-bind:id="id" class="download-chart"></canvas>
    <span v-bind:id="valueId" class="gauge-value">{{ percentage }} %</span>
  </div>
</template>

<script>

import { Donut } from 'gaugeJS';

export default {
  props: {
    value: {
      type: Number,
      default: 50
    },
    id: {
      type: String,
      required: true
    }
  },
  computed: {
    valueId: function () {
      return 'value-' + this.id;
    },
    percentage: function () {
      let result = this.value.toFixed();
      if (this.value < 100) {
        result = ' ' + this.value.toFixed();
      }
      return result;
    }
  },
  data() {
    return {
      gauge: null
    };
  },
  mounted() {
    var opts = {
      lines: 14,
      angle: 0.5,
      lineWidth: 0.1,
      limitMax: 'false',
      percentColors: [[0.0, "#cccccc"], [0.50, "#ffff00"], [1.0, "#ff0000"]],
      strokeColor: '#ffa726',
      highDpiSupport: true,

      colorStart: '#cdcdcd',
      colorStop: '#ffa726',
      strokeColor: '#e6e9ec',
      generateGradient: true
    };
    var target = document.getElementById(this.id);
    this.gauge = new Donut(target).setOptions(opts);
    this.gauge.maxValue = 100;
    this.gauge.animationSpeed = 40;
    this.gauge.set(this.value);

    //this.gauge.setTextField(document.getElementById(this.valueId));
  },
  watch: {
    value: function(newVal) {
      this.gauge.set(newVal);
      if (newVal <= 60) {
        this.gauge.options.colorStop = '#186f03';
      } else if (newVal >= 90) {
        this.gauge.options.colorStop = '#ff0000';
      }
    }
  },
}

</script>


<style scoped>
  .download-chart {
    margin-left: 30%;
    margin-top: 2%;
  }
  .gauge-value {
      color: #000 !important;
      -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
      text-anchor: middle;
      font-family: Arial;
      font-size: 29px;
      font-weight: bold;
      fill-opacity: 1;
      position: absolute;
      left: 43%;
      top: 38%;
  }
</style>