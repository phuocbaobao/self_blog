<template>
  <div class="nav-bar">
    <h1>Hello</h1>
    <div class="nav-bar__navigation">
      <router-link to="/blog">Home</router-link>
      <router-link to="/blog">Blog</router-link>
    </div>
  </div>
</template>

<style lang="scss" scoped>
.nav-bar {
  display: flex;
  justify-content: space-between;
}
</style>
