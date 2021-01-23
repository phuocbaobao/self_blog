<template>
  <v-btn
    class="primary_button font-mukta text-capitalize"
    depressed
    :color="color"
    @click="click"
    >{{ text }}</v-btn
  >
</template>

<script>
export default {
  name: "primary-button",

  props: {
    text: {
      type: String,
      required: true
    },
    color: {
      type: String,
      required: true
    },
    click: {
      type: Function,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
@import "src/styles/colors";

.primary_button {
  font-weight: bold;
  //border: 2px solid red;

  &:after {
    position: absolute;
    border: 2px solid red;
  }
}
</style>
