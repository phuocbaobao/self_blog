import Vue from "vue"
import VueRouter from "vue-router"
import Blog from "@/views/Blog.vue"
import Home from "@/views/Home"

Vue.use(VueRouter)

const routes = [
  {
    path: "/",
    redirect: "/home"
  },
  {
    path: "/home",
    name: "Home",
    component: Home
  },
  {
    path: "/blog",
    name: "Blog",
    component: Blog
  }
]

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
})

export default router
