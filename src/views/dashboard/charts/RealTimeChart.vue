<script>
    import Vue from 'vue';
    import jquery from 'jquery'

    import '../../../assets/js/lib/flot-chart/jquery.flot.js';
    import '../../../assets/js/lib/flot-chart/jquery.flot.pie.js';
    import '../../../assets/js/lib/flot-chart/jquery.flot.spline.js';


    export default {
        name: 'dashboard-realtime-chart',
        props: {
            value: {
                type: Number,
                default: 50
            }
        },
        watch: {
            value: function (newVal) {
                if (this.data.length > 48) {
                    this.data = this.data.slice(1);
                }

                this.data.push(newVal);
                var yMax = 0;
                var formatingData = [];
                for (var i = 0; i < this.data.length; ++i) {
                    formatingData.push([i, this.data[i]]);
                    if (this.data[i] > yMax) {
                        yMax = this.data[i];
                    }
                }

                this.plot.getAxes().yaxis.options.max = yMax + 100;
                this.plot.setupGrid();
                this.plot.setData([formatingData]);
                this.plot.draw();
            }
        },
        data() {
            return {
                canvasId: 'flotRealtime2',
                data: [],
                plot: ''
            }
        },
        template: "<div :id='canvasId' style='height: 400px'></div>",
        mounted() {
            function formatting(data) {
                var res = [];
                for (var i = 0; i < data.length; ++i) {
                    res.push([i, data[i]])
                }
                return res;
            }

            while (this.data.length < 50) {
                this.data.push(0);
            }

            this.plot = jQuery.plot('#flotRealtime2', [formatting(this.data)], {
                colors: ['#5c6bc0'],

                series: {
                    // label: 'Upload',
                    lines: {
                        show: true,
                        lineWidth: 0,
                        fill: 0.9
                    },
                    shadowSize: 0 // Drawing is faster without shadows
                },
                grid: {
                    show: false
                },
                xaxis: {
                    color: '#eee',
                    font: {
                        size: 10,
                        color: '#6a7074'
                    }
                },
                yaxis: {
                    min: 0,
                    max: 1000,
                    color: '#eee',
                    font: {
                        size: 10,
                        color: '#6a7074'
                    }
                }
            });
        }
    }
</script>