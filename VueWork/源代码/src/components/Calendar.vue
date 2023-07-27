<template>
  <div>
    <el-calendar v-model="selectDate">
      <template slot="dateCell" slot-scope="{ date, data }">
        <span>{{ dealMyDate(data.day, data) }}</span>
        <p :title="data.content">
          {{ data.day.split("-").slice(2).join("") }}<br />
          <i v-if="data.isShowContent"></i>
        </p> </template
    ></el-calendar>
  </div>
</template>

<script>
export default {
  name: "Calendar",
  props: {
    resDate: {
      default: [],
      type: Array,
    },
  },
  data() {
    return {
      selectDate: "",
    };
  },
  created() {
    //渲染日程初始化月份
    this.selectDate = new Date();
  },
  methods: {
    dealMyDate(v, data) {
      Object.assign(data, { isShowContent: false });
      Object.assign(data, { content: "" });
      let len = this.resDate.length;
      let res = "";
      for (let i = 0; i < len; i++) {
        if (this.resDate[i].date == v) {
          res = "";
          Object.assign(data, { isShowContent: true });
          Object.assign(data, { content: this.resDate[i].content });
          break;
        }
      }
      return res;
    },
  },
  watch: {
    selectDate: {
      handler(val, old) {
        let date = new Date(val);
        let date1 = new Date(old);
        let yy = date.getFullYear();
        let yy1 = date1.getFullYear();
        let mm =
          date.getMonth() + 1 < 10
            ? "0" + (date.getMonth() + 1)
            : date.getMonth() + 1;
        let mm1 =
          date1.getMonth() + 1 < 10
            ? "0" + (date1.getMonth() + 1)
            : date1.getMonth() + 1;
        let mm2 = date.getMonth() + 1;
        //如果新值和旧值所在的月份相同，则不触发方法。
        if (yy + "-" + mm != yy1 + "-" + mm1) {
          this.$emit("watchChild", yy + "-" + mm, mm2);
        }
      },
      deep: true,
    },
  },
};
</script>
<style scoped>
</style>

