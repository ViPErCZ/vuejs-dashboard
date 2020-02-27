<template>
  <div id="app">
    <div class="admin-container">
      <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
          <div data-v-03d0f88a="" class="navbar-header">
            <button
              data-v-03d0f88a=""
              type="button"
              data-toggle="collapse"
              data-target="#main-menu"
              aria-controls="main-menu"
              aria-expanded="false"
              aria-label="Toggle navigation"
              class="navbar-toggler"
            >
              <i data-v-03d0f88a="" class="fa fa-bars"></i>
            </button>
            <a
              data-v-03d0f88a=""
              href="#/"
              class="navbar-brand router-link-exact-active open active"
              ><img src="./images/logo.png" alt="Logo"></a>

            <a
              data-v-03d0f88a=""
              href="#/"
              class="navbar-brand hidden router-link-exact-active open active"
              ><img src="./images/logo2.png" alt="Logo"></a>
            <a data-v-03d0f88a="" id="menuToggle" class="menutoggle pull-left"
              ><i class="fa fa fa-tasks"></i
            ></a>
          </div>
          <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
              <li class="nav-item">
                <a href="#/dashboard" class=""><i class="menu-icon fa fa-dashboard"></i>
                  <span class="menu-title-text">Dashboard</span></a>
              </li>
            </ul>
          </div>
        </nav>
      </aside>
      <div id="right-panel" class="right-panel">
        <div class="content">
          <Dashboard/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Dashboard from './views/Dashboard'

  export default {
    components: {
      Dashboard
    },
    computed: {}
  };
</script>

<style lang="scss">
@import url("./assets/css/font-awesome.min.css");
@import url("./assets/css/themify-icons.css");
@import url("./assets/css/pe-icon-7-filled.css");
@import url("./assets/css/flag-icon.min.css");
@import url("./assets/css/cs-skin-elastic.css");

@import "./assets/scss/style";

button {
  cursor: pointer;
}
</style>
