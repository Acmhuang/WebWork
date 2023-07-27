<template>
  <div id="app">
    <Index msg="Welcome!" />
  </div>
</template>
<script>
import Index from "./components/Index.vue";
export default {
  name: "App",
  components: {
    Index,
  },
};
</script>
