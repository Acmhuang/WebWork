<template>
  <div>
    <h3>统计数据</h3>
    <el-container style="height: 100%">
      <el-calendar><Calendar /></el-calendar>
    </el-container>
    <pie-chart :data="browserData" />
    <line-chart></line-chart>
    <div class="dashboard-wrapper">
      <div class="dashboard-top-left">
        <!-- 日点击数 -->
        <el-card class="dashboard-card">
          <h3 class="dashboard-title">日点击数</h3>
          <div class="dashboard-content">
            <p>今日点击量:9999</p>
          </div>
        </el-card>
      </div>
      <div class="dashboard-top-right">
        <!-- 周点击数 -->
        <el-card class="dashboard-card">
          <h3 class="dashboard-title">周点击数</h3>
          <div class="dashboard-content">
            <p>本周点击量:9999</p>
          </div>
        </el-card>
      </div>
      <div class="dashboard-bottom-left">
        <!-- 平均停留时间 -->
        <el-card class="dashboard-card">
          <h3 class="dashboard-title">平均停留时间</h3>
          <div class="dashboard-content">
            <p>9999 Min</p>
          </div>
        </el-card>
      </div>
      <div class="dashboard-bottom-right">
        <!-- 日活跃 -->
        <el-card class="dashboard-card">
          <!-- 标题、内容... -->
          <h3 class="dashboard-title">日活跃</h3>
          <div class="dashboard-content">
            <p>99.99</p>
          </div>
        </el-card>
      </div>
    </div>
    <eltable></eltable>
  </div>
</template>

<script>
import Calendar from "./Calendar.vue";
import PieChart from "./PieChart.vue";
import LineChart from "./LineChart.vue";
import Eltable from "./Eltable.vue";
export default {
  name: "Main",
  components: { Calendar, PieChart, LineChart, Eltable },
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
.piechart {
  width: 280px;
  height: 277px;
  position: absolute;
  left: 100px;
  margin-top: 39px;
  background-color: aliceblue;
}
h3 {
  float: left;
}
.el-calendar {
  top: -110px;
  left: 10px;
  position: absolute;
  font-size: xx-large;
  width: 700px;
  transform: scale(0.4);
  background-color: #fff;
}
.dashboard-wrapper {
  position: relative;
  width: 300px;
  height: 200px;
  margin-top: 350px;
  margin-left: 10px;
}
.dashboard-top-left {
  position: absolute;
  top: 0;
  left: 0;
  width: 50%;
  height: 50%;
}
.dashboard-top-right {
  position: absolute;
  top: 0;
  right: 0;
  width: 50%;
  height: 50%;
}
.dashboard-bottom-left {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 50%;
  height: 50%;
}
.dashboard-bottom-right {
  position: absolute;
  bottom: 0;
  right: 0;
  width: 50%;
  height: 50%;
}
.dashboard-card {
  flex-basis: calc(25% - 20px);
  margin: 0 10px;
  height: 75px;
}
.dashboard-title {
  position: absolute;
  top: 0;
  left: 1;
  font-size: 3px;
  color: darkgrey;
}
.dashboard-content {
  font-weight: bold;
  size: 10px;
}
</style>
