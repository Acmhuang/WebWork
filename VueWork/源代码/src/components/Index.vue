<template>
  <div class="container">
    <el-container style="height: 100%">
      <el-header><Header /></el-header>
      <el-container>
        <el-aside width="200px"><Aside /></el-aside>
        <el-main><router-view></router-view></el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import Header from "./Header";
import Aside from "./Aside";
import Main from "./Main";

export default {
  name: "Index",
  components: { Header, Aside, Main },
  props: {
    msg: String,
  },
};
</script>
<style>
.el-header {
  background-color: #c4cbcf;
  text-align: center;
  line-height: 60px;
}

.el-aside {
  text-align: center;
  line-height: 200px;
}

.el-main {
  background-color: #e9eef3;
  color: #333;
  text-align: center;
  padding: 0;
}

body > .el-container {
  margin-bottom: 40px;
}

.container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
</style>
