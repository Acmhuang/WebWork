<template>
  <div class="component-wrapper">
    <div>
      <pie-chart :data="browserData" />
    </div>
    <line-chart></line-chart>
  </div>
</template>

<script>
import PieChart from "./PieChart.vue";
import LineChart from "./LineChart.vue";
export default {
  name: "Main2-1",
  components: { PieChart, LineChart },
  data() {
    return {
      browserData: [
        { value: 335, name: "Chrome" },
        { value: 310, name: "Firefox" },
        { value: 135, name: "Edge" },
        { value: 310, name: "Other" },
      ],
    };
  },
};
</script>

<style scoped>
.component-wrapper {
  position: relative;
  top: 100px;
  left: 0;
  width: 50%;
  height: 50%;
  transform: scale(1.5);
}
</style>
