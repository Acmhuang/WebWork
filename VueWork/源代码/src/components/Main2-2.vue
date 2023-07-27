<template>
  <div class="eltable">
    <eltable></eltable>
  </div>
</template>

<script>
import Eltable from "./Eltable.vue";
export default {
  components: { Eltable },
  name: "Main2-2",
};
</script>
<style scoped>
.eltable {
  width: 100%;
  position: absolute;
  right: 0;
  left: 100px;
  top: 50px;
}
</style>
