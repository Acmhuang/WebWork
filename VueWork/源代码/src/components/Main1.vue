<template>
  <el-calendar><Calendar /></el-calendar>
</template>

<script>
import Calendar from "./Calendar.vue";
export default {
  components: { Calendar },
  name: "Main1",
};
</script>

<style scoped>
.el-calendar {
  float: left;
  font-size: xx-large;
  width: 700px;
  transform: scale(0.3);
  background-color: #fff;
}
h3 {
  text-align: left;
}
</style>
