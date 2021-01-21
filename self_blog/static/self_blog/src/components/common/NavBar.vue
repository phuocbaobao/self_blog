<template>
  <div class="nav-bar">
    <img alt="Vue logo" height="70" src="../../assets/logo.png" />

    <div class="nav-bar__navigation">
      <router-link
        v-slot="{ navigate, isActive }"
        class="px-md-4 px-2"
        to="/home"
      >
        <nav-link :active="isActive" :navigate="navigate" text="Home" />
      </router-link>

      <router-link
        v-slot="{ navigate, isActive }"
        class="px-md-4 px-2"
        to="/blog"
      >
        <nav-link :active="isActive" :navigate="navigate" text="Blog" />
      </router-link>

      <primary-button
        class="ml-md-10 ml-4"
        text="Get to know more about me!"
        color="primary"
        :click="null"
      />
    </div>
  </div>
</template>

<script>
import NavLink from "@/components/common/NavLink"
import PrimaryButton from "@/components/common/PrimaryButton"

export default {
  components: { PrimaryButton, NavLink }
}
</script>

<style lang="scss" scoped>
.nav-bar {
  display: flex;

  &__navigation {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: flex-end;
  }
}
</style>
