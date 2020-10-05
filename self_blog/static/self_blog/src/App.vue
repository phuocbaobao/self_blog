<template>
  <v-app>
    <v-container>
      <nav-bar />
      <router-view></router-view>
    </v-container>
  </v-app>
</template>

<script>
import NavBar from "@/components/common/NavBar.vue";

export default {
  name: "App",

  components: {
    NavBar
  },

  data: () => ({
    //
  })
};
</script>
