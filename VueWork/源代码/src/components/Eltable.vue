<template>
  <div class="eltable">
    <h3>操作记录</h3>
    <el-table :data="tableData">
      <el-table-column prop="time" label="时间"></el-table-column>
      <el-table-column prop="user" label="用户"></el-table-column>
      <el-table-column prop="ip" label="IP地址"></el-table-column>
      <el-table-column prop="operation" label="操作内容">
        <template slot-scope="scope">{{ scope.row.operation }}</template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  name: "Eltable",
  data() {
    return {
      tableData: [
        {
          time: "2021-06-01 10:17:32",
          user: "张三",
          ip: "192.168.1.100",
          operation: "登陆",
        },
        {
          time: "2021-06-01 11:23:08",
          user: "李四",
          ip: "192.168.1.101",
          operation: "退出登陆",
        },
        {
          time: "2021-06-02 15:02:17",
          user: "王五",
          ip: "192.168.1.102",
          operation: "登陆",
        },
      ],
    };
  },
};
</script>
<style scoped>
.eltable {
  width: 600px;
  position: absolute;
  right: 417px;
  bottom: 74px;
}
</style>
