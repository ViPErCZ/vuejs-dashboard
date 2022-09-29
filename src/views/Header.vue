<template>
    <header id="basix-header" class="header">
        <div class="header-menu">
            <div class="row">
                <div class="col-sm-7">

                    <div class="header-left" :class="{'open': isSearch, '': !isSearch }">
                        <button
                                class="search-trigger"
                                @click="searchClick"
                        >
                            <font-awesome-icon icon="fa-solid fa-search" />
                        </button>

                        <div class="form-inline">
                            <form class="search-form">
                                <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                <button
                                        class="search-close"
                                        type="button"
                                        @click="isSearch = !isSearch"
                                ><font-awesome-icon icon="fa-solid fa-close" /></button>
                            </form>
                        </div>

                        <div class="dropdown for-notification">
                            <button
                                    class="btn btn-secondary dropdown-toggle"
                                    type="button"
                                    id="notification" data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false"
                                    :class="{'notification-show': counterNotification > 0, '': counterNotification === 0 }"
                                    @click="handleNotification"
                                    autoClose=true
                            >
                                <font-awesome-icon icon="fa-solid fa-bell" />
                                <span class="count bg-danger" :class="{'': counterNotification > 0, 'hide': counterNotification === 0 }">{{ counterNotification }}</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </header><!-- /header -->
</template>


<script>
    /* import the fontawesome core */
    import { library } from '@fortawesome/fontawesome-svg-core'

    /* import font awesome icon component */
    import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

    /* import specific icons */
    import { faSearch } from '@fortawesome/free-solid-svg-icons'
    import { faClose } from '@fortawesome/free-solid-svg-icons'
    import { faBell } from '@fortawesome/free-solid-svg-icons'

    /* add icons to the library */
    library.add(faSearch)
    library.add(faClose)
    library.add(faBell)
    export default {
        name: 'Header',
        components: {
            FontAwesomeIcon
        },
        props: {
            currentNotification: {
                type: Number,
                required: true,
                default: 0
            }
        },
        watch: {
            currentNotification: function (newValue) {
                const warningValue = 70;
                if (this.incrementNotifyEnabled && newValue > warningValue) {
                    this.counterNotification++;
                    this.incrementNotifyEnabled = false;
                } else if (newValue < warningValue) {
                    this.incrementNotifyEnabled = true;
                }
            }
        },
        data() {
            return {
                isSearch: false,
                counterNotification: 0,
                incrementNotifyEnabled: true
            }
        },
        methods: {
            toggle(e) {
                e.target.parentElement.classList.toggle('close')
            },
            searchClick() {
                this.isSearch = !this.isSearch;
            },
            handleNotification() {
                this.counterNotification = 0;
                this.incrementNotifyEnabled = true;
            }
        }
    }
</script>

<style>
    header .form-inline .search-form button {
        cursor: pointer;
    }
</style>