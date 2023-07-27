import VueRouter from "vue-router"
import Index from "../components/Index";
const routes = [
  //一级路由
  {
    path: '/index',
    name: 'index',
    component: Index,
    redirect: '/index/Main',
    //路由嵌套
    children: [
      { path: '/index/Main', component: () => import('../components/Main.vue') },
      { path: '/index/menu1', component: () => import('../components/Main.vue') },
      { path: '/index/menu2-1', component: () => import('../components/Main2-1.vue') },
      { path: '/index/menu2-2', component: () => import('../components/Main2-2.vue') },
      { path: '/index/menu3', component: () => import('../components/Main3.vue') },
      { path: '/index/menu4', component: () => import('../components/Main4.vue') },
    ]
  }
]

const router = new VueRouter({
  mode: 'hash',
  routes
})
export default router;
