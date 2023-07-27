<template>
  <div style="height: 100%">
    <el-menu
      background-color="#131824"
      text-color="#ffffff"
      active-text-color="#ffd04b"
      class="el-menu-vertical-demo"
      router
    >
      <el-menu-item index="/index/menu1"
        ><i class="el-icon-location"></i>概要</el-menu-item
      >
      <el-submenu>
        <template slot="title"
          ><i class="el-icon-document"></i><span>数据分析</span></template
        >
        <el-menu-item index="/index/menu2-1">图表</el-menu-item>
        <el-menu-item index="/index/menu2-2">表格</el-menu-item>
      </el-submenu>
      <el-menu-item index="/index/menu3"
        ><i class="el-icon-setting"></i>设置</el-menu-item
      >
      <el-menu-item index="/index/menu4"
        ><i class="el-icon-setting"></i>关于</el-menu-item
      >
    </el-menu>
  </div>
</template>

<script>
export default {
  name: "Aside",
  methods: {
    handleOpen(key, keyPath) {
      console.log("打开：", key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log("关闭：", key, keyPath);
    },
    handSelect(key, keyPath) {
      console.log("选择：", key, keyPath);
    },
  },
};
</script>

<style scoped>
.el-menu-vertical-demo {
  height: 100%;
}
.el-icon-location {
  line-height: 2.7;
}
.el-icon-document {
  line-height: 2.7;
}
.el-icon-setting {
  line-height: 2.7;
}
li {
  text-align: left;
  background-color: #131824;
}
</style>
