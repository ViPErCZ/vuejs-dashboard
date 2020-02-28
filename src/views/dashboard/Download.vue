<template>
    <div class="col-lg-3 col-md-6">
        <div class="card">
            <div class="card-top">
                <h4 class="card-title m-0 float-left">{{ title }}</h4><!-- /.content-title -->
                <div class="action-menu dropdown float-right">
                    <button class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Edit</a>
                        <a class="dropdown-item" href="#">Remove</a>
                        <a class="dropdown-item" href="#">Modify</a>
                    </div>
                </div><!-- /.action-menu -->

            </div><!-- /.card-top -->
            <div class="card-body p-0 pt-4 pb-4 download-chart">
                <DownloadChart :value="value" :id="id"/>
            </div>

        </div>
    </div>
</template>

<script>
    import DownloadChart from './charts/DownloadChart.vue';
    export default{
        components:{
            DownloadChart
        },
        props: {
            title: {
                type: String,
                required: true,
                default: ''
            },
            value: {
                type: Number,
                required: true,
                default: 0
            },
            id: {
                type: String,
                required: true
            }
        }
    }

</script>

<style scoped>
    .download-chart{
        height: 225px;
    }
    canvas{
        min-width: inherit;
    }
</style>