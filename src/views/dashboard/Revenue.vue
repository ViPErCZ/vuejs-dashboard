<template>
    <div class="col-lg-3 col-md-6">
        <div class="card revenue">
            <div class="card-top">
                <h4 class="card-title m-0 float-left">{{ title }}</h4><!-- /.content-title -->
                <div class="action-menu dropdown float-right">
                    <button class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <font-awesome-icon icon="fa-solid fa-ellipsis-vertical" />
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Edit</a>
                        <a class="dropdown-item" href="#">Remove</a>
                        <a class="dropdown-item" href="#">Modify</a>
                    </div>
                </div><!-- /.action-menu -->

            </div><!-- /.card-top -->
            <div class="card-body p-0 pt-2">
                
                <div class="gauge g2 pb-0">
                    <RevenueChart :value="value"/>
                </div>

            </div>

            <div class="card-footer br-0 pb-4 mb-2 bg-white">
                <h6 class="mb-0 float-left">
                    <span class="count" v-text="percent"></span>
                </h6>
                <h6 class="mb-0 fw-r float-right">
<!--                    <i class="fa fa-arrow-circle-down color-red"></i>-->
                    <span>&nbsp;</span> <!-- prava strana paticky pro dalsi info -->
                </h6>
            </div><!-- /.card-footer -->

        </div>
    </div>
</template>

<script>
    import RevenueChart from './charts/RevenueChart.vue';
    /* import the fontawesome core */
    import { library } from '@fortawesome/fontawesome-svg-core'

    /* import font awesome icon component */
    import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

    /* import specific icons */
    import { faEllipsisVertical } from '@fortawesome/free-solid-svg-icons'

    /* add icons to the library */
    library.add(faEllipsisVertical)

    export default {
        name: "Revenue",
        components:{
            RevenueChart,
            FontAwesomeIcon
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
            }
        },
        computed: {
            percent: function () {
                return this.value.toFixed(2) + '%';
            }
        }
    }

</script>

<style scoped>
    .g2 {
       text-align: center;
    }
</style>