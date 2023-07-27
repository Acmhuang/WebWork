<template>
  <div id="line-chart" class="chart"></div>
</template>

<script>
import * as echarts from "echarts";

export default {
  mounted() {
    // 基于准备好的dom，初始化echarts实例
    const myChart = echarts.init(document.getElementById("line-chart"));

    const option = {
      title: {
        text: "一年内网站访问量统计",
      },
      tooltip: {},
      xAxis: {
        type: "category",
        data: [
          "一月",
          "二月",
          "三月",
          "四月",
          "五月",
          "六月",
          "七月",
          "八月",
          "九月",
          "十月",
          "十一月",
          "十二月",
        ],
      },
      yAxis: {
        type: "value",
      },
      series: [
        {
          name: "访问量",
          type: "line",
          data: [120, 200, 150, 80, 70, 110, 130, 190, 220, 250, 180, 160],
          markPoint: {
            data: [
              {
                type: "max",
                name: "最大值",
              },
              {
                type: "min",
                name: "最小值",
              },
            ],
          },
          markLine: {
            data: [
              {
                type: "average",
                name: "平均值",
              },
            ],
          },
        },
      ],
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
  },
};
</script>
<style>
.chart {
  width: 600px;
  height: 277px;
  position: absolute;
  background-color: aliceblue;
  left: 825px;
  margin-top: 39px;
}
</style>