<template>
  <div>
    <div ref="chart" class="chart"></div>
  </div>
</template>

<script>
import * as echarts from "echarts";

export default {
  name: "PieChart",
  props: {
    data: Array,
  },
  mounted() {
    this.initChart();
  },
  methods: {
    initChart() {
      const chartDom = this.$refs.chart;
      const myChart = echarts.init(chartDom);
      const option = {
        title: {
          text: "浏览器统计",
          left: "left",
        },
        tooltip: {
          trigger: "item",
        },
        legend: {
          orient: "horizontal",
          bottom: 0,
          data: ["Chrome", "Firefox", "Edge", "Other"],
        },
        series: [
          {
            name: "Browser usage",
            type: "pie",
            radius: ["40%", "60%"],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: "center",
            },
            emphasis: {
              label: {
                show: true,
                fontSize: "40",
                fontWeight: "bold",
              },
            },
            labelLine: {
              show: false,
            },
            data: this.data,
          },
        ],
      };
      myChart.setOption(option);
    },
  },
};
</script>
<style scoped>
.chart {
  width: 280px;
  height: 277px;
  position: absolute;
  left: 520px;
  margin-top: 39px;
  background-color: aliceblue;
}
</style>