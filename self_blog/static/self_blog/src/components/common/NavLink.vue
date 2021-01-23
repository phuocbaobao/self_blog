<template>
  <div class="nav_link">
    <h3
      :class="{ 'nav_link__route--active': active }"
      class="nav_link__route font-mukta"
      @click="navigate"
    >
      {{ text }}
    </h3>
  </div>
</template>

<script>
export default {
  name: "nav-link",

  props: {
    text: {
      type: String,
      required: true
    },
    navigate: {
      type: Function,
      required: true
    },
    active: {
      type: Boolean,
      required: true
    }
  }
}
</script>

<style lang="scss" scoped>
@import "src/styles/colors";

.nav_link {
  &__route {
    position: relative;
    color: #6c7074;
    font-weight: normal;
    font-size: 24px;

    &:hover {
      cursor: pointer;

      &:after {
        width: calc(100% + 6px);
      }
    }

    &:after {
      transition: width 0.5s ease;
      position: absolute;
      content: "";
      height: 2px;
      width: 0;
      bottom: -1px;
      left: -3px;
      right: -3px;
      background-color: $primary-color;
    }

    &--active {
      color: black;
      font-weight: bold;

      &:after {
        width: calc(100% + 6px);
      }
    }
  }
}
</style>
