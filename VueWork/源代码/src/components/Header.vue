<template>
  <header>
    <div>
      <h1 style="margin-top: -10px; color: #425049; font-size: 30px">
        <input
          type="text"
          class="search"
          v-model="searchQuery"
          placeholder="搜索"
        />
      </h1>
    </div>
    <div class="opt-wrapper">
      <el-dropdown :hide-on-click="false">
        <div class="demo-basic--circle">
          <div class="block">
            <!-- <el-avatar :size="40" :src="avatar" :class="['avatar-info']">
            </el-avatar> -->
            <div class="avatar-info">
              <i class="el-icon-setting"></i>黄成洺(2110817325)
            </div>
          </div>
        </div>
        <el-dropdown-menu
          slot="dropdown"
          style="margin-top: -30px; margin-left: -40px"
        >
          <el-dropdown-item
            ><i class="el-icon-info"></i>个人中心</el-dropdown-item
          >
          <el-dropdown-item
            ><i class="el-icon-switch-button"></i>退出登录</el-dropdown-item
          >
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </header>
</template>


<script>
export default {
  name: "Header",
  data() {
    return {
      avatar:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
    };
  },
};
</script>

<style scoped>
header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  color: #fff;
}
/*设定头像图片样式*/
.avatar-info {
  margin-bottom: 10px;
  cursor: pointer;
  color: #000;
}
.search {
  margin-left: 200px;
  height: 30px;
  width: 400px;
}
</style>
