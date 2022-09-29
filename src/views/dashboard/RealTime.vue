<template>
    <div class="col-lg-6">
        <div class="card">
            <div class="card-top">
                <h4 class="card-title m-0 float-left">{{ title }}</h4><!-- /.content-title -->
                <div class="float-right text-r">
                    <button class="content-settings" data-toggle="tooltip" data-placement="top" title="Settings">
                      <font-awesome-icon icon="fa-solid fa-cog" />
                    </button>
                    <button class="content-collapse" data-toggle="tooltip" data-placement="top" title="Collapse">
                      <font-awesome-icon icon="fa-solid fa-angle-down" />
                    </button>
                    <button class="content-close" data-toggle="tooltip" data-placement="top" title="Close">
                      <font-awesome-icon icon="fa-solid fa-close" />
                    </button>
                </div>

            </div><!-- /.card-top -->
            <div class="card-body p-0">
                <real-time-chart canvasId="flotRealtime2" class="flotRealtime2" :value="value"></real-time-chart>
            </div>

        </div>
    </div>

</template>

<script>
import RealTimeChart from './charts/RealTimeChart.vue';
/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import {faAngleDown, faEllipsisVertical} from '@fortawesome/free-solid-svg-icons'
import { faCog } from '@fortawesome/free-solid-svg-icons'
import { faClose } from '@fortawesome/free-solid-svg-icons'

/* add icons to the library */
library.add(faAngleDown)
library.add(faCog)
library.add(faClose)

export default{
    props: ['icon', 'symbol', 'counter', 'title', 'bgclass', 'hasPercentage', 'canvasId', 'value'],
    components:{
        RealTimeChart,
        FontAwesomeIcon
    }
}
</script>