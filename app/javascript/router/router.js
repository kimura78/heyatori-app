import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import GroupNew from '../views/GroupNew.vue'
import GroupShow from '../views/GroupShow.vue'

Vue.use(VueRouter)

const routes = [
  { path: '/',  name: 'Home', component: Home },
  { path: '/groups/new', name: 'GroupNew', component: GroupNew },
  { path: '/groups/:id', name: 'GroupShow', component: GroupShow },
];

export default new VueRouter({ routes });